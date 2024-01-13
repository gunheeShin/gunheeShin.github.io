## Matrix Calculation
$$
    \mathbf{A} = \begin{bmatrix}    R & RP & RV & RW & RA & RG \\
                                    RP & P & PV & PW & PA & PG \\
                                    RV & PV & V & VW & VA & VG \\
                                    RW & PW & VW & W & WA & WG \\
                                    RA & PA & VA & WA & A & AG \\
                                    RG & PG & VG & WG & AG & G
                \end{bmatrix}

    \\

    \mathbf{F_x} = 
    \begin{bmatrix} 
        Exp(-\hat{\omega}_i \Delta t) & 0 & 0 & -A(\hat{\omega}_i \Delta t)^T \Delta t & 0 & 0 \\
        0 & I & I \Delta t & 0 & 0 & 0 \\
        -^{G}\hat{R}_{I_i} \left \lfloor  \hat{a}_i  \right \rfloor_\wedge   \Delta t & 0 & I & 0 & -^{G}\hat{R}_{I_i}\Delta t & I \Delta t \\
        0 & 0 & 0 & I & 0 & 0 \\
        0 & 0 & 0 & 0 & I & 0 \\
        0 & 0 & 0 & 0 & 0 & I \\
    \end{bmatrix}

    \;\;\;

    \mathbf{F_w} =
    \begin{bmatrix} 
        -A(\hat{\omega}_i \Delta t)^T \Delta t & 0 & 0 & 0  \\
        0 & 0 & 0 & 0 \\
        0  & -^{G}\hat{R}_{I_i}  \Delta t & 0 & 0 \\
        0 & 0 & I \Delta t & 0 \\
        0 & 0 & 0 & I \Delta t \\
        0 & 0 & 0 & 0 \\
    \end{bmatrix}


    \\


    \mathbf{F_x \times A \times F_x^T} = \begin{bmatrix}  
                                              R*Exp(-\hat{\omega}_i \Delta t) +  RW*-A(\hat{\omega}_i \Delta t)^T \Delta t & PW*-A(\hat{\omega}_i \Delta t)^T \Delta t +  RP*Exp(-\hat{\omega}_i \Delta t) & RV*Exp(-\hat{\omega}_i \Delta t) +  VW*-A(\hat{\omega}_i \Delta t)^T \Delta t & RW*Exp(-\hat{\omega}_i \Delta t) +  W*-A(\hat{\omega}_i \Delta t)^T \Delta t & RA*Exp(-\hat{\omega}_i \Delta t) +  WA*-A(\hat{\omega}_i \Delta t)^T \Delta t & RG*Exp(-\hat{\omega}_i \Delta t) +  WG*-A(\hat{\omega}_i \Delta t)^T \Delta t \\
RP*I +  RV*I \Delta t & P*I +  PV*I \Delta t & PV*I +  V*I \Delta t & PW*I +  VW*I \Delta t & PA*I +  VA*I \Delta t & PG*I +  VG*I \Delta t \\
R*-^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t +  RA*-^{G}\hat{R}_{I_i}\Delta t +  RG*I \Delta t +  RV*I & PA*-^{G}\hat{R}_{I_i}\Delta t +  PG*I \Delta t +  PV*I +  RP*-^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t & RV*-^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t +  V*I +  VA*-^{G}\hat{R}_{I_i}\Delta t +  VG*I \Delta t & RW*-^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t +  VW*I +  WA*-^{G}\hat{R}_{I_i}\Delta t +  WG*I \Delta t & A*-^{G}\hat{R}_{I_i}\Delta t +  AG*I \Delta t +  RA*-^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t +  VA*I & AG*-^{G}\hat{R}_{I_i}\Delta t +  G*I \Delta t +  RG*-^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t +  VG*I \\
RW*I & PW*I & VW*I & W*I & WA*I & WG*I \\
RA*I & PA*I & VA*I & WA*I & A*I & AG*I \\
RG*I & PG*I & VG*I & WG*I & AG*I & G*I \\





                                                \end{bmatrix}


    \\

    \mathbf{F_w \times Q \times F_w^T} = \begin{bmatrix}  
                                              NW*-A(\hat{\omega}_i \Delta t)^T \Delta t**2 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & NA*-^{G}\hat{R}_{I_i}  \Delta t**2 & 0 & 0 & 0 \\
0 & 0 & 0 & NBW*I \Delta t**2 & 0 & 0 \\
0 & 0 & 0 & 0 & NAW*I \Delta t**2 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 \\
  \end{bmatrix}

  \\



$$