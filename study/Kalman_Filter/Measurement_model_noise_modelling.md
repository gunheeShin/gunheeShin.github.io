### 1. LiDAR Covariance

1. input
   1. point $\;\;p_x, p_y, p_z$
   2. range, angle covariance $\;\; \sigma_{d}, \sigma_{w}$
2. Equation
   1. range $\;\; d = \sqrt{p_x^2 + p_y^2 + p_z^2}$
   2. direction vector $\;\; w_i = [w_x,w_y,w_z], [ \frac{p_x}{d}, \frac{p_y}{d}, \frac{p_z}{d} ]$
   3. direction vector skew-symmetric matrix $\;\; {\left \lfloor w_i \right \rfloor}_{\wedge} = \begin{bmatrix} 0 & -\frac{p_z}{d} & \frac{p_y}{d} \\ \frac{p_z}{d} & 0 & -\frac{p_x}{d} \\ -\frac{p_y}{d} & \frac{p_x}{d} & 0 \end{bmatrix}$
   4. base vectors  
    $$
    N_1 = \begin{bmatrix} 1 \\ 1 \\ - \frac{p_x+p_y}{p_z} \end{bmatrix} \;\; 
    
    N_2 = w_i \times N_1 = \begin{bmatrix} \frac{p_y}{d}(- \frac{p_x+p_y}{p_z}) - \frac{p_z}{d} \\ -\frac{p_x}{d}(- \frac{p_x+p_y}{p_z}) + \frac{p_z}{d} \\ \frac{p_x}{d} - \frac{p_y}{d} \end{bmatrix}
    $$
    $$
        N_1 = \begin{bmatrix} N_{11} \\ N_{12} \\ N_{13} \end{bmatrix} \;\; N_2 = \begin{bmatrix} N_{21} \\ N_{22} \\ N_{23} \end{bmatrix}
    $$
    $$
        N = \begin{bmatrix} N_1 & N_2 \end{bmatrix}
    $$
   5. Covariance matrix
      1. ranging uncertainty
        $$
            \Sigma_d =  w_i \cdot \sigma_{d} \cdot w_i^T 
            = \begin{bmatrix}
                w_x^2  \sigma_{d} & w_x  w_y  \sigma_{d} & w_x  w_z  \sigma_{d} \\
                w_y  w_x  \sigma_{d} & w_y^2  \sigma_{d} & w_y  w_z  \sigma_{d} \\
                w_z  w_x  \sigma_{d} & w_z  w_y  \sigma_{d} & w_z^2  \sigma_{d}
            \end{bmatrix} 
            \;\;
            , w_x^2 + w_y^2 + w_z^2 = 1
        $$
        $$
            \begin{bmatrix}
            w_x^2*\sigma_{d} & w_x*w_y*\sigma_{d} & w_x*w_z*\sigma_{d} \\
            w_y*w_x*\sigma_{d} & w_y^2*\sigma_{d} & w_y*w_z*\sigma_{d} \\
            w_z*w_x*\sigma_{d} & w_z*w_y*\sigma_{d} & w_z^2*\sigma_{d} \\
            \end{bmatrix}
        $$
      2. angular uncertainty
        $$
            A = d \cdot {\left \lfloor w_i \right \rfloor}_{\wedge} \cdot N
            \qquad
            \Sigma_w = A \cdot \sigma_{w} \cdot A^T
        $$
        $$
            \begin{bmatrix}
                d^2  \sigma_{w} ((w_y N_{31} - w_z N_{21})^2 + (w_y N_{32} - w_z N_{22})^2) & d^2  \sigma_{w} ((-w_x N_{31} + w_z N_{11})(w_y N_{31} - w_z N_{21}) + (-w_x N_{32} + w_z N_{12})(w_y N_{32} - w_z N_{22})) & d^2  \sigma_{w} ((w_x N_{21} - w_y N_{11})(w_y N_{31} - w_z N_{21}) + (w_x N_{22} - w_y N_{12})(w_y N_{32} - w_z N_{22})) \\
                d^2  \sigma_{w} ((-w_x N_{31} + w_z N_{11})(w_y N_{31} - w_z N_{21}) + (-w_x N_{32} + w_z N_{12})(w_y N_{32} - w_z N_{22})) & d^2  \sigma_{w} ((-w_x N_{31} + w_z N_{11})^2 + (-w_x N_{32} + w_z N_{12})^2) & d^2  \sigma_{w} ((w_x N_{21} - w_y N_{11})(-w_x N_{31} + w_z N_{11}) + (w_x N_{22} - w_y N_{12})(-w_x N_{32} + w_z N_{12})) \\
                d^2  \sigma_{w} ((w_x N_{21} - w_y N_{11})(w_y N_{31} - w_z N_{21}) + (w_x N_{22} - w_y N_{12})(w_y N_{32} - w_z N_{22})) & d^2  \sigma_{w} ((w_x N_{21} - w_y N_{11})(-w_x N_{31} + w_z N_{11}) + (w_x N_{22} - w_y N_{12})(-w_x N_{32} + w_z N_{12})) & d^2  \sigma_{w} ((w_x N_{21} - w_y N_{11})^2 + (w_x N_{22} - w_y N_{12})^2) \\
            \end{bmatrix}
        $$

3. Result

        
