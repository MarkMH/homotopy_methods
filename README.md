

![](https://github.com/MarkMH/homotopy_methods/blob/1d03f9b2e67248adc20d3d807db515c2eed6681f/images/banner_homotopy.jpg)

This very simple project is designed to solve two player normal form games for Nash Equilibria. The design is such that the algortim will find one equilibrium, 
if any exist, which does not ensure that is the unique equilibrium. Far from that, the solution is path depend, i.e., choosing a different starting point 
is likely to result in different Nash Equilibria, if more than one exists. 

The project consists of two files: 

---

1. **UseHomotopy**: In this file the non-degenerate bimatrix game needs to be defined. Provide the players' payoff in matrix, below you can find an example for a 3x3 game with player A and player B. Solving the game using the Homotopy function described below, leads to a Nash Equilibrium where player A plays the first strategy, while player B plays the last strategy. See sigmaH1 and sigmaH2.   

![](https://github.com/MarkMH/homotopy_methods/blob/0c1ff140360e552ace91f3fb88d51c85a3aa4c30/images/banner_usehomotopy.png)

---

2. **Homotopy**: This function is the actual algorithm that solves the non-degenerate bimatrix game for Nash Equilibria. Besides the payoff matrices defined above, this function needs a starting point, which is can be any stratey from the players strategy space, denoted by j. With w, we set the learning rate. Keep in mind that the algorithm is path dependent, thus selecting different initial strategies potentially leads to different Nash Equilibirum, if the game does not have a unique Nash Equilibirum.  

![](https://github.com/MarkMH/homotopy_methods/blob/4f5c49e66e0839fcfecacaac80a4a5c7268a1dae/images/banner_chomotopy.png)

---

Disclaimer: This is one of my first projects, the coding is very simplistic and redundant. Should you wish to use it, I strongly advise to improving the coding before you do. 


