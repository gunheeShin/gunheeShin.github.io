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
            0 = h^{\kappa}_j(x_k, n) = {u^{\kappa}_j}^T(\ ^{W}_{I_K}T^\kappa \cdot ( \ ^{I_k}p_j + n) - \ ^Wq^{\kappa}_j)
        $$
        $$
            0 = h^{\kappa}_j(x_k, n) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) = {u^{\kappa}_j}^T(\ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^\kappa _k) \cdot ( \ ^{I_k}\hat{p}_j + n) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - \ ^Wq^{\kappa}_j) 
        $$
        1. 우리는 실제 true correspondence를 모르고 매 iteration마다 근접한 plane을 true correspondence로 가정하기 때문에 measurement model 및 true state에 대해서 $\kappa$를 표기했다.
    2. First order approximation
        $$
            0 = h^{\kappa}_j(x_k, n) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) \approx h^{\kappa}_j(\hat{x}_k^{\kappa},0) + \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,0)}{\partial \widetilde{x}^\kappa _k} \widetilde{x}^\kappa _k + \frac{\partial h^{\kappa}_j(\hat{x}_k^{\kappa},n)}{\partial n} n
        $$
        1. For sake of simplicity,
        $$
            0 = h^{\kappa}_j(x_k, n) \approx z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k + v^{\kappa}_j
        $$
        $$
            z^{\kappa}_j = h^{\kappa}_j(\hat{x}_k^{\kappa},0)
            \;,\;
            v^{\kappa}_j = u^{\kappa}_j \cdot ^{W}_{I_K}R^\kappa n
        $$
    3. Jacobian
        1. $H^\kappa _j$ : Jacobian matrix of $h_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n_j)$ w.r.t $\widetilde{x}^\kappa _k$
        $$
            h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) = {u^{\kappa}_j}^T(\ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^\kappa _k) \cdot ( \ ^{I_k}\hat{p}_j + n) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - \ ^Wq^{\kappa}_j) 
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
                    ({{u^{\kappa}_j}^T(\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor \ ^{I_k}p_j \right \rfloor)})^T & ({u^{\kappa}_j}^T)^T & 0 & 0 & 0 & 0
                \end{bmatrix}
                \;\;
                H^\kappa _j \in \mathbb{R}^{1 \times 15}
            $$
            $$
                v^{\kappa}_j = {u^{\kappa}_j}^T \cdot ^{W}_{I_K}R^\kappa n
            $$
            $$
                v^{\kappa}_j \sim \mathcal{N}(0, R^\kappa _j)
                \;\;
                R^\kappa _j = ({u^{\kappa}_j}^T \cdot ^{W}_{I_K}R^\kappa) \Sigma_{^{W}n_j} ({u^{\kappa}_j}^T \cdot ^{W}_{I_K}R^\kappa)^T
                \;\;
                R^\kappa _j \in \mathbb{R}^{1 \times 1}
            $$
    4. Final Measurement Model
        1. We want to express measurement model w.r.t $\widetilde{x}$
        2. For $\kappa$ th iteration, 
            1. Measurement model is always zero. which is,
                $$
                    0 = h^{\kappa}_j(x_k, n) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n) =z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k + v^{\kappa}_j
                $$
            2. Measurement model can be expressed as Normal Distribution
                $$
                    h^{\kappa}_j(x_k, n) \sim \mathcal{N}(z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k, R^\kappa _j)
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
            \Sigma_{^{W}n^\kappa _j} = \ ^{W}_{I_K}\hat{R}^\kappa \Sigma_{^{I_k}n_j} \ ^{W}_{I_K}\hat{R}^{\kappa T} + (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor -\ ^{I_k}\hat{p}_j \right \rfloor) \Sigma_{\delta \ ^{W}_{I_K} \theta ^{\kappa}} (\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor- \ ^{I_k}\hat{p}_j \right \rfloor)^T + \Sigma_{\delta \ ^{W}_{I_K} t^\kappa }
        $$

    2. Plane Uncertainty Modeling
        1. Plane feature consists of a group of LiDAR points $\; \ ^{W}p_i (i=1,2,\cdots,N)$, each has an uncertainty $\Sigma_{^{W}n_i}$.
        2. Denote the points covariance matrix be $A$ and center point be $\bar{p}$.
            $$
                \bar{p} = \frac{1}{N} \sum_{i=1}^{N} \ ^{W}p_i
                \;\;
                A = \frac{1}{N} \sum_{i=1}^{N} (\ ^{W}p_i - \bar{p})(\ ^{W}p_i - \bar{p})^T
            $$
        3. Then plane can be represented by 
           1. $u \in \mathbb{R}^{3}$: Normal vector (eigenvector of $A$ corresponding to the smallest eigenvalue)
           2. $q = \bar{p} \in \mathbb{R}^{3}$ : A center point lying on the plane 
        4. As both $A$ and $q$ are dependent on $\ ^{W}p_i$, we can express ($u,q$) as a function of $\ ^{W}p_i$.
            $$
                [u,q]^T = f(\ ^{W}p_1, \ ^{W}p_2, \cdots, \ ^{W}p_N) \in \mathbb{R}^{6 \times 1}
            $$
        5. The groud truth plane feature is,
            $$
                [u^{gt}, q^{gt}]^T = f(\ ^{W}p_1 + \ ^{W}n_1, \ ^{W}p_2 + \ ^{W}n_2, \cdots, \ ^{W}p_N + \ ^{W}n_N)
            $$

        6. We can express the plane feature uncertainty as,
            $$
                [u^{gt}, q^{gt}]^T - [u,q]^T \approx F_1 \ ^{W}n_1 + F_2 \ ^{W}n_2 + \cdots + F_N \ ^{W}n_N = 
                \sum_{i=1}^{N} F_i \ ^{W}n_i
                \\
                F_i = \frac{\partial f}{\partial \ ^{W}p_i} = \begin{bmatrix}
                    \frac{\partial u}{\partial \ ^{W}p_i} \\ \frac{\partial q}{\partial \ ^{W}p_i}
                \end{bmatrix}
            $$
            $$
                \Sigma_{u,q} = \sum_{i=1}^{N} F_i \Sigma_{^{W}n_i} {F_i}^T
            $$
        7. It seen that $u,q$ are not independent of each other. 

    3. Measurement Model
        1. Equation
            $$
                0 = h^{\kappa}_j(x_k, \ ^{I_k}n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) = {u^{\kappa}_j}^T(\ ^{W}_{I_K}T^\kappa  \ ^{I_k}p_j - q^{\kappa}_j) = {u^{\kappa}_j}^T(\ ^{W}p^\kappa _j - q^{\kappa}_j)

            $$

            $$
                0 = h^{\kappa}_j(x_k, \ ^{I_k}n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,\ ^{I_k}n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) = (\hat{u}^{\kappa}_j \boxplus \delta u^{\kappa}_j)^T[\ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^\kappa _k)( \ ^{I_k}\hat{p}_j + \ ^{I_k}n_j) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - (\ ^W\hat{q}^{\kappa}_j + \delta q_j^{\kappa})]        
            $$        
        2. First order approximation
            $$
                0 = h^{\kappa}_j(x_k, \ ^{I_k}n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) \approx h^{\kappa}_j(\hat{x}_k^{\kappa},0) + H^\kappa _j \widetilde{x}^\kappa _k + J_{u^{\kappa}_j} \delta u^{\kappa}_j + J_{q^{\kappa}_j} \delta q^{\kappa}_j + J_{\ ^{I_k}n_j} \ ^{I_k}n_j
            $$

            1. For sake of simplicity,
            $$
                0 = h^{\kappa}_j(x_k, \ ^{I_k}n_j, \delta u^{\kappa}_j, \delta q^{\kappa}_j) \approx z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k +v^{\kappa}_j
            $$
        3. Jacobian
            1. $H^\kappa _j$ : Jacobian matrix of $h_j^{\kappa}(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,0,0,0)$ w.r.t $\widetilde{x}^\kappa _k$
                $$ 
                    h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,0,0,0) = (\hat{u}^{\kappa}_j)^T[\ ^{W}_{I_K}\hat{R}^\kappa Exp(\delta \theta^\kappa _k)( \ ^{I_k}\hat{p}_j) + \ ^{W}_{I_K}\hat{t}^\kappa + \delta t^\kappa _k - \ ^W\hat{q}^{\kappa}_j]
                $$
                $$
                    H^\kappa _j = \begin{bmatrix}
                        ((\hat{u}^{\kappa}_j)^T(\ ^{W}_{I_K}\hat{R}^\kappa \left \lfloor \ ^{I_k}\hat{p}_j \right \rfloor))^T & (\hat{u}^{\kappa}_j)^T & 0 & 0 & 0 & 0
                    \end{bmatrix}
                    \;\;
                    H^\kappa _j \in \mathbb{R}^{1 \times 15}
                $$

            2. $J_{u^{\kappa}_j}, J_{q^{\kappa}_j}, J_{\ ^{I_k}n_j}$ are then,
                $$
                    J_{u^{\kappa}_j} = (\ ^{W}\hat{p}^{\kappa} - \hat{q}^{\kappa}_j) \;,\; J_{q^{\kappa}_j} = -\hat{u}^{\kappa}_j \;,\; J_{\ ^{I_k}n_j} = \hat{u}^{\kappa}_j
                $$

                
