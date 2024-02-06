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
      \widetilde{x} & \text {The error state} \\
      \hat{x}^{\kappa} & \text {The } \kappa \text {-th update of x in the iterated Kalman filter} \\
      n & \text {The noise of the point in a LiDAR scan} \\
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

$$
  \ ^{L_j}p_j^{gt} = \ ^{L_j}p_j + n_j
$$
$$
  0 = {u_j}^T(\ ^{W}_{I_k}T \cdot  \ ^{I}_{L}T ( \ ^{L_j}p_j + n_j) - q_j)
$$
- $u_j$ : normal vector of the local plane
- $q_j$ : a point lying on the local plane
- $^{W}_{I_k}T$ :  corresponding body pose
- $^{I}_{L}T$ : extrinsics between the LiDAR and the IMU(IMU w.r.t LiDAR)

---

$$
  x_k \boxminus \hat{x}_k \sim \mathcal{N}(0, \hat{P}_k)
$$
$$
  0 = h^{\kappa}_j(x_k, \ ^{L_j}p_j + n_j) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k, \ ^{L_j}p_j + n_j)
$$

- For the first iteration, $\hat{x}_k^{\kappa} = \hat{x}_k$ and $J^{\kappa} = I$

$$
  x_k \boxminus \hat{x}_k = (\hat{x}_k^{\kappa} \boxplus \widetilde{x}_k^{\kappa}) \boxminus \hat{x}_k \approx \hat{x}_k^{\kappa} \boxminus \hat{x}_k + J^{\kappa} \widetilde{x}_k^{\kappa}
$$
$$
  \widetilde{x}_k^{\kappa} \sim \mathcal{N}(-{J^{\kappa}}^{-1}(\hat{x}_k^{\kappa} \boxminus \hat{x}_k), {J^{\kappa}}^{-1} \hat{P}_k {J^{\kappa}}^{-T})
$$
- $J^{\kappa}$ : $\frac{\partial (\hat{x}_k^{\kappa} \boxplus \widetilde{x}_k^{\kappa}) \boxminus \hat{x}_k}{\partial \widetilde{x}_k^{\kappa}}$

$$
  \begin{array}{lcl}
  0 = h^{\kappa}_j(x_k, \ ^{L_j}p_j + n_j) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,\ ^{L_j}p_j + n_j) 
    \approx h^{\kappa}_j(\hat{x}_k^{\kappa},\ ^{L_j}p_j) + H^\kappa _j \widetilde{x}^\kappa _k +J^{\kappa}_{n_j} n_j
  \\
  \phantom{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa}
  = z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k +v_j^{\kappa}
  \quad
  v_j^{\kappa} \sim \mathcal{N}(0, R^{\kappa}_j)
  \end{array}
$$ 
$$
  H^\kappa _j = \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,\ ^{L_j}p_j)}{\partial \widetilde{x}^\kappa _k}
  \qquad
  J^{\kappa}_{n_j} = \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa},\ ^{L_j}p_j + n_j)}{\partial n_j}
$$

$$
  \min_{\widetilde{x}^\kappa _k} (\left \| x_k \boxminus \hat{x}_k \right \|_{\hat{P}_k}^2 + \sum_{j}^{m}
  \left \| z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k \right \|_{R^{\kappa}_j}^2)
$$

$$
    K=PH^T(HPH^T+R)^{-1}
$$
$$
    \hat{x}_k^{\kappa+1} = \hat{x}_k^{\kappa} \boxplus (\widetilde{x}_k^{\kappa} + K(z_k^{\kappa} - H((J^{\kappa})^{-1}(\hat{x}_k^{\kappa} \boxminus \hat{x}_k))))
