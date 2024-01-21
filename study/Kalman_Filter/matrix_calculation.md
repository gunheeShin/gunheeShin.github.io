## Matrix Calculation
$$
    \mathbf{P}  =   \begin{bmatrix}
                        RR & RP & RV & RW & RA & RG \\
                        PR & PP & PV & PW & PA & PG \\
                        VR & VP & VV & VW & VA & VG \\
                        WR & WP & WV & WW & WA & WG \\
                        AR & AP & AV & AW & AA & AG \\
                        GR & GP & GV & GW & GA & GG \\
                    \end{bmatrix}
$$

$$
    \mathbf{Q}  =   \begin{bmatrix}
                        NW & 0 & 0 & 0 \\
                        0 & NA & 0 & 0 \\
                        0 & 0 & NBW & 0 \\
                        0 & 0 & 0 & NBA \\
                    \end{bmatrix}
$$

$$
    \mathbf{F_{\tilde{x}}}  =   \begin{bmatrix}
                                    FX11 & 0 & 0 & FX14 & 0 & 0 \\
                                    0 & 1 & FX23 & 0 & 0 & 0 \\
                                    FX31 & 0 & 1 & 0 & FX35 & FX36 \\
                                    0 & 0 & 0 & 1 & 0 & 0 \\
                                    0 & 0 & 0 & 0 & 1 & 0 \\
                                    0 & 0 & 0 & 0 & 0 & 1 \\
                                \end{bmatrix}
                            =
                                \begin{bmatrix}
                                    Exp(-\hat{\omega}_i \Delta t) & 0 & 0 & -A(\hat{\omega}_i \Delta t)^T \Delta t & 0 & 0 \\
                                    0 & 1 & \Delta t & 0 & 0 & 0 \\
                                    -^{G}\hat{R}_{I_i} \left \lfloor \hat{a}_i \right \rfloor_\wedge \Delta t & 0 & 1 & 0 & -^{G}\hat{R}_{I_i}\Delta t & \Delta t \\
                                    0 & 0 & 0 & 1 & 0 & 0 \\
                                    0 & 0 & 0 & 0 & 1 & 0 \\
                                    0 & 0 & 0 & 0 & 0 & 1 \\
                                \end{bmatrix}
$$

$$
    \mathbf{F_{\tilde{w}}}  =   \begin{bmatrix}
                                    FW11 & 0 & 0 & 0 \\
                                    0 & 0 & 0 & 0 \\
                                    0 & FW32 & 0 & 0 \\
                                    0 & 0 & FW43 & 0 \\
                                    0 & 0 & 0 & FW54 \\
                                    0 & 0 & 0 & 0 \\
                                \end{bmatrix}
                            =
                                \begin{bmatrix}
                                    -A(\hat{\omega}_i \Delta t)^T \Delta t & 0 & 0 & 0 \\
                                    0 & 0 & 0 & 0 \\
                                    0 & -^{G}\hat{R}_{I_i}  \Delta t & 0 & 0 \\
                                    0 & 0 & \Delta t & 0 \\
                                    0 & 0 & 0 & \Delta t \\
                                    0 & 0 & 0 & 0 \\
                                \end{bmatrix}
$$

$$
    \mathbf{P {F_{\tilde{x}}}^T}  =   \begin{bmatrix}
                                                        RR*FX11.T + RW*FX14.T & RP + RV*FX23.T & RA*FX35.T + RG*FX36.T + RR*FX31.T + RV & RW & RA & RG \\
                                                        PR*FX11.T + PW*FX14.T & PP + PV*FX23.T & PA*FX35.T + PG*FX36.T + PR*FX31.T + PV & PW & PA & PG \\
                                                        VR*FX11.T + VW*FX14.T & VP + VV*FX23.T & VA*FX35.T + VG*FX36.T + VR*FX31.T + VV & VW & VA & VG \\
                                                        WR*FX11.T + WW*FX14.T & WP + WV*FX23.T & WA*FX35.T + WG*FX36.T + WR*FX31.T + WV & WW & WA & WG \\
                                                        AR*FX11.T + AW*FX14.T & AP + AV*FX23.T & AA*FX35.T + AG*FX36.T + AR*FX31.T + AV & AW & AA & AG \\
                                                        GR*FX11.T + GW*FX14.T & GP + GV*FX23.T & GA*FX35.T + GG*FX36.T + GR*FX31.T + GV & GW & GA & GG \\
                                                    \end{bmatrix}
