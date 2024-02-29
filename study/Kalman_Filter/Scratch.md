## Plane to Plane distance

1. Residual
    $$
        \frac{u_j^T \cdot (q_j - q_i)}{u_j^T \cdot u_i} = F_1(\widetilde{u}_j, \widetilde{q}_j, \widetilde{u}_i, \widetilde{q}_i) = F_2(\widetilde{u}_j, \widetilde{q}_j, \widetilde{x}, \widetilde{n_i})
    $$
    $$
        \frac{u_j^T \cdot (q_j - q_i^W)}{u_j^T \cdot u_i^W} = 
        \frac{u_j^T \cdot (q_j - R^W(q_i^B + t^W)) }{u_j^T \cdot (R^W u_i^B)}

2. Jacobian
    1. $u_j$ part.
    $$
        \frac{\partial F_2(\widetilde{u}_j, 0,0,0)}{\partial \widetilde{u}_j} = \frac{\partial F_2(\widetilde{u}_j, 0,0,0)}{\partial u_j} \cdot \frac{\partial u_j}{\partial \widetilde{u}_j} = \frac{\partial F_2 (\widetilde{u}_j, 0,0,0)}{\partial u_j} \cdot 1
    $$
    $$
        \frac{\partial F_2(\widetilde{u}_j, 0,0,0)}{\partial \widetilde{u}_j} = \frac{\frac{\partial u_j^T(\hat{q}_j - \hat{q}_i)}{\partial u_j}\cdot (u_j^T u_i) - u_j^T(\hat{q}_j - \hat{q}_i) \cdot \frac{\partial (u_j^T u_i)}{\partial u_j}
        }{(u_j^T u_i)^2}
        =
        \frac{(\hat{q}_j - \hat{q}_i) \cdot (u_j^T u_i) -
         u_j^T(\hat{q}_j - \hat{q}_i) \cdot u_i}{(u_j^T u_i)^2}
    $$

    2. $q_j$ part.
    $$
        \frac{\partial F_2(0, \widetilde{q}_j,0,0)}{\partial \widetilde{q}_j} = \frac{\partial F_2(0, \widetilde{q}_j,0,0)}{\partial q_j} \cdot \frac{\partial q_j}{\partial \widetilde{q}_j} = \frac{\partial F_2 (0, \widetilde{q}_j,0,0)}{\partial q_j} \cdot 1
    $$
    $$
        \frac{\partial F_2(0, \widetilde{q}_j,0,0)}{\partial \widetilde{q}_j} =  \frac{u_j^T}{u_j^T u_i}
    $$

    3. $x$ part.
    $$
        \frac{u_j^T \cdot (q_j - q_i^W)}{u_j^T \cdot u_i^W} = F_2(\widetilde{u}_j, \widetilde{q}_j, \widetilde{x}, \widetilde{n_i})
    $$
    $$
        \frac{\partial F_2(0, 0, \widetilde{x},0)}{\partial \widetilde{x}} = \frac{\partial F_2(0, 0, \widetilde{x},0)}{\partial u_i^W} \cdot \frac{\partial u_i^W}{\partial x} + \frac{\partial F_2(0, 0, \widetilde{x},0)}{\partial q_i^W} \cdot \frac{\partial q_i^W}{\partial x}
    $$

    4. $n_i$ part.
    $$
       \frac{F_2(0, 0, 0, \widetilde{n_i})}{\partial \widetilde{n_i}} = \frac{\partial F_2(0, 0, 0, \widetilde{n_i})}{\partial u_i^B} \cdot \frac{\partial u_i^B}{\partial n_i} + \frac{\partial F_2(0, 0, 0, \widetilde{n_i})}{\partial q_i^B} \cdot \frac{\partial q_i^B}{\partial n_i}
    $$

