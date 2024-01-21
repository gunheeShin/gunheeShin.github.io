## Relative Transformation Matrix

### Rotation Matrix
1. w/o uncertainty
$$ 
    \ ^{W}_{k+1}R = \ ^{W}_{k}R \times  \ ^{k}_{k+1}R \rightarrow \ ^{k}_{k+1}R = \ ^{W}_{k}R^{-1} \times \ ^{W}_{k+1}R
    \tag{1}

$$
$$
    \ ^{k}_{k+1}T = \begin{bmatrix} 
                        \ ^{w}_{k}R^{T} & -\ ^{w}_{k}R^{T} \ ^{w}_{k}t \\
                        0 & 1
                    \end{bmatrix} 
                    \times 
                    \begin{bmatrix} 
                        \ ^{w}_{k+1}R & \ ^{w}_{k+1}t \\
                        0 & 1
                    \end{bmatrix}   
                    =
                    \begin{bmatrix} 
                        \ ^{w}_{k}R^{T} \ ^{w}_{k+1}R & \ ^{w}_{k}R^{T}(\ ^{w}_{k+1}t - \ ^{w}_{k}t) \\
                        0 & 1
                    \end{bmatrix}
    \tag{2}
$$

2. w/ uncertainty
    $$
        \ ^{W}_{k+1}\hat{R} \times Exp(\delta\ ^{W}_{k+1}\theta) = \left \{ \ ^{W}_{k}\hat{R} \times Exp(\delta\ ^{W}_{k}\theta)\right \} \times \left \{ \ ^{k}_{k+1}\hat{R} \times Exp(\delta\ ^{k}_{k+1}\theta) \right \} 
        \tag{7}
    $$

    

    If we let $
        \delta \ ^{W}_{k+1}\theta = f(\delta \ ^{W}_{k}\theta, \delta \ ^{k}_{k+1}\theta)$

    We want to get this form 
    $$
        \delta \ ^{W}_{k+1}\theta = \frac{\partial f(\delta \ ^{W}_{k}\theta, 0)}{\partial \delta \ ^{W}_{k} \theta} \delta \ ^{W}_{k} \theta + \frac{\partial f(0, \delta \ ^{k}_{k+1} \theta)}{\partial \delta \ ^{k}_{k+1} \theta} \delta \ ^{k}_{k+1} \theta
    $$

    Then we can get
    $$
        \ ^{W}_{k+1}\hat{R} \times f(\delta \ ^{W}_{k} \theta, \delta \ ^{k}_{k+1} \theta) = \left \{ \ ^{W}_{k}\hat{R} \times Exp(\delta\ ^{W}_{k} \theta)\right \} \times \left \{ \ ^{k}_{k+1}\hat{R} \times Exp(\delta\ ^{k}_{k+1} \theta) \right \} 
        \tag{9}
    $$

    First we need to get $\frac{\partial \delta \ ^{W}_{k+1} \theta}{\partial \delta \ ^{W}_{k} \theta}$
    $$
        \ ^{W}_{k+1}\hat{R} \times Exp(\delta\ ^{W}_{k+1} \theta) = \left \{ \ ^{W}_{k}\hat{T} \times Exp(\delta\ ^{W}_{k} \theta)\right \} \times \left \{ \ ^{k}_{k+1}\hat{R} \times Exp(\delta\ ^{k}_{k+1} \theta) \right \}
        \\
        \ ^{W}_{k+1}\hat{R} \times ( I + {\left \lfloor \delta\ ^{W}_{k+1} \theta \right \rfloor}_x ) = \left \{ \ ^{W}_{k}\hat{R} \times (I + {\left \lfloor \delta\ ^{W}_{k}  \theta \right \rfloor}_x ) \right \} \times \left \{ \ ^{k}_{k+1}\hat{R} \times (I + {\left \lfloor \delta\ ^{k}_{k+1} \theta \right \rfloor}_x ) \right \}
        \\           
        \ ^{W}_{k+1}\hat{R} \times ( I + f(\delta\ ^{W}_{k} \theta, \delta\ ^{k}_{k+1} \theta) ) = \left \{ \ ^{W}_{k}\hat{R} \times (I + {\left \lfloor \delta\ ^{W}_{k} \theta \right \rfloor}_x ) \right \} \times \left \{ \ ^{k}_{k+1}\hat{R} \times (I + {\left \lfloor \delta\ ^{k}_{k+1} \theta \right \rfloor}_x ) \right \}
    $$

    Let $\delta \ ^{k}_{k+1}R = 0$
    $$
        \ ^{W}_{k+1}\hat{R} \times ( I + f(\delta\ ^{W}_{k} \theta, 0) ) = \left \{ \ ^{W}_{k}\hat{R} \times (I + {\left \lfloor \delta\ ^{W}_{k} \theta \right \rfloor}_x ) \right \} \times \ ^{k}_{k+1}\hat{R}
        \\

        \ ^{W}_{k+1}\hat{R} \times f(\delta\ ^{W}_{k} \theta, 0) = \ ^{W}_{k}\hat{R} \times \left \lfloor \delta\ ^{W}_{k} \theta \right \rfloor_x \times \ ^{k}_{k+1}\hat{R}
        \\
        \ f(\delta\ ^{W}_{k} \theta, 0) =  {\ ^{k}_{k+1}\hat{R}}^{-1} \times \ \delta\ ^{W}_{k} \theta
        \\
        \frac{\partial f(\delta \ ^{W}_{k} \theta, 0)}{\partial \delta \ ^{W}_{k} \theta} = {\ ^{k}_{k+1}\hat{R}}^{-1} 
    $$

    Let $\delta \ ^{W}_{k} \theta = 0$
    $$
        \ ^{W}_{k+1}\hat{R} \times ( I + f(0, \delta\ ^{k}_{k+1} \theta) ) = \ ^{W}_{k}\hat{R} \times \left \{ \ ^{k}_{k+1}\hat{R} \times (I + {\left \lfloor \delta\ ^{k}_{k+1} \theta \right \rfloor}_x ) \right \}
        \\

        \ ^{W}_{k+1}\hat{R} \times f(0, \delta\ ^{k}_{k+1} \theta) = \ ^{W}_{k}\hat{R} \times \ ^{k}_{k+1}\hat{R} \times \left \lfloor \delta\ ^{k}_{k+1} \theta \right \rfloor_x
        \\
        \ f(0, \delta\ ^{k}_{k+1}  \theta) =  \left \lfloor \delta\ ^{k}_{k+1} \theta \right \rfloor_x
        \\
        \frac{\partial f(0, \delta \ ^{k}_{k+1} \theta)}{\partial \delta \ ^{k}_{k+1} \theta} = I
    $$

    Then we can get
    $$
        \delta \ ^{W}_{k+1} \theta = {\ ^{k}_{k+1}\hat{R}}^{-1} \delta \ ^{W}_{k} \theta + \delta \ ^{k}_{k+1} \theta
    $$

    If we know the covariance of $\delta \ ^{W}_{k} \theta$ (=$^{W}_{k}P$) and $\delta \ ^{k}_{k+1} \theta$ (=$^{k}_{k+1}P$), we can get covariance of $\delta \ ^{W}_{k+1} \theta$ (=$^{W}_{k+1}P$)
    $$
        \ ^{W}_{k+1}P = {\ ^{k}_{k+1}\hat{R}}^{-1} \times \ ^{W}_{k}P \times {\ ^{k}_{k+1}\hat{R}}^{-T} + \ ^{k}_{k+1}P
    $$
    Or, if we know $^{W}_{k+1}P$ and $^{W}_{k}P$, we can get $^{k}_{k+1}P$
    $$
        \ ^{k}_{k+1}P = ^{W}_{k+1}P - {\ ^{k}_{k+1}\hat{R}}^{-1} \times \ ^{W}_{k}P \times {\ ^{k}_{k+1}\hat{T}}^{-T}
    $$