$$


$$
    \mathbf{F_{\tilde{x}} P {F_{\tilde{x}}}^T}  =   \begin{bmatrix}
                                                        FX11*(RR*FX11.T + RW*FX14.T) + FX14*(WR*FX11.T + WW*FX14.T) & FX11*(RP + RV*FX23.T) + FX14*(WP + WV*FX23.T) & FX11*(RA*FX35.T + RG*FX36.T + RR*FX31.T + RV) + FX14*(WA*FX35.T + WG*FX36.T + WR*FX31.T + WV) & FX11*RW + FX14*WW & FX11*RA + FX14*WA & FX11*RG + FX14*WG \\
                                                        FX23*(VR*FX11.T + VW*FX14.T) + PR*FX11.T + PW*FX14.T & FX23*(VP + VV*FX23.T) + PP + PV*FX23.T & FX23*(VA*FX35.T + VG*FX36.T + VR*FX31.T + VV) + PA*FX35.T + PG*FX36.T + PR*FX31.T + PV & FX23*VW + PW & FX23*VA + PA & FX23*VG + PG \\
                                                        FX31*(RR*FX11.T + RW*FX14.T) + FX35*(AR*FX11.T + AW*FX14.T) + FX36*(GR*FX11.T + GW*FX14.T) + VR*FX11.T + VW*FX14.T & FX31*(RP + RV*FX23.T) + FX35*(AP + AV*FX23.T) + FX36*(GP + GV*FX23.T) + VP + VV*FX23.T & FX31*(RA*FX35.T + RG*FX36.T + RR*FX31.T + RV) + FX35*(AA*FX35.T + AG*FX36.T + AR*FX31.T + AV) + FX36*(GA*FX35.T + GG*FX36.T + GR*FX31.T + GV) + VA*FX35.T + VG*FX36.T + VR*FX31.T + VV & FX31*RW + FX35*AW + FX36*GW + VW & FX31*RA + FX35*AA + FX36*GA + VA & FX31*RG + FX35*AG + FX36*GG + VG \\
                                                        WR*FX11.T + WW*FX14.T & WP + WV*FX23.T & WA*FX35.T + WG*FX36.T + WR*FX31.T + WV & WW & WA & WG \\
                                                        AR*FX11.T + AW*FX14.T & AP + AV*FX23.T & AA*FX35.T + AG*FX36.T + AR*FX31.T + AV & AW & AA & AG \\
                                                        GR*FX11.T + GW*FX14.T & GP + GV*FX23.T & GA*FX35.T + GG*FX36.T + GR*FX31.T + GV & GW & GA & GG \\


                                                    \end{bmatrix}
$$


