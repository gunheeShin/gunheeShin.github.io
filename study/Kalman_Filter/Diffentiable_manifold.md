## What is a differentiable manifold?
1. Manifold란?
   1. n차원의 manifold $\cal{M}$이 있다고 하자.
   2. $\cal{M}$의 모든 점에는 각각 local하게 n차원의 $\mathbb{R}^n$(homeomorphic space)이 존재한다.
      1. 더 자세하게 표현하면, $\cal{M}$의 어느 점 x에 대해, x를 포함하는 open subset $\,U$이 있을때, $U$ 내의 모든 점을 $\mathbb{R}^n$의 open subset와 1:1 대응시키는 함수(bijective function) $\,\phi$가 존재한다.
2. Differentiable manifold란?
   1. ($U$, $\phi$) pair를 chart라고 한다.
   <!-- 2. 만약 ($U$, $\phi$), ($V$, $\psi$) 두개의 chart가 있고 overlap하는 부분이 존재한다고 했을때,  -->

## $\boxplus$ / $\boxminus$ operator
1. $\cal{M}$의 모든 점에 대해서 homeomorphism이 존재한다는 것은 우리에게 $\boxplus$ / $\boxminus$ 라는 operator를 정의할 수 있게 해준다.

    ![boxplus_minus](/fig/Diffentiable_manifold/boxplus_minus.png)


   1. $\boxplus$ operator
    $$ 
        \boxplus : \cal{M} \times \mathbb{R}^n \rightarrow \cal{M} $$
    $$
        x \boxplus u = ^{\cal{M}}\phi^{-1}_x(u)
        \tag{1} 
    $$

   2. $\boxminus$ operator
        $$ 
            \boxminus : \cal{M} \times \cal{M} \rightarrow \mathbb{R}^n $$
        $$
            y \boxminus x = ^{\cal{M}}\phi_x(y)
            \tag{2} 
     $$

   3. $\boxplus$ / $\boxminus$ operator의 설명
      1. $^{M}\phi_x$는 $\, x \in \cal{M}$의 local 영역에서의 homeomorphism이다.
      2. $boxplus$ / $boxminus$ operator를 통해 다음 식들도 유도할 수 있다.
        $$ x \boxplus (y \boxminus x) = y$$
        $$ (x \boxplus u) \boxminus x = u \tag{3}$$
      3. $y = x \boxplus u$의 의미는 $x \in \cal{M}$에서 $u \in \mathbb{R}^n$만큼의 perturbation을 가한 점이라는 것이다.
      4. $u = y \boxminus x$를 통해서는 $x \in \cal{M}$에서 $y \in \cal{M}$으로 가는 perturbation $\,u$를 구할 수 있다.

2. Local homeomorphic space 결정
   1. $\cal{M}$ subset $U$에 대한 homeomorphism은 유일하지 않다.(not unique)
   2. 우리는 Local homeomorphic space로 minimal parameterization된 tangent space를 사용한다.
   3. differential manifold는 minimal parameterization된 tangent space가 항상 존재하고  minimal parameterization은 본질적으로 perturbation을 표현한다.

3. $\cal{M}$이 Lie group(e.g. $\,\mathbb{R}^n$, SO(3), SE(3))인 경우
   1. Lie group의 tangent space(minimal parameterization)에서는 다음 두가지가 존재
      1. m : Lie algebra
      2. exp : (m -> $\cal{M}$) : exponential map
   2. Let,
      1.  f:( $\mathbb{R}^n$ -> m) : minimal parameterization space에서 Lie algebra로 mapping 함수
      2.  Exp = exp $\circ$ f with inverse Log
      3.  x $\boxplus$ u = x $\boxplus$ f(u) = Exp(u)
      4.  y $\boxminus$ x = Log($x^{-1}$ y)
4.  $\cal{M}$이 Lie group가 아닌 경우 (ex, $\mathbb{S}^2$)
    1. $\cal{M}$이 Lie group가 아닌 경우, manifold와 minimal parameterization space간에 homeomorphism에 대한 general한 기준이 없다.
    2. $\mathbb{S}^2 : \{x \in \mathbb{R}^3 \mid \|x\| = r, r \gt 1\}$의 경우
       1. 어떤 점 x에 대한 minimal parameterization space(tangent space)는 x에서의 접평면이다.
       2. 점 x에 대한 perturbation u는 접평면 위에서 x를 중심으로 회전시킨 벡터이다.
       3. 접평면 위에서의 rotation vector는 두개의 basis vector로 minimally parameterized된다. ($u \in \mathbf{R}^2$)
       4. $x \boxplus u$ = $R(B(x) \cdot u) \cdot x$ ;$\,$ $B(x) = [b_1(x), b_2(x)] \in \mathbf{R}^{3 \times 2}$
          1. R(w) = $Exp(w) \in SO(3)$는 W벡터에 대한 axis-angle로 회전하는 rotation matrix이다.
       5. $b_1(x)$, $b_2(x)$는 unique하지 않고, 둘은 서로 orhogonal해야하고 x에 대해 perpendicular해야한다.