### Translation Matrix
1. w/o uncertainty
$$
    \ ^{W}_{k+1}t = \ ^{W}_{k}t + \ ^{W}_{k}R \times \ ^{k}_{k+1}t
$$

2. w/ uncertainty
    $$
        \ ^{W}_{k+1}\hat{t} + \delta \ ^{W}_{k+1}t = \ ^{W}_{k}\hat{t} + \delta \ ^{W}_{k}t + \ ^{W}_{k}\hat{R} \times Exp(\delta \ ^{W}_{k}\theta) \times \ ( \ ^{k}_{k+1}\hat{t} + \delta \ ^{k}_{k+1}t )
    $$ 
    $$
        \ ^{W}_{k+1}\hat{t} + \delta \ ^{W}_{k+1}t = \ ^{W}_{k}\hat{t} + \delta \ ^{W}_{k}t + \ ^{W}_{k}\hat{R} \times ( I + {\left \lfloor \delta \ ^{W}_{k}\theta \right \rfloor}_x ) \times \ ( \ ^{k}_{k+1}\hat{t} + \delta \ ^{k}_{k+1}t )
    $$
    $$
        \delta \ ^{W}_{k+1}t = \delta \ ^{W}_{k}t + \ ^{W}_{k}\hat{R} \times {\left \lfloor \delta \ ^{W}_{k}\theta \right \rfloor}_x \times  \ ^{k}_{k+1}\hat{t} + \ ^{W}_{k}\hat{R} \times \delta \ ^{k}_{k+1}t + \ ^{W}_{k}\hat{R} \times {\left \lfloor \delta \ ^{W}_{k}\theta \right \rfloor}_x \times \delta \ ^{k}_{k+1}t
    $$

    let, $\delta \ ^{W}_{k+1} t = f(\delta \ ^{W}_{k} t, \delta \ ^{k}_{k+1} t, \delta \ ^{W}_{k} \theta)$
    $$
        \delta \ ^{W}_{k+1} t = \frac{\partial f(\delta \ ^{W}_{k} t, 0, 0)}{\partial \delta \ ^{W}_{k} t} \delta \ ^{W}_{k} t + \frac{\partial f(0, \delta \ ^{k}_{k+1} t, 0)}{\partial \delta \ ^{k}_{k+1} t} \delta \ ^{k}_{k+1} t + \frac{\partial f(0, 0, \delta \ ^{W}_{k} \theta)}{\partial \delta \ ^{W}_{k} \theta} \delta \ ^{W}_{k} \theta
    $$

    First,
    $$
        f(\delta \ ^{W}_{k} t, 0, 0) = \delta \ ^{W}_{k} t
        \\
        \frac{\partial f(\delta \ ^{W}_{k} t, 0, 0)}{\partial \delta \ ^{W}_{k} t} = I
    $$
    Second,
    $$
        f(0, \delta \ ^{k}_{k+1} t, 0) = \ ^{W}_{k}\hat{R} \times \delta \ ^{k}_{k+1} t
        \\
        \frac{\partial f(0, \delta \ ^{k}_{k+1} t, 0)}{\partial \delta \ ^{k}_{k+1} t} = \ ^{W}_{k}\hat{R}
    $$
    Third,
    $$
        f(0, 0, \delta \ ^{W}_{k} \theta) = \ ^{W}_{k}\hat{R} \times {\left \lfloor \delta \ ^{W}_{k}\theta \right \rfloor}_x \times \ ^{k}_{k+1}\hat{t}
        \\
        \frac{\partial f(0, 0, \delta \ ^{W}_{k} \theta)}{\partial \delta \ ^{W}_{k} \theta} = \ ^{W}_{k}\hat{R} \ \left \lfloor \ -^{k}_{k+1}\hat{t} \right \rfloor_x
    $$
    Then,
    $$
        \delta \ ^{W}_{k+1} t = \delta \ ^{W}_{k} t + \ ^{W}_{k}\hat{R} \times \delta \ ^{k}_{k+1} t + \ ^{W}_{k}\hat{R} \times {\left \lfloor  -^{k}_{k+1}\hat{t} \right \rfloor}_x \times \delta \ ^{W}_{k} \theta
    $$

    If we know the covariance of $\delta \ ^{W}_{k} t$ (=$^{W}_{k}P$) and $\delta \ ^{k}_{k+1} t$ (=$^{k}_{k+1}P$), we can get covariance of $\delta \ ^{W}_{k+1} t$ (=$^{W}_{k+1}P$)
    $$
        \ ^{W}_{k+1}P = \ ^{W}_{k}P + \ ^{W}_{k}\hat{R} \times \ ^{k}_{k+1}P \times \ ^{W}_{k}\hat{R}^{T} + \ ^{W}_{k}\hat{R} \times {\left \lfloor  -^{k}_{k+1}\hat{t} \right \rfloor}_x \times \ ^{W}_{k}P \times {\left \lfloor  -^{k}_{k+1}\hat{t} \right \rfloor}_x^T \times \ ^{W}_{k}\hat{R}^{T}
    $$

    Or, if we know $^{W}_{k+1}P$ and $^{W}_{k}P$, we can get $^{k}_{k+1}P$
    $$
        \delta \ ^{k}_{k+1}t = \ ^{W}_{k}\hat{R}^{T}  \  \delta \ ^{W}_{k+1}t - \ ^{W}_{k}\hat{R}^{T} \ \delta \ ^{W}_{k}t - \left \lfloor  -^{k}_{k+1}\hat{t} \right \rfloor_x  \ ^{W}_{k}P \ {\left \lfloor  -^{k}_{k+1}\hat{t} \right \rfloor}_x^T
    $$

            