$$

    \mathbf{P}  =   \begin{bmatrix}
                        RR & RP & RV & RW & RA & RG \\
                        PR & PP & PV & PW & PA & PG \\
                        VR & VP & VV & VW & VA & VG \\
                        WR & WP & WV & WW & WA & WG \\
                        AR & AP & AV & AW & AA & AG \\
                        GR & GP & GV & GW & GA & GG \\
                    \end{bmatrix}

                =
                    % \begin{bmatrix}
                    %     A11~A16 & A11~A16,A21~A26 & A11~A16,A31~A36 & A11~A16,A41~A46 & A11~A16,A51~A56 & A11~A16,A61~A66 \\
                    %     A21~A26,A11~A16 & A21~A26 & A21~A26,A31~A36 & A21~A26,A41~A46 & A21~A26,A51~A56 & A21~A26,A61~A66 \\
                    %     A31~A36,A11~A16 & A31~A36,A21~A26 & A31~A36 & A31~A36,A41~A46 & A31~A36,A51~A56 & A31~A36,A61~A66 \\
                    %     A41~A46,A11~A16 & A41~A46,A21~A26 & A41~A46,A31~A36 & A41~A46 & A41~A46,A51~A56 & A41~A46,A61~A66 \\
                    %     A51~A56,A11~A16 & A51~A56,A21~A26 & A51~A56,A31~A36 & A51~A56,A41~A46 & A51~A56 & A51~A56,A61~A66 \\
                    %     A61~A66,A11~A16 & A61~A66,A21~A26 & A61~A66,A31~A36 & A61~A66,A41~A46 & A61~A66,A51~A56 & A61~A66 \\
                    % \end{bmatrix}

                    \begin{bmatrix}
                        A11\sim A16 & A11\sim A16,A21\sim A26 & A11\sim A16,A31\sim A36 & A11\sim A16,A41\sim A46 & A11\sim A16,A51\sim A56 & A11\sim A16,A61\sim A66 \\
                        A21\sim A26,A11\sim A16 & A21\sim A26 & A21\sim A26,A31\sim A36 & A21\sim A26,A41\sim A46 & A21\sim A26,A51\sim A56 & A21\sim A26,A61\sim A66 \\
                        A31\sim A36,A11\sim A16 & A31\sim A36,A21\sim A26 & A31\sim A36 & A31\sim A36,A41\sim A46 & A31\sim A36,A51\sim A56 & A31\sim A36,A61\sim A66 \\
                        A41\sim A46,A11\sim A16 & A41\sim A46,A21\sim A26 & A41\sim A46,A31\sim A36 & A41\sim A46 & A41\sim A46,A51\sim A56 & A41\sim A46,A61\sim A66 \\
                        A51\sim A56,A11\sim A16 & A51\sim A56,A21\sim A26 & A51\sim A56,A31\sim A36 & A51\sim A56,A41\sim A46 & A51\sim A56 & A51\sim A56,A61\sim A66 \\
                        A61\sim A66,A11\sim A16 & A61\sim A66,A21\sim A26 & A61\sim A66,A31\sim A36 & A61\sim A66,A41\sim A46 & A61\sim A66,A51\sim A56 & A61\sim A66 \\
                    \end{bmatrix}2
$$

