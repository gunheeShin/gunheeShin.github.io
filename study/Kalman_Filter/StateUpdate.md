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
            \ ^{I_k}\hat{p}_j \boxplus \ ^{I_k}n_j = \ ^{I_k}_{I_j}\hat{R} \cdot Exp(\delta \theta^{I_k} _{I_j}) \cdot \ ^I_LT \cdot (\ ^{L_j}p_j + \ ^{L_j}n_j) + \ ^{I_k}_{I_j}\hat{t} + \delta t^{I_k} _{I_j}
        $$          
        $$
            \Sigma_{^{I_k}n_j} = \ ^{I_k}_{L_j}\hat{R} \cdot \Sigma_{^{L_j}n_j} \cdot \ ^{I_k}_{L_j}\hat{R}^T + (\ ^{I_k}_{I_j}\hat{R} \left \lfloor -\ ^{I_j}p_j \right \rfloor) \cdot \Sigma_{\delta \theta^{I_k} _{I_j}} \cdot (\ ^{I_k}_{I_j}\hat{R} \left \lfloor- \ ^{I_j}p_j \right \rfloor)^T + \Sigma_{\delta t^{I_k} _{I_j}}
        $$

    3. Point w.r.t world frame at time $t_k$, when $\kappa =0$
        $$
            \ ^{W}p_j = \ ^{W}_{I_K}T \cdot \ ^{I_k}p_j
        $$
        $$
            \ ^{W}\hat{p}_j \boxplus \ ^{W}n_j = \ ^{W}_{I_K}\hat{R} \cdot Exp(\delta \theta^{W}_{I_K}) \cdot (\ ^{I_k}\hat{p}_j \boxplus \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t} + \delta t^{W}_{I_K}
        $$
        $$
            \Sigma_{^{W}n_j} = \ ^{W}_{I_K}\hat{R} \cdot \Sigma_{^{I_k}n_j} \cdot \ ^{W}_{I_K}\hat{R}^T + (\ ^{W}_{I_K}\hat{R} \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \cdot \Sigma_{\delta \theta^{W}_{I_K}} \cdot (\ ^{W}_{I_K}\hat{R} \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{\delta t^{W}_{I_K}}

        $$
    4. Point w.r.t world frame at time $t_k$, \ ^{W}_{I_K}T varies
        $$
            \ ^{W}p^\kappa _j = \ ^{W}_{I_K}T^\kappa \cdot \ ^{I_k}p_j
        $$
        $$
            \ ^{W}\hat{p}^\kappa _j \boxplus \ ^{W}n_j = \ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^{W}_{I_K}) \cdot (\ ^{I_k}\hat{p}_j \boxplus \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^{W}_{I_K}
        $$
        $$
            \Sigma_{^{W}n_j} = \ ^{W}_{I_K}\hat{R}^\kappa \Sigma_{^{I_k}n_j} \ ^{W}_{I_K}\hat{R}^{\kappa T} + (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \Sigma_{\delta \theta^{W}_{I_K}} (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{\delta t^{W}_{I_K}}
        $$


### Measurement Model
1. w/o considering point uncertainty caused by state and LiDAR
    1. Equation
        $$
            0 = h_j(x_k, n_j) = G_j(\ ^{W}_{I_K}T^\kappa \cdot ( \ ^{I_k}p_j - n_j) - \ ^Wq_j) = G_j(\ ^{W}_{I_K}R^\kappa \cdot( \ ^{I_k}p_j - n_j) + \ ^{W}_{I_K}t^\kappa - \ ^Wq_j) \in \mathbb{R}^3
        $$
        1. For sake of simplicity, 
        $$
            0 = h_j(x_k, n_j) = G_j(\ ^{W}_{I_K}R^\kappa \cdot \ ^{I_k}p_j + \ ^{W}_{I_K}t^\kappa - \ ^Wq_j) + n_j
        $$
    2. First order approximation
        $$
            0 = h_j(x_k, n_j) \approx h_j(\hat{x}_k^{\kappa},0) + H^\kappa _j \widetilde{x}^\kappa _k + v_j
        $$
    3. Jacobian
        1. $H^\kappa _j$ : Jacobian matrix of $h_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n_j)$ w.r.t $\widetilde{x}^\kappa _k$
        $$
            h_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n_j) = G_j(\ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^\kappa _k) \cdot \ ^{I_k}\hat{p}_j + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - \ ^Wq_j) + n_j
        $$
        2. $\widetilde{x}^\kappa _k$ is composed of 
            $$
                \begin{bmatrix}
                    \delta \theta^\kappa _k, \; \widetilde{t}^\kappa _k, \; \widetilde{v}^\kappa _k, \; \widetilde{b}_w^\kappa, \; \widetilde{b}_a^\kappa, \;\widetilde{g}^\kappa
                \end{bmatrix}^T
            $$
        3. $H^\kappa _j$ is then,
            $$
                H^\kappa _j = \begin{bmatrix}
                    -G_j(\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor \ ^{I_k}\hat{p}_j \right \rfloor) & G_j & 0 & 0 & 0 & 0 \\
                    \end{bmatrix}
            $$

