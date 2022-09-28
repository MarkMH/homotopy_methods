

![](https://github.com/MarkMH/homotopy_methods/blob/300bdef161698ff8526625a7b9648a838b246cb8/banner_homotopy.jpg)

This very simple project is designed to solve two player normal form games for Nash Equilibria. The design is such that the algortim will find one equilibrium, 
if any exist, which does not ensure that is the unique equilibrium. Far from that, the solution is path depend, i.e., choosing a different starting point 
is likely to result in different Nash Equilibria, if more than one exists. 

The project consists of two files: 

1. **UseHomotopy**: In this file you can define the game to be solved. Use the matrix notation of a normal form game, and provide the players' payoff for each possible
outcome. Furthermore, define the algorithms starting point, keeping in mind that the solution will be path dependent.   
2. **Homotopy**: This function is the actual algorithm that solves the two player normal form game for Nash Equilibria, keep in mind to set the right path in 
UseHomotopy 

Disclaimer: This is one of my first projects, the coding is very simplistic and redundant. Should you wish to use it, I strongly advise to improving the coding before you do. 