$$
- where
    $$
        P = (J^{\kappa})^{-1}\hat{P}_k(J^{\kappa})^{-T}
    $$
    $$
        H = \begin{bmatrix}
            {H^{\kappa}_1}^T , \cdots, {H^{\kappa}_j}^T, \cdots, {H^{\kappa}_m}^T
        \end{bmatrix}
    $$
    $$
        R = \mathrm{diag}(R^{\kappa}_1, R^{\kappa}_2, \cdots, R^{\kappa}_j, \cdots, R^{\kappa}_m)
    $$
    $$
        z^{\kappa}_k = [z^{\kappa}_1, \cdots, z^{\kappa}_j, \cdots, z^{\kappa}_m]^T
    $$

---

$$
  w_j \in \mathbb{S}^2 
  \qquad
  \delta w_j \sim \mathcal{N}(0_{2 \times 1}, \Sigma_{w_j})
$$
$$
    w^{gt}_j = w_i \boxplus_{\mathbb{S}^2} \delta w_j \cong e^{{\left \lfloor N(w_j)\delta w_j \right \rfloor}_{\wedge}} w_j \approx \left ( I + {\left \lfloor N(w_j)\delta w_j \right \rfloor}_{\wedge} \right ) w_j
$$


$$
  d^{gt}_j = d_j + \delta d_j
$$

$$
  \ ^{L_j}p_j = d_j w_j
$$ 
$$
  \ ^{L_j}\hat{p}_j + \ ^{L_j}n_j = d^{gt}_j w^{gt}_j \approx (d_j + \delta d_j) \left \{ \left ( I + {\left \lfloor N(w_j)\delta w_j \right \rfloor}_{\wedge} \right ) w_j \right \}
$$
$$
  ^{L_j}n_j = w_i \delta d_j - d_j {\left \lfloor w_j \right \rfloor}_{\wedge} N(w_j) \delta w_j
$$

$$
  \ ^{L_j}n_j = \begin{bmatrix}
      w_j & -d_j {\left \lfloor w_j \right \rfloor}_{\wedge} N(w_j)
  \end{bmatrix} \begin{bmatrix}
      \delta d_j \\ \delta w_j
  \end{bmatrix} = A_j \begin{bmatrix}
      \delta d_j \\ \delta w_j
  \end{bmatrix}
  \sim \mathcal{N}(0_{3 \times 1}, \Sigma_{^{L_j}n_j})
$$
$$
  \Sigma_{^{L_j}n_j} = A_j \begin{bmatrix}
      \sigma_{d_j} & 0_{1 \times 2} \\ 0_{2 \times 1} & \Sigma_{w_j}
  \end{bmatrix} A_j^T
$$

---
$$
    \ ^{W}p_j = \ ^{W}_{I_K}T \cdot \ ^{I_k}p_j
$$
$$
  \begin{array}{lcl}
    \ ^{W}p_j^{gt} = \ ^{W}p_j + \ ^{W}n_j = (\ ^{W}_{I_K}\hat{R} \boxplus \delta \ ^{W}_{I_K} \theta) (\ ^{I_k}p_j + \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t} + \delta \ ^{W}_{I_K} t
    \\
    \phantom{aaaaaaaaaaaaaaaaa}
    =\ ^{W}_{I_K}\hat{R} \cdot \mathrm{Exp}(\delta \ ^{W}_{I_K} \theta) \cdot (\ ^{I_k}p_j + \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t} + \delta \ ^{W}_{I_K} t
  \end{array}
$$
$$
  \ ^{W}n_j = \ ^{W}_{I_k}\hat{R} \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor \delta \ ^{W}_{I_K} \theta + \delta \ ^{W}_{I_K} t + \ ^{W}_{I_K}\hat{R} \ ^{I_k}n_j
