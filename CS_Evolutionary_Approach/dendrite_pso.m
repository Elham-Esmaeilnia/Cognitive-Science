%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% initial values %%%%%%%%%%%%%
%number of iterations
iteration=700;

%size of swarms
swarm_size=1500; 

%size of  each particle,we have (x & y & Angle) for each line
particle_size=3; 

%size of lines,in fact we repmat our particle matrix,equal to the number of lines we want 
line_size=10;

%number of rows of particle matrix
row_size=line_size*particle_size;

%bounds of angles we use in this algorithm
angle_min=65; angle_max=105;
bound=(angle_max-angle_min);

%parameters use for updating
phi1 = 1.99;
phi2 = 0.3;
%phi = phi1 + phi2;
%khi = 2/abs(2-phi-sqrt(phi^2-4*phi));
khi=0.6;

%define paricle ,best ,velocity,cost matrixes
particle_position=zeros(row_size,swarm_size);
particle_best_position=zeros(row_size,swarm_size);
particle_velocity=zeros(row_size,swarm_size);
particle_cost=zeros(swarm_size,1);
particle_best_cost=[];
globalbest=[];

%define random cooardinate for each particle
% x & y must be in rang of 0 to 10 ,angle must be in range of bound
for i=1:swarm_size
    for v=1:line_size
        particle_position(((v-1)*particle_size)+1,i)=rand*10;
        particle_position(((v-1)*particle_size)+2,i)=rand*10;
        particle_position(((v-1)*particle_size)+3,i)=rand *bound+angle_min;
    end;
end

%first our best matrix is equal to our current matrix
particle_best_position=particle_position;

%calculate fitness for each group of particle in each swarms

for j=1:swarm_size
    p1=particle_best_position(:,j);
    particle_cost(j)=treecost(p1);
end
 %calculate initial global best
 [globalbest,ind]=sort(particle_cost);
 particle_global_best_cost=globalbest(1);
 particle_global_best_ind=ind(1);
 
%initial iteration
for i=1:iteration
     
    %updating velacity & position
    for j=1:swarm_size
        for v=1:row_size
            particle_velocity(v,j)=khi*particle_velocity(v,j)+phi1*(particle_best_position(v,j)-particle_position(v,j))+...
                phi2*((particle_best_position(v,particle_global_best_ind))-particle_position(v,j));
            particle_position(v,j)=particle_position(v,j)+particle_velocity(v,j);
        end
    end
    
    %%%%%%%%%%%%%5 replacing the best %%%%%%%%%%%%
    for j=1:swarm_size
        
        p2=particle_position(:,j);
        % changing best positions & particle cost if it's necessery 
        test(j)=treecost(p2);
        if particle_cost(j)>test(j)
            for v=1:row_size
                particle_best_position(v,j)=particle_position(v,j);
            end
            particle_cost(j)=test(j);
        end
        
        % checking the global best if it's necessery 
        if particle_global_best_cost>test(j)
            particle_global_best_cost=test(j);
            particle_global_best_ind=j;
        end    
        
    end
    
end

%%%%%%%%%% discription %%%%%%%%%%%%%%%%%%

axis ([0 10 0 10]);
xlabel('X');
ylabel('Y');
show = particle_best_position(:,particle_global_best_ind);
for j=1:line_size
   tree= line([show(((j-1)*particle_size)+1) (show(((j-1)*particle_size)+1)+2*...
       cosd(show(((j-1)*particle_size)+3)))],[show(((j-1)*particle_size)+2) (show(((j-1)*particle_size)+2)+2*sind(show(((j-1)*particle_size)+3)))]);
end;
p=min(particle_cost);
clc;
disp('" pso dendrite"')
disp([' best fitness in last iteration(same+d1+d2)= ' num2str(p)])