### Measurement Model expalined in FAST-LIO2
1. Back Propagation
    1. LiDAR typically samples points one after another. 
        1. The resultant points are therefore sampled at different poses when the LiDAR undergoes continuous motion.
    2. To correct this in-scan motion, we employ the backpropagation proposed in [22], which estimates the LiDAR pose of each point in the scan with respect to the pose at the scan end time based on IMU measurements.
    2. To correct this in-scan motion, 
        1. Based on the exact sampling time of each individual point in the scan and IMU measurements, we first estimate the LiDAR pose of each point in the scan with respect to the pose at the scan end-time
        2. Then, we project all the points to the end time.
        3. As a result, points in the scan can be viewed as all sampled simultaneously at the end-time.

2. Measurement Model
    1. Our measurement model starts from the following assumptions:
        - For each LiDAR point, the local plane defined by its nearby points in the map is assumed to be where the point truly belongs to.
        1. This assumption enables us to model the measurement model as a point-to-plane distance.
    2. Due to LiDAR measurement noise, each measured point $\ ^{L_j}p_j$ is typically contaminated by a noise $\ n_j$ consisting of the ranging and bearing noise.
        1. Removing this noise leads to the true point location in the local LiDAR frame.
        $$
            \ ^{L_j}p_j^{gt} = \ ^{L_j}p_j + n_j
        $$

    3. This true point, after projecting to the global frame, should lie on the local plane.
        $$
            0 = {u_j}^T(\ ^{W}_{I_k}T \cdot  \ ^{I}_{L}T ( \ ^{L_j}p_j + n_j) - q_j)
        $$
        $$
            0 = h_j(x_k, \ ^{L_j}p_j + n_j)
        $$
        - $u_j$ : normal vector of the local plane
        - $q_j$ : a point lying on the local plane
        - $^{W}_{I_k}T$ :  corresponding body pose
        - $^{I}_{L}T$ : extrinsics between the LiDAR and the IMU(IMU w.r.t LiDAR)