$$ 
$$
    \Sigma_{^{W}n_j} = \ ^{W}_{I_K}\hat{R} \cdot \Sigma_{^{I_k}n_j} \cdot \ ^{W}_{I_K}\hat{R}^T + (\ ^{W}_{I_K}\hat{R} \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \cdot \Sigma_{\delta \ ^{W}_{I_K} \theta } \cdot (\ ^{W}_{I_K}\hat{R} \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{ \delta \ ^{W}_{I_K} t }

$$
---

$$
  x_{j-1} = x_j \boxplus (-\Delta t f(x_j, u_j, 0))
$$

---
$$
    h_j(x_k,^{L_j}p_j + n_j) = {u_j}^T(\ ^{W}_{I_k}T \cdot  \ ^{I}_{L}T ( \ ^{L_j}p_j + n_j) - q_j) =0
$$
- $u_j$ : normal vector of the local plane
- $q_j$ : a point lying on the local plane
- $^{W}_{I_k}T$ :  corresponding body pose in world frame
- $^{I}_{L}T$ : extrinsics between the LiDAR and the IMU(IMU w.r.t LiDAR)
    

$$
    x_k \boxminus \hat{x}_k \sim \mathcal{N}(0, \hat{P}_k)
$$
and measurement model as,
$$
    0 = h_j(x_k, ^{L_j}p_j + n_j) = h_j(\hat{x}_k \boxplus \widetilde{x},^{L_j}p_j + n_j) 
$$

---

$$
  \left \| \hat{x}_k^{\kappa +1} - \hat{x}_k^{\kappa} \right \| < \epsilon
$$

---

$$
   0 = h^{\kappa}_j(x_k, ^{L_j}p_j + n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus 
   \widetilde{x}^{\kappa}_k, ^{L_j}p_j + n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) 
   \\
   \phantom{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa}
   \approx h^{\kappa}_j(\hat{x}_k^{\kappa}, ^{L_j}p_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) + H^{\kappa}_j \widetilde{x}^{\kappa}_k + J^{\kappa}_{n_j} n_j + J^{\kappa}_{\delta u_j} \delta u^{\kappa}_j + J^{\kappa}_{\delta q_j} \delta q^{\kappa}_j
   \\
  \phantom{aaaaaaaaaaaaaa}
  = z^{\kappa}_j + H^{\kappa}_j \widetilde{x}^{\kappa}_k +v_j^{\kappa}
$$

$$
  \begin{array}{lcl}
    0 = h^{\kappa}_j(x_k, ^{L_j}p_j + n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus 
    \widetilde{x}^{\kappa}_k, ^{L_j}p_j + n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) 
    \\
    \phantom{aaaaaaaaaaaaaaaaaaaaaaaaa}
    \approx h^{\kappa}_j(\hat{x}_k^{\kappa}, ^{L_j}p_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) + H^{\kappa}_j \widetilde{x}^{\kappa}_k + J^{\kappa}_{n_j} n_j + J^{\kappa}_{\delta u_j} \delta u^{\kappa}_j + J^{\kappa}_{\delta q_j} \delta q^{\kappa}_j
    \\
    \phantom{aaaaaaaaaaaaaaaaaaaaaaaaa}
    = z^{\kappa}_j + H^{\kappa}_j \widetilde{x}^{\kappa}_k +v_j^{\kappa}
  \end{array}
$$

$$
  h_j(x_k, ^{L_j}p_j + n_j, \delta u_j, \delta q_j) = (u_j + \delta u_j)^T(\ ^{W}_{I_k}T \cdot  \ ^{I}_{L}T ( \ ^{L_j}p_j + n_j) - (q_j + \delta q_j)) =0
$$

$$
  H^\kappa _j = \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,\ ^{L_j}p_j ,0,0)}{\partial \widetilde{x}^\kappa _k}
  \qquad
  J^{\kappa}_{n_j} = \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa},\ ^{L_j}p_j + n_j,0,0)}{\partial n_j}
$$
$$
  J^{\kappa}_{\delta u_j} = \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa},\ ^{L_j}p_j + n_j, \delta u_j,0)}{\partial \delta u_j}
  \qquad
  J^{\kappa}_{\delta q_j} = \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa},\ ^{L_j}p_j + n_j, 0,\delta q_j)}{\partial \delta q_j}
$$