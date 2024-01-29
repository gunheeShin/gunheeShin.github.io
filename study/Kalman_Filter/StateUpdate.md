## Measurement Model
### Equation
1. w/o considering point uncertainty caused by state and LiDAR
   1. Point w.r.t IMU frame at time $\rho_j$ 
       $$
           \ ^{I_j}p_j = \ ^I_LT \cdot \ ^{L_j}p_j
       $$
   2. Point w.r.t IMU frame at time $t_k$ when $\kappa =0$
       $$
           \ ^{W}p_j^{\kappa} = \ ^{W}_{I_K}T \cdot  \ ^{I_k}_{I_j}T \cdot \ ^{I_j}p_j
       $$
   3. Point w.r.t IMU frame at time $t_k$, $\ ^{W}_{I_K}T$ varies
       $$
           \ ^Wp^\kappa _j = \ ^{W}_{I_K}T^\kappa \cdot \ ^{I_k}_{I_j}T \cdot \ ^{I_j}p_j = \ ^{W}_{I_K}T^\kappa \cdot \ ^{I_k}p_j
       $$
   4. Plane parameter
       1. Normal vector : $n_j$
       2. A point lying on the plane : $\ ^Wq_j$
   5. Residual
       $$
           z^\kappa _j = G_j(\ ^Wp^\kappa _j - \ ^Wq_j)
       $$