$$
    RR  =   \\
            A11*RR*A11.T + A11*RP*A12.T + A11*RV*A13.T + A11*RW*A14.T + A11*RA*A15.T + A11*RG*A16.T \\
            A12*PR*A11.T + A12*PP*A12.T + A12*PV*A13.T + A12*PW*A14.T + A12*PA*A15.T + A12*PG*A16.T \\
            A13*VR*A11.T + A13*VP*A12.T + A13*VV*A13.T + A13*VW*A14.T + A13*VA*A15.T + A13*VG*A16.T \\
            A14*WR*A11.T + A14*WP*A12.T + A14*WV*A13.T + A14*WW*A14.T + A14*WA*A15.T + A14*WG*A16.T \\
            A15*AR*A11.T + A15*AP*A12.T + A15*AV*A13.T + A15*AW*A14.T + A15*AA*A15.T + A15*AG*A16.T \\
            A16*GR*A11.T + A16*GP*A12.T + A16*GV*A13.T + A16*GW*A14.T + A16*GA*A15.T + A16*GG*A16.T \\
    \\

    RP  =   \\
            A11*RR*A21.T + A11*RP*A22.T + A11*RV*A23.T + A11*RW*A24.T + A11*RA*A25.T + A11*RG*A26.T \\
            A12*PR*A21.T + A12*PP*A22.T + A12*PV*A23.T + A12*PW*A24.T + A12*PA*A25.T + A12*PG*A26.T \\
            A13*VR*A21.T + A13*VP*A22.T + A13*VV*A23.T + A13*VW*A24.T + A13*VA*A25.T + A13*VG*A26.T \\
            A14*WR*A21.T + A14*WP*A22.T + A14*WV*A23.T + A14*WW*A24.T + A14*WA*A25.T + A14*WG*A26.T \\
            A15*AR*A21.T + A15*AP*A22.T + A15*AV*A23.T + A15*AW*A24.T + A15*AA*A25.T + A15*AG*A26.T \\
            A16*GR*A21.T + A16*GP*A22.T + A16*GV*A23.T + A16*GW*A24.T + A16*GA*A25.T + A16*GG*A26.T \\
    \\



    RV  =   \\
            A11*RR*A31.T + A11*RP*A32.T + A11*RV*A33.T + A11*RW*A34.T + A11*RA*A35.T + A11*RG*A36.T \\
            A12*PR*A31.T + A12*PP*A32.T + A12*PV*A33.T + A12*PW*A34.T + A12*PA*A35.T + A12*PG*A36.T \\
            A13*VR*A31.T + A13*VP*A32.T + A13*VV*A33.T + A13*VW*A34.T + A13*VA*A35.T + A13*VG*A36.T \\
            A14*WR*A31.T + A14*WP*A32.T + A14*WV*A33.T + A14*WW*A34.T + A14*WA*A35.T + A14*WG*A36.T \\
            A15*AR*A31.T + A15*AP*A32.T + A15*AV*A33.T + A15*AW*A34.T + A15*AA*A35.T + A15*AG*A36.T \\
            A16*GR*A31.T + A16*GP*A32.T + A16*GV*A33.T + A16*GW*A34.T + A16*GA*A35.T + A16*GG*A36.T \\
    \\

    PR  =   \\
            A21*RR*A11.T + A21*RP*A12.T + A21*RV*A13.T + A21*RW*A14.T + A21*RA*A15.T + A21*RG*A16.T \\
            A22*PR*A11.T + A22*PP*A12.T + A22*PV*A13.T + A22*PW*A14.T + A22*PA*A15.T + A22*PG*A16.T \\
            A23*VR*A11.T + A23*VP*A12.T + A23*VV*A13.T + A23*VW*A14.T + A23*VA*A15.T + A23*VG*A16.T \\
            A24*WR*A11.T + A24*WP*A12.T + A24*WV*A13.T + A24*WW*A14.T + A24*WA*A15.T + A24*WG*A16.T \\
            A25*AR*A11.T + A25*AP*A12.T + A25*AV*A13.T + A25*AW*A14.T + A25*AA*A15.T + A25*AG*A16.T \\
            A26*GR*A11.T + A26*GP*A12.T + A26*GV*A13.T + A26*GW*A14.T + A26*GA*A15.T + A26*GG*A16.T \\
    \\

    PP  =   \\
            A21*RR*A21.T + A21*RP*A22.T + A21*RV*A23.T + A21*RW*A24.T + A21*RA*A25.T + A21*RG*A26.T \\
            A22*PR*A21.T + A22*PP*A22.T + A22*PV*A23.T + A22*PW*A24.T + A22*PA*A25.T + A22*PG*A26.T \\
            A23*VR*A21.T + A23*VP*A22.T + A23*VV*A23.T + A23*VW*A24.T + A23*VA*A25.T + A23*VG*A26.T \\
            A24*WR*A21.T + A24*WP*A22.T + A24*WV*A23.T + A24*WW*A24.T + A24*WA*A25.T + A24*WG*A26.T \\
            A25*AR*A21.T + A25*AP*A22.T + A25*AV*A23.T + A25*AW*A24.T + A25*AA*A25.T + A25*AG*A26.T \\
            A26*GR*A21.T + A26*GP*A22.T + A26*GV*A23.T + A26*GW*A24.T + A26*GA*A25.T + A26*GG*A26.T \\
    \\

    PV  =   \\
            A21*RR*A31.T + A21*RP*A32.T + A21*RV*A33.T + A21*RW*A34.T + A21*RA*A35.T + A21*RG*A36.T \\
            A22*PR*A31.T + A22*PP*A32.T + A22*PV*A33.T + A22*PW*A34.T + A22*PA*A35.T + A22*PG*A36.T \\
            A23*VR*A31.T + A23*VP*A32.T + A23*VV*A33.T + A23*VW*A34.T + A23*VA*A35.T + A23*VG*A36.T \\
            A24*WR*A31.T + A24*WP*A32.T + A24*WV*A33.T + A24*WW*A34.T + A24*WA*A35.T + A24*WG*A36.T \\
            A25*AR*A31.T + A25*AP*A32.T + A25*AV*A33.T + A25*AW*A34.T + A25*AA*A35.T + A25*AG*A36.T \\
            A26*GR*A31.T + A26*GP*A32.T + A26*GV*A33.T + A26*GW*A34.T + A26*GA*A35.T + A26*GG*A36.T \\
    \\

