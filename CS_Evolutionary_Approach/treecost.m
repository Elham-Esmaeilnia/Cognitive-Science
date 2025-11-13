function cost=treecost(a)    
    line_size=10;
    particle_size=3;
    row_size=line_size*particle_size;
    n1=line_size/3;
    n2=line_size/2;
    particle_group=a;  
    same=0; d1=0;  d2=0; d12=0; cnt=0;
    pedicle=[];leaf=[];   
     % calculating 'same '
     %if x & y & angle are equal,then increase same
    for j=1:line_size
        for v=j+1:line_size
            if ((abs(particle_group(((j-1)*particle_size)+1)-particle_group(((v-1)*particle_size)+1))==0)&&...
                    (abs(particle_group(((j-1)*particle_size)+2)-particle_group(((v-1)*particle_size)+2))==0)&&...
                    (abs(particle_group(((j-1)*particle_size)+3)-particle_group(((v-1)*particle_size)+3))==0))
                same = same+1;
            end
        end
    end    
   % separating leaf lines from pedicle lines
    for j=1:line_size  
        if ((particle_group(((j-1)*particle_size)+3)>85)&&(particle_group(((j-1)*particle_size)+3)<95))%then they are pedicle
         
            pedicle=[ pedicle ; particle_group(((j-1)*particle_size)+1) , particle_group(((j-1)*particle_size)+2) , particle_group(((j-1)*particle_size)+3) ];
            cnt = cnt+1;
        else
            leaf=[ leaf ; particle_group(((j-1)*particle_size)+1) , particle_group(((j-1)*particle_size)+2) , particle_group(((j-1)*particle_size)+3) ];
        end    
    end    
    % cheking if out of bound,it should be discarded
    if ~((cnt>n1)&&(cnt<n2)) 
        same = same+9999999;
    else
        pedicle=sortrows(pedicle,2);%sort pedicle base on y
        % calculating d1
        for j=1:cnt-1 
            d12=(((pedicle(j+1,2)-(pedicle(j,2)+2*sind(pedicle(j,3))))^2)+((pedicle(j+1,1)-(pedicle(j,1)+2*cosd(pedicle(j,3))))^2));
            d1 = d1+ d12;
        end
        % calculating d2
        % calculate leaf size
         leafnum=line_size-cnt ;
        for j=1:leafnum
                bignum=9999999;
            for v=1:cnt
                lp_distance = ((leaf(j,2)-(pedicle(v,2)))^2)+((leaf(j,1)-(pedicle(v,1)))^2);
                if (lp_distance<bignum)
                    bignum=lp_distance;
                end
            end
            d2 = d2+ bignum;
        end 
    end    
    %result of our fitness
    result=same+d1+d2;   
    cost=result;   
end
