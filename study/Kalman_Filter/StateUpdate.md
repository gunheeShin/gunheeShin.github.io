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
    1. Point w.r.t IMU frame at time $\rho_j$ 
        $$
            \ ^{I_j}p_j = \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j)
        $$
    2. Point w.r.t IMU frame at time $t_k$, when $\kappa =0$
        $$
            \ ^{I_k}p_j = \ ^{I_k}_{I_j}T \cdot \ ^{I_j}p_j = \ ^{I_k}_{I_j}T \cdot \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j)
        $$
        $$
            \ ^{I_k}\hat{p}_j + \ ^{I_k}n_j = \ ^{I_k}_{I_j}\hat{R} \cdot Exp(\delta \ ^{I_k} _{I_j} \theta) \cdot \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j) + \ ^{I_k}_{I_j}\hat{t} + \delta \ ^{I_k} _{I_j} t
        $$          
        $$
            \Sigma_{^{I_k}n_j} = \ ^{I_k}_{L_j}\hat{R} \cdot \Sigma_{^{L_j}n_j} \cdot \ ^{I_k}_{L_j}\hat{R}^T + (\ ^{I_k}_{I_j}\hat{R} \left \lfloor -\ ^{I_j}p_j \right \rfloor) \cdot \Sigma_{\delta \ ^{I_k} _{I_j} \theta} \cdot (\ ^{I_k}_{I_j}\hat{R} \left \lfloor- \ ^{I_j}p_j \right \rfloor)^T + \Sigma_{ \ t^{I_k} _{I_j}\delta }
        $$

    3. Point w.r.t world frame at time $t_k$, when $\kappa =0$
        $$
            \ ^{W}p_j = \ ^{W}_{I_K}T \cdot \ ^{I_k}p_j
        $$
        $$
            \ ^{W}\hat{p}_j + \ ^{W}n_j = \ ^{W}_{I_K}\hat{R} \cdot Exp(\delta \theta^{W}_{I_K}) \cdot (\ ^{I_k}\hat{p}_j \boxplus \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t} + \ t^{W}_{I_K} \delta 
        $$
        $$
            \Sigma_{^{W}n_j} = \ ^{W}_{I_K}\hat{R} \cdot \Sigma_{^{I_k}n_j} \cdot \ ^{W}_{I_K}\hat{R}^T + (\ ^{W}_{I_K}\hat{R} \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \cdot \Sigma_{\ \theta^{W}_{I_K} \delta } \cdot (\ ^{W}_{I_K}\hat{R} \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{ \ t^{W}_{I_K} \delta }

        $$
    4. Point w.r.t world frame at time $t_k$, $\ ^{W}_{I_K}T$ varies
        $$
            \ ^{W}p^\kappa _j = \ ^{W}_{I_K}T^\kappa \cdot \ ^{I_k}p_j
        $$

        $$
            \ ^{W}\hat{p}^\kappa _j + \ ^{W}n^{\kappa} _j = \ ^{W}_{I_K}\hat{R}^\kappa Exp( \ \theta^{W}_{I_K} \delta ) \cdot (\ ^{I_k}\hat{p}_j + \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t}^\kappa + \ t^{W}_{I_K} \delta
        $$

        $$
            \Sigma_{^{W}n^\kappa _j} = \ ^{W}_{I_K}\hat{R}^\kappa \Sigma_{^{I_k}n_j} \ ^{W}_{I_K}\hat{R}^{\kappa T} + (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \Sigma_{\delta \ ^{W}_{I_K} \theta} (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{\ t^{W}_{I_K} \delta }
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
                    
    5. $H$ and $R$ matix
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
            \Sigma_{^{W}n_j} = \ ^{W}_{I_K}\hat{R} \cdot \Sigma_{^{I_k}n_j} \cdot \ ^{W}_{I_K}\hat{R}^T + (\ ^{W}_{I_K}\hat{R} \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \cdot \Sigma_{\ \theta^{W}_{I_K} \delta } \cdot (\ ^{W}_{I_K}\hat{R} \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{ \ t^{W}_{I_K} \delta }

        $$
        1. For sake of simplicity, we will denote $\ ^{W}p^\kappa _j$
            