## Point Transformation
1. Transform point from local frame to world frame
    $$
        \ ^{W}P = \ ^{W}_{L}R \ ^{L}P + \ ^{W}_{L}t
    $$
2. SE(3) Transformation has uncertainty and point w.r.t local frame has also uncertainty
    $$
        \ ^{W}\hat{P} + \delta \ ^{W}P = \ ^{W}_{L}\hat{R} \ Exp(\delta \ ^{W}_{L} \theta) \times ( \ ^{L}\hat{P} + \delta \ ^{L}P ) + \ ^{W}_{L}\hat{t} + \delta \ ^{W}_{L}t
    $$

    $$
        \ ^{W}\hat{P} + \delta \ ^{W}P = \ ^{W}_{L}\hat{R} \ (I + {\left \lfloor \delta \ ^{W}_{L} \theta \right \rfloor}_x) \times ( \ ^{L}\hat{P} + \delta \ ^{L}P ) + \ ^{W}_{L}\hat{t} + \delta \ ^{W}_{L}t
    $$
    $$
        \delta \ ^{W}P = \ ^{W}_{L}\hat{R} \ \left \lfloor \delta \ ^{W}_{L} \theta \right \rfloor_x \delta \ ^{L}P + \ ^{W}_{L}\hat{R} \ \delta \ ^{L}P + \ ^{W}_{L}\hat{R} \ \left \lfloor \delta \ ^{W}_{L} \theta \right \rfloor_x \ \delta \ ^{L}P + \delta \ ^{W}_{L}t
    $$

    let, $\delta \ ^{W}P = f(\delta \ ^{W}_{L} \theta, \delta \ ^{W}_{L}t, \delta \ ^{L}P)$
    $$
        \delta \ ^{W}P = \frac{\partial f(\delta \ ^{W}_{L}\theta, 0, 0)}{\partial \delta \ ^{W}_{L}\theta} \delta \ ^{W}_{L}\theta + \frac{\partial f(0, \delta \ ^{W}_{L}t, 0)}{\partial \delta \ ^{W}_{L}t} \delta \ ^{W}_{L}t + \frac{\partial f(0, 0, \delta \ ^{L}P)}{\partial \delta \ ^{L}P} \delta \ ^{L}P
    $$

    First,
    $$
        f(\delta \ ^{W}_{L}\theta, 0, 0) = \ ^{W}_{L}\hat{R} \ \left \lfloor \delta \ ^{W}_{L} \theta \right \rfloor_x \delta \ ^{L}P
        \\
        \frac{\partial f(\delta \ ^{W}_{L}R, 0, 0)}{\partial \delta \ ^{W}_{L}R} = \ ^{W}_{L}\hat{R} \ \left \lfloor - \delta \ ^{L}P \right \rfloor_x
    $$

    Second,
    $$
        f(0, \delta \ ^{W}_{L}t, 0) = \delta \ ^{W}_{L}t
        \\
        \frac{\partial f(0, \delta \ ^{W}_{L}t, 0)}{\partial \delta \ ^{W}_{L}t} = I
    $$

    Third,
    $$
        f(0, 0, \delta \ ^{L}P) = \ ^{W}_{L}\hat{R} \ \delta \ ^{L}P
        \\
        \frac{\partial f(0, 0, \delta \ ^{L}P)}{\partial \delta \ ^{L}P} = \ ^{W}_{L}\hat{R}
    $$

    Then,
    $$
        \delta \ ^{W}P = \ ^{W}_{L}\hat{R} \ \left \lfloor - \delta \ ^{L}P \right \rfloor_x \delta \ ^{W}_{L}\theta + \delta \ ^{W}_{L}t + \ ^{W}_{L}\hat{R} \ \delta \ ^{L}P
    $$

    Covariance of $\delta \ ^{W}P$ (=$^{W}P$) can be calculated by
    $$
        \Sigma _{^{W}P} = \ ^{W}_{L}\hat{R} \ \Sigma_{^{L}P} \ \ ^{W}_{L}\hat{R}^{T} + \ ^{W}_{L}\hat{R} \left \lfloor - \delta \ ^{L}P \right \rfloor_x \Sigma_{R} \left \lfloor - \delta \ ^{L}P \right \rfloor_x^{T} \ ^{W}_{L}\hat{R}^{T} + \Sigma_{t}


                            
