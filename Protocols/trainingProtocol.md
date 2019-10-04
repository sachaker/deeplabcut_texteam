## DLC model specs
- save_iterations: 1000
- display_iterations: 500
- multi_step:
[0.005, 10000] [0.02, 250000] [0.002, 300000]


## DLC model data
![](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/overlap.png)
*Log of loss curves for various models*

Shrink, No Shrink, and 10 Node Shrink were all trained on the same mouse, same session, with the same labeled frames (total ~200). Shrink refers to the labeling method in which the increment size between nodes is a function of the length of visible whiskers. No shrink is when the increment between whisker nodes is fixed. 8 Node Shrink was trained on the same mouse but with 250 labeled frames and ~1/3 of the training set derived from the same session as the 3 aforementioned models. 8 Node Shrink cb141 was trained with ~350 labeled frames from a different mouse entirely. Despite variability across all these features, shifts in the loss curves remain linear. This homogeneity is crucial as it allows us to generalize the new DLC model parameters, which will expedite the training process.


![](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/derivative_shrink.png)
*Derivative of example model loss curve*

Originally, we had planned to build an algorithm that determines convergence and terminates the training process once the curve has plateaued, i.e. when the derivative of the curve ~0. However, as evidenced by this graph, the derivative of the loss curve approaches 0 before switching step size, after which the loss drops further. This is crucial because if we were to terminate the training process at a derivative of approx. 0, we would lose out on better performing model (see previous figure). This analysis demonstrated that the derivative approach would not work.
