

![](https://github.com/MarkMH/homotopy_methods/blob/1d03f9b2e67248adc20d3d807db515c2eed6681f/images/banner_homotopy.jpg)

This very simple project is designed to solve two player normal form games for Nash Equilibria. The design is such that the algortim will find one equilibrium, 
if any exist, which does not ensure that is the unique equilibrium. Far from that, the solution is path depend, i.e., choosing a different starting point 
is likely to result in different Nash Equilibria, if more than one exists. 

The project consists of two files: 

---

1. **UseHomotopy**: In this file you can define the game to be solved. Use the matrix notation of a normal form game, and provide the players' payoff for each possible
outcome. Furthermore, define the algorithms starting point, keeping in mind that the solution will be path dependent.   

![](https://github.com/MarkMH/homotopy_methods/blob/0c1ff140360e552ace91f3fb88d51c85a3aa4c30/images/banner_usehomotopy.png)

---

2. **Homotopy**: This function is the actual algorithm that solves the two player normal form game for Nash Equilibria, keep in mind to set the right path in 
UseHomotopy 

![](https://github.com/MarkMH/homotopy_methods/blob/4f5c49e66e0839fcfecacaac80a4a5c7268a1dae/images/banner_chomotopy.png)

---

Disclaimer: This is one of my first projects, the coding is very simplistic and redundant. Should you wish to use it, I strongly advise to improving the coding before you do. 