2. Considering point uncertainty caused by state and LiDAR

    1. Point covariance $\ ^{L_j}n_j$$
        1. In practice, LiDAR mesures the bearing direction by encoders of the scanning motor, and the depth by computing the laser time-of-flight.
        2. Let, $w_j \in \mathbb{S}^2$ be the measured bearing direction and $\delta w_j \sim \mathcal{N}(0_{2 \times 1}, \Sigma_{w_j})$ be the measurement noise in the tangent space of $\mathbb{S}^2$.
            1. $w_j$ is actually a unit vector which is $w_j \in \mathbb{R}^3$. $\;\; S=S^2 \cong \left \{ x \in \mathbb{R}^3 \mid \|x\| = r, r \gt 0 \right \}$
            2. The reason why we utilize the fact that $w_j \in \mathbb{S}^2$ is that we can minimally parameterize the measurement noise $\delta w_j$.
            $$
                w^{gt}_j = w_i \boxplus_{\mathbb{S}^2} \delta w_j \cong e^{{\left \lfloor N(w_j)\delta w_j \right \rfloor}_{\times}} w_j = \left ( I + {\left \lfloor N(w_j)\delta w_j \right \rfloor}_{\times} \right ) w_j
            $$
        3. Let, $d_j$ be the measured depth and $\delta d_j \sim \mathcal{N}(0, \sigma_{d_j})$ be the range noise.
            $$ 
                d^{gt}_j = d_j + \delta d_j
            $$
        3. A point can be expressed as,
            $$
                \ ^{L_j}p_j = d_j w_j
            $$ 
            $$
                \ ^{L_j}\hat{p}_j + \ ^{L_j}n_j = d^{gt}_j w^{gt}_j = (d_j + \delta d_j) \left \{ \left ( I + {\left \lfloor N(w_j)\delta w_j \right \rfloor}_{\times} \right ) w_j \right \}
            $$
            $$
                ^{L_j}n_j = w_i \delta d_j - d_j {\left \lfloor w_j \right \rfloor}_{\times} N(w_j) \delta w_j
            $$
        4. Finally, point covariance $^{L_j}n_j$ is,
            $$
                \ ^{L_j}n_j = \begin{bmatrix}
                    w_j & -d_j {\left \lfloor w_j \right \rfloor}_{\times} N(w_j)
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
    2. Point w.r.t IMU frame at time $\rho_j$ 
        $$
            \ ^{I_j}p_j = \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j)
        $$
    3. Point w.r.t IMU frame at time $t_k$, when $\kappa =0$
        $$
            \ ^{I_k}p_j = \ ^{I_k}_{I_j}T \cdot \ ^{I_j}p_j = \ ^{I_k}_{I_j}T \cdot \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j)
        $$
        $$
            \ ^{I_k}\hat{p}_j + \ ^{I_k}n_j = \ ^{I_k}_{I_j}\hat{R} \cdot Exp(\delta \ ^{I_k} _{I_j} \theta) \cdot \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j) + \ ^{I_k}_{I_j}\hat{t} + \delta \ ^{I_k} _{I_j} t
        $$          
        $$
            \Sigma_{^{I_k}n_j} = \ ^{I_k}_{L_j}\hat{R} \cdot \Sigma_{^{L_j}n_j} \cdot \ ^{I_k}_{L_j}\hat{R}^T + (\ ^{I_k}_{I_j}\hat{R} \left \lfloor -\ ^{I_j}p_j \right \rfloor) \cdot \Sigma_{\delta \ ^{I_k} _{I_j} \theta} \cdot (\ ^{I_k}_{I_j}\hat{R} \left \lfloor- \ ^{I_j}p_j \right \rfloor)^T + \Sigma_{ \delta \ ^{I_k} _{I_j} t }
        $$

    4. Point w.r.t world frame at time $t_k$, when $\kappa =0$
        $$
            \ ^{W}p_j = \ ^{W}_{I_K}T \cdot \ ^{I_k}p_j
        $$
        $$
            \ ^{W}\hat{p}_j + \ ^{W}n_j = \ ^{W}_{I_K}\hat{R} \cdot Exp(\delta \ ^{W}_{I_K} \theta) \cdot (\ ^{I_k}\hat{p}_j \boxplus \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t} + \delta \ ^{W}_{I_K} t
        $$
        $$
            \Sigma_{^{W}n_j} = \ ^{W}_{I_K}\hat{R} \cdot \Sigma_{^{I_k}n_j} \cdot \ ^{W}_{I_K}\hat{R}^T + (\ ^{W}_{I_K}\hat{R} \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \cdot \Sigma_{\delta \ ^{W}_{I_K} \theta } \cdot (\ ^{W}_{I_K}\hat{R} \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{ \delta \ ^{W}_{I_K} t }

        $$
    5. Point w.r.t world frame at time $t_k$, $\ ^{W}_{I_K}T$ varies
        $$
            \ ^{W}p^\kappa _j = \ ^{W}_{I_K}T^\kappa \cdot \ ^{I_k}p_j
        $$

        $$
            \ ^{W}\hat{p}^\kappa _j + \ ^{W}n^{\kappa} _j = \ ^{W}_{I_K}\hat{R}^\kappa Exp( \delta \ ^{W}_{I_K} \theta ^{\kappa} ) \cdot (\ ^{I_k}\hat{p}_j + \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta \ ^{W}_{I_K} t^\kappa
        $$

        $$
            \Sigma_{^{W}n^\kappa _j} = \ ^{W}_{I_K}\hat{R}^\kappa \Sigma_{^{I_k}n_j} \ ^{W}_{I_K}\hat{R}^{\kappa T} + (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \Sigma_{\delta \ ^{W}_{I_K} \theta ^{\kappa}} (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{\delta \ ^{W}_{I_K} t^\kappa }
        $$
        1. $\Sigma_{^{W}n^\kappa _j}$ is composed of,
            $$
                \left \{ \Sigma_{\delta \ ^{W}_{I_K} t^\kappa }, \Sigma_{\delta \ ^{W}_{I_K} \theta ^{\kappa}}, \ ^{W}_{I_K}\hat{R}^\kappa \right \} 
                \;  \; \left \{ \Sigma_{^{I_k}n_j}, \ ^{I_k}\hat{p}_j  \right \}
            $$


### Measurement Model
1. w/o considering point uncertainty caused by state and LiDAR
    1. Equation
        $$
            0 = h^{\kappa}_j(x_k, n) = G^{\kappa}_j(\ ^{W}_{I_K}T^\kappa \cdot ( \ ^{I_k}p_j + n) - \ ^Wq^{\kappa}_j)
        $$
        $$
            0 = h^{\kappa}_j(x_k, n) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) = G^{\kappa}_j(\ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^\kappa _k) \cdot ( \ ^{I_k}\hat{p}_j + \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - \ ^Wq^{\kappa}_j) 
        $$
        1. 우리는 실제 true correspondence를 모르고 매 iteration마다 근접한 plane을 true correspondence로 가정하기 때문에 measurement model 및 true state에 대해서 $\kappa$를 표기했다.
    2. First order approximation
        $$
            0 = h^{\kappa}_j(x_k, n) \approx h^{\kappa}_j(\hat{x}_k^{\kappa},0) + H^\kappa _j \widetilde{x}^\kappa _k + G^{\kappa}_j \cdot ^{W}_{I_K}R^\kappa n
        $$

    3. Residual(error of the measurement)
        $$
            r^{\kappa}_j = h^{\kappa}_j(x_k, n) - h^{\kappa}_j(\hat{x}_k^{\kappa},0) \approx H^\kappa _j \widetilde{x}^\kappa _k + G^{\kappa}_j \cdot ^{W}_{I_K}R^\kappa n
        $$
        1. For sake of simplicity, 
        $$
            r^{\kappa}_j = H^\kappa _j \widetilde{x}^\kappa _k + D^\kappa _j n, \;\; D^\kappa _j = G^{\kappa}_j \cdot ^{W}_{I_K}R^\kappa
        $$
    4. Jacobian
        1. $H^\kappa _j$ : Jacobian matrix of $h_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n_j)$ w.r.t $\widetilde{x}^\kappa _k$
        $$
            h_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) = G^{\kappa}_j(\ ^{W}_{I_K}\hat{R}^\kappa \cdot Exp(\delta \theta^\kappa _k)  \ ^{I_k}p_j + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - \ ^Wq^{\kappa}_j) + D^\kappa _j n
        $$
        2. $\widetilde{x}^\kappa _k$ is composed of 
            $$
                \widetilde{x}^\kappa _k = \begin{bmatrix}
                    \delta \theta^\kappa _k \\ \widetilde{t}^\kappa _k \\ \widetilde{v}^\kappa _k \\ \widetilde{b}_w^\kappa \\ \widetilde{b}_a^\kappa \\ \widetilde{g}^\kappa
                \end{bmatrix}
            $$
        3. $H^\kappa _j$ and $R^\kappa _j$ is then,
            $$
                H^\kappa _j = \begin{bmatrix}
                    {-G^{\kappa}_j(\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor \ ^{I_k}p_j \right \rfloor)}^T & {G^{\kappa}_j}^T & 0 & 0 & 0 & 0
                \end{bmatrix}
                \;\;
                H^\kappa _j \in \mathbb{R}^{1 \times 15}
            $$
            $$
                R^\kappa _j = D^\kappa _j \Sigma_{^{W}n_j} {D^\kappa _j}^T
                \;\;
                R^\kappa _j \in \mathbb{R}^{1 \times 1}
            $$
    5. Final Measurement Model
        1. We want to express measurement model w.r.t $\widetilde{x}$
        2. For $\kappa$th iteration, 
            1. Measurement model is always zero. which is,
                $$
                    0 = h^{\kappa}_j(x_k, n) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) = h^{\kappa}_j(\hat{x}_k^{\kappa},0) + H^\kappa _j \widetilde{x}^\kappa _k + D^\kappa _j n
                $$
            2. Since $h^{\kappa}_j(\hat{x}_k^{\kappa},0)$ is equal to residual $-r^{\kappa}_j$, final measurement model is,
                $$
                    h^{\kappa}_j(x_k, n) = -r^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k + D^\kappa _j n
                $$
            3. Measurement model can be expressed as Normal Distribution
                $$
                    h^{\kappa}_j(x_k, n) \sim \mathcal{N}(-r^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k, R^{\kappa}_j)
                $$

    6. $H$ and $R$ matix
        1. $H$ matrix
            $$
                H^{\kappa} = \begin{bmatrix}
                    H^{\kappa}_1 \\ H^{\kappa}_2 \\ \vdots \\ H^{\kappa}_j \\ \vdots \\ H^{\kappa}_m
                \end{bmatrix}
                \;\;
                H^{\kappa} \in \mathbb{R}^{m \times 15}
            $$

        2. $R$ matrix
            $$
                R^{\kappa} = diag(R^{\kappa}_1, R^{\kappa}_2, \cdots, R^{\kappa}_j, \cdots, R^{\kappa}_m)
                \;\;
                R^{\kappa} \in \mathbb{R}^{m \times m}
            $$

    

2. Considering point uncertainty caused by state and LiDAR
    1. Current scan point w.r.t world frame
        $$
            \ ^{W}p^\kappa _j = \ ^{W}_{I_K}T^\kappa \cdot \ ^{I_k}p_j
        $$
        $$
            \Sigma_{^{W}n^\kappa _j} = \ ^{W}_{I_K}\hat{R}^\kappa \Sigma_{^{I_k}n_j} \ ^{W}_{I_K}\hat{R}^{\kappa T} + (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \Sigma_{\delta \ ^{W}_{I_K} \theta ^{\kappa}} (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{\delta \ ^{W}_{I_K} t^\kappa }
        $$
            