3. State Update
    1. First, let see  $\kappa = 0$ th iteration, 
        1. The propagated state and covariance impose a prior Gaussian distribution for the unknown state $x_k$
        2. $\hat{x}_k^{\kappa} = \hat{x}_k$
        3. We have prior error state distribution as,
            $$
                \widetilde{x}^\kappa _k = x_k \boxminus \hat{x}_k \sim \mathcal{N}(0, \hat{P}_k)
            $$
        3. By using the prior pose and the LiDAR measurements, we can fomulate the measurement model.
            $$
                \begin{array}{lcl}
                0 = h^{\kappa}_j(x_k, n_j) = h^{\kappa}_j(\hat{x}_k^{\kappa} \boxplus \widetilde{x}^\kappa _k,n_j) 
                 \approx h^{\kappa}_j(\hat{x}_k^{\kappa},0) + H^\kappa _j \widetilde{x}^\kappa _k + v_j^{\kappa}
                \\
                \phantom{aaaaaaaaaaaaaaaaaaaaaaaaaaa}
                = z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k +v_j^{\kappa}
                \quad
                v_j^{\kappa} \sim \mathcal{N}(0, R_j^{\kappa})
                \end{array}
            $$  
        4. Combining the prior distribution with the measurement model, we can obtain the posterior distribution of the state equivalently represented by the error state and tis maximum a-posteriori estimate (MAP):
            $$
                \min_{\widetilde{x}^\kappa _k} (\left \| \widetilde{x}^\kappa _k \right \|_{\hat{P}_k}^2 + \left \| z^{\kappa}_j + H^\kappa _j \widetilde{x}^\kappa _k \right \|_{R_j^{\kappa}}^2)
            $$
        5. Optimizing the resultant quadratic cost leads to the standard kalman filter.
            $$
                K=PH^T(HPH^T+R)^{-1}
            $$
            $$
                \hat{x}_k^{\kappa+1} = \hat{x}_k^{\kappa} \boxplus (-Kz_j^{\kappa} + (I-KH)\widetilde{x}_k^{\kappa})
            $$

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
            



We set the updated state as the prior state for the next iteration.