- state : $x_k \in \cal{M}$
- error state : $\delta x_k \in \mathbb{R}^n$
- estimated(predicted) state : $\hat{x}_k \in \cal{M}$
- $x_k = \hat{x}_k \boxplus \delta x_k$






$$
    x_k = \begin {bmatrix} \ ^{W}R_{k}^T & \ ^{W}p_{k}^T & \ ^{W}v_{k}^T & \ b_{w}^T & \ b_{a}^T & \ ^{W}g_{k}^T \end{bmatrix}^T \in \cal{M} \;,\; \cal{M} = SO(3) \times \mathbb{R}^{15}
$$
$$
    \delta x_k = \begin {bmatrix} \delta \theta_{k}^T & \delta\ ^{W} p_{k}^T & \delta\ ^{W} v_{k}^T & \delta b_{w}^T & \delta b_{a}^T & \delta\ ^{W} g_{k}^T \end{bmatrix}^T \in \mathbb{R}^{18}
$$

  - where $\delta \theta_{k} = \mathbf{Log}(\ ^{W}\hat{R}_k^T \cdot \ ^{W}R_k) \in \mathbb{R}^3$
    - Rotation uncertainty is represented by $3\times 3$ covariance matrix $\mathbb{E}[\delta \theta_k \delta \theta_k^T]$ 
  - the rests are standard additive error(i.e. $\delta p_k = p_k - \hat{p}_k$)

