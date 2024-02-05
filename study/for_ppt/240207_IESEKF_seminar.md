- (true)state : $x_k \in \cal{M}$
- error state : $\delta x_k \in \mathbb{R}^n$
- (estimated)state : $\hat{x}_k \in \cal{M}$
- $x_k = \hat{x}_k \boxplus \delta x_k$

---

$$
  x_k = \begin{bmatrix} ^{W}_{I_k}R^T & \ ^{W}_{I_k}t^T & \ ^{W}_{I_k}v^T & \ b_{w}^T & \ b_{a}^T & \ ^{W}g^T \end{bmatrix}^T  \in \cal{M} \;,\; \cal{M} = \mathrm{SO(3)} \times \mathbb{R}^{15}
$$

$$
  \delta x_k = \begin{bmatrix} \delta \theta^T & \delta{^{W}_{I_k} t}^T & \delta{^{W}_{I_k} v}^T & \delta b_{w}^T & \delta b_{a}^T & \delta{^{W} g}^T \end{bmatrix}^T \in \mathbb{R}^{18}
$$ 
  - where $\delta \theta = \mathrm{Log}(\ ^{W}_{I_k}\hat{R}^T \cdot \ ^{W}_{I_k}R) \in \mathbb{R}^3$
    - Rotation uncertainty is represented by $3\times 3$ covariance matrix $\mathbb{E}[\delta \theta \delta \theta^T]$ 
  - the rests are standard additive error(i.e., $\delta{^{W}_{I_k} t} = \ ^{W}_{I_k}\hat{t} - \ ^{W}_{I_k}t$) 

---

$$ 
    \boxplus : \cal{M} \times \mathbb{R}^n \rightarrow \cal{M} 
    \qquad
    \boxminus : \cal{M} \times \cal{M} \rightarrow \mathbb{R}^n
$$
$$
    x \boxplus u = ^{\cal{M}}\varphi ^{-1}_x(u)
    \qquad
    y \boxminus x = ^{\cal{M}}\varphi_x(y) 
$$

$$
  \begin{array}{lcl}

    \mathcal{M} = \mathrm{SO(3)} : 
    \qquad
    R \boxplus \delta \theta = R \cdot \mathrm{Exp}(\delta \theta) 
    \;\;\;\;
    R_1 \boxminus R_2 = \mathrm{Log}(R_1^T \cdot R_2) 
    \qquad
    \\

    \cal{M} = \mathbb{R}^n : 
    \phantom{aaa}
    \qquad 
    x \boxplus u = x + u
    \phantom{aaaaaaaa}
    y \boxminus x = y - x

  \end{array}
$$

- $y = x \boxplus u$ : Adding a small perturbation $u \in \mathbb{R}^n$ to  $x \in \cal{M}$
- $u = y \boxminus x$ : Determining the perturbation $u \in \mathbb{R}^n$ to move from $x \in \cal{M}$ to $y \in \cal{M}$

---
- For a compound manifold $\mathcal{M} = \mathrm{SO3} \times \mathbb{R}^n$, we have
$$
    \begin{bmatrix} R \\ t \end{bmatrix} \boxplus \begin{bmatrix} \delta \theta \\ \delta t \end{bmatrix} = \begin{bmatrix} R \boxplus \delta \theta \\ t + \delta t \end{bmatrix}
    \qquad
    \begin{bmatrix} R_1 \\ t_1 \end{bmatrix} \boxminus \begin{bmatrix} R_2 \\ t_2 \end{bmatrix} = \begin{bmatrix} R_1 \boxminus R_2 \\ t_1 - t_2 \end{bmatrix}
$$ 

---


$$
\begin{aligned}
  \begin{array}{c}
    & \text {Some Important Notations} \\
    &\begin{array}{cc}
      \hline
      \text {Notation} & \text {Description} \\
      \hline
      t_k & \text {The scan-end time of the k-th LiDAR scan} \\
      \tau_i & \text {The i-th IMU sample time in a LiDAR scan} \\
      \rho_j & \text {The j-th LiDAR point time in a LiDAR scan} \\
      I_j, I_i, I_k & \text {The IMU frame at time } \rho_j, \tau_i \text{ and } t_k \\
      x, \hat{x}, \bar{x} & \text {The true, propagated and updated state} \\
      \delta x & \text {The error state} \\
      \hat{x}^{\kappa} & \text {The } \kappa \text {-th update of x in the iterated Kalman filter} \\
      \left \lfloor a \right \rfloor_\wedge & \text {The skew-symmetric matrix of vector } a \in \mathbb{R}^3 \\
      

    \end{array}
  \end{array}
