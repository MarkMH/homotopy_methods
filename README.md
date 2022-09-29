

![](https://github.com/MarkMH/homotopy_methods/blob/1d03f9b2e67248adc20d3d807db515c2eed6681f/images/banner_homotopy.jpg)


This very simple project is designed to solve non-degenerate bimatrix games for Nash equilibria. The design is such that the algortim finds an equilibrium, 
if there is one, but this does not mean that it is the only equilibrium. Rather, the solution is path-dependent, meaning that choosing a different initial strategy 
is likely to lead to a different Nash equilibrium if more than one exists. 


The project consists of two files: 

---

<p style='text-align: justify;'> 
1. **UseHomotopy**: This file defines the non-degenerate bimatrix game to be solved. In the example below, each player has two strategies, the entries of the matrices are the payoffs of each player for every possible outcome. Please visit my personal website if you have not already, for more details, this is the example Game 2 described there. Solving the game using the homotopy function described below leads to a Nash equilibrium where players A and B both play the first strategy, represented by sigmaH1 and sigmaH2. If the Nash equilibrium reached, would have benn a mixed strategy equilibrium instead, the entries of sigmaH1 and sigmaH2 would be less than one, but both would add up to one.   
</p>


![](https://github.com/MarkMH/homotopy_methods/blob/5b97e7670bee6fe5ac2812894ec32fc2f1cc5223/images/banner_usehomotopy.png)

---

2. **Homotopy**: This function is the actual algorithm. In addition to the payoff matrices defined above, this function requires a starting point, denoted by *j*, which can be an arbitrary strategy from the player's strategy space. With *w* we define the learning rate. 

![](https://github.com/MarkMH/homotopy_methods/blob/4f5c49e66e0839fcfecacaac80a4a5c7268a1dae/images/banner_chomotopy.png)

---

Disclaimer: This is one of my first projects, the coding is very primitive and redundant. Should you want to use it, I strongly advise to improve the style and efficiently before using the coding. 
</p>

