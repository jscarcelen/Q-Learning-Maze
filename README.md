# MAZE SOLVED WITH Q-LEARNING | MATLAB CODE

$ By Jonathan Sanz

The aim of this code is solving a randomly generated square maze (dimension n) using a Q-Learning algorithm involving an epsilon greedy policy.

The user is capable of defining 3 parameters: 
  - Maze dimension (n)
  - Starting point (Start)
  - Ending point (End)
  
Firstly, the code will generate a random maze matrix based on those points. 
Then, so as to apply the Q-Learning algorithm, a reward matrix is built distinguishing between the following locations:
  - Wall cells (extemely low reward)
  - Non-wall cells
  - Start cell
  - End cell
Afterwards, a matrix containing the Q-values of all the possible actions is computed (this is the essence of the Q-learning algorithm). As discussed deeply in the report (Maze_Q_Learning_Report.mlx), this process involves an epsilon greedy policy among other significant factors.
Finally, the optimal path is found. 
