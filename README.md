# Cognitive Science (Evolutionary Approach)
### Implementation Report — Summary  

**Instructor:** Dr. Saeed Setaieshi  
**Prepared by:** Elham Esmaeilnia Shirvani  
**Date:** February 2018  

---

## Overview  
This project explores the use of **evolutionary computation**—specifically the **Particle Swarm Optimization (PSO)** algorithm—to model and simulate biological and cognitive phenomena based on the **evolutionary perspective** in cognitive science.  

The evolutionary approach assumes that both biological and cognitive systems evolve through adaptation and natural selection. In computational terms, these principles are used to design algorithms capable of finding optimal or near-optimal solutions to complex problems.

---

## Evolutionary Computation  
Evolutionary computation refers to a set of algorithms inspired by biological evolution. These include:
- **Genetic Algorithms (GA)**
- **Evolutionary Strategies**
- **Evolutionary Programming**

All these methods share common steps:
1. Generate an initial population of possible solutions  
2. Evaluate their fitness (quality of solution)  
3. Select the best individuals  
4. Reproduce new solutions using crossover or mutation  
5. Repeat until an optimal solution is found  

These approaches are widely applied in optimization, robotics, artificial life, and cognitive modeling.

---

## Particle Swarm Optimization (PSO)  
The **PSO algorithm** is inspired by the collective behavior of birds or fish. Each “particle” represents a candidate solution that moves through the search space influenced by:
- Its own best-known position  
- The best position found by the entire swarm  

Each particle’s velocity and position are updated iteratively to converge toward the global optimum. The algorithm works for both continuous and discrete (binary) problems.

---

## Project Goal: Dendrite Formation Simulation  
The main problem studied here is **simulating dendrite-like tree structures** using the PSO algorithm.  
Dendrites are branched extensions of neurons responsible for receiving neural signals.  
In this simulation:
- Each dendrite segment is represented by a line segment in a 2D space (10×10 grid).  
- Each segment has a fixed length and random angle between 65°–105°.  
- The goal is to rearrange these line segments to form a tree-shaped structure resembling a dendrite.

---

## Implementation Details  
- Implemented in **MATLAB**  
- Each particle represents a set of line segments (x, y, and angle).  
- The **fitness function** evaluates how “tree-like” a structure is using these metrics:
  - `same`: number of overlapping lines (negative factor)  
  - `d1`: distance between consecutive trunk lines (smaller is better)
   - `d2`: distance between branch lines and the trunk (smaller is better)  
- The total cost is computed as:  fitness = same + d1 + d2
  → Lower fitness means a better dendrite structure.

The PSO algorithm iteratively updates particles, evaluates fitness, and draws the evolving dendrite using MATLAB’s `line` function.

---

## Results  
After several iterations (e.g., 1000 runs with 10 line segments), the algorithm produces realistic dendrite-like tree structures. These results demonstrate how **evolutionary and swarm intelligence algorithms** can simulate natural and cognitive systems effectively.

---

## Keywords  
`Evolutionary Computation`, `Particle Swarm Optimization (PSO)`, `Cognitive Science`, `Dendrite Simulation`, `MATLAB Implementation`
 
  - `d2`: distance between branch lines and the trunk (smaller is better)  
- The total cost is computed as:  
