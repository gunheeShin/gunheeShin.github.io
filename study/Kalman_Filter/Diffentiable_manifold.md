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
   1. 
         