\end{aligned}
$$

---

$$

  \dot{x_i} = \begin{bmatrix} ^{W}_{I_i}\dot{R} \\ ^{W}_{I_i}\dot{t} \\ ^{W}_{I_i}\dot{v} \\ \dot{b_{w_i}} \\ \dot{b_{a_i}} \\ ^{W}\dot{g}
  \end{bmatrix}
  = \begin{bmatrix} ^{W}_{I_i}R \cdot \left \lfloor w_m - b_w -n_w \right \rfloor_\wedge  \\ ^{W}_{I_i}v \\ ^{W}_{I_i}R (a_m - b_a - n_a) + ^{W}g \\ n_{bw} \\ n_{ba} \\ 0 \end{bmatrix}
  \qquad
  u = \begin{bmatrix} w_m \\ a_m \end{bmatrix}
  \;, \;
  w = \begin{bmatrix} n_w \\ n_a \\ n_{bw} \\ n_{ba} \end{bmatrix}
$$
$$
  u = \begin{bmatrix} w_m \\ a_m \end{bmatrix}
  \;, \;
  w = \begin{bmatrix} n_w \\ n_a \\ n_{bw} \\ n_{ba} \end{bmatrix}
$$
$$
  x_{i+1} = x_i \boxplus (\Delta t f(x_i, u_i, w_i)) 
  = \begin{bmatrix} ^{W}_{I_i}R \\ ^{W}_{I_i}t \\ ^{W}_{I_i}v \\ b_{w_i} \\ b_{a_i} \\ ^{W}g \end{bmatrix} \boxplus \Delta (t \begin{bmatrix} \left \lfloor w_{m_i} - b_{w_i} -n_w \right \rfloor_\wedge  \\ ^{W}_{I_i}v \\ ^{W}_{I_i}R (a_{m_i} - b_{a_i} - n_a) + ^{W}g \\ n_{bw} \\ n_{ba} \\ 0_{3 \times 1} \end{bmatrix})
$$
---
$$
  \hat{x}_{i+1} = \hat{x}_i \boxplus (\Delta t f(\hat{x}_i, u_i, 0)) 
  \qquad
  \hat{x}_{i} \sim \mathcal{N}(\hat{x}_i, \hat{P}_i)
$$

$$
  x_{i+1} = x_i \boxplus (\Delta t f(x_i, u_i, w_i)) 
  \qquad
  w_i \sim \mathcal{N}(0, Q_i)
$$

$$
  \begin{array}{lcl}

    \widetilde{x}_{i+1} = x_{i+1} \boxminus \hat{x}_{i+1}
    \\ 
    \qquad
    = (x_i \boxplus (\Delta t f(x_i, u_i, w_i))) \boxminus (\hat{x}_i \boxplus (\Delta t f(\hat{x}_i, u_i, 0)))
    \\
    \qquad
    = ((\hat{x}_i \boxplus \widetilde{x}_i) \boxplus (\Delta t f(\hat{x}_i \boxplus \widetilde{x}_i, u_i, w_i))) \boxminus (\hat{x}_i \boxplus (\Delta t f(\hat{x}_i, u_i, 0)))

  \end{array}
$$

$$
  \begin{array}{lcl}

    \widetilde{x}_{i+1} =F(\widetilde{x}_i, w_i) \approx
    F(0,0) + \frac{\partial F(\widetilde{x}_i, 0)}{\partial \widetilde{x}_i} \widetilde{x}_i + \frac{\partial F(0, w_i)}{\partial w_i} w_i
    \\
    \qquad \phantom{aaaaaaaaaa}
    = 0 \;+\; F_{\widetilde{x}}\widetilde{x}_i + F_{w}w_i
  \end{array}
$$

$$
  \hat{P}_{i+1} = F_{\widetilde{x}} \hat{P}_i F_{\widetilde{x}}^T + F_{w}Q_iF_{w}^T
$$

---

$$
    (\hat{x}_0, \hat{P}_0),
    \cdots,
    (\hat{x}_i, \hat{P}_i),
    (\hat{x}_{i+1}, \hat{P}_{i+1}),
    \cdots,
    (\hat{x}_k, \hat{P}_k)
$$

---


    

