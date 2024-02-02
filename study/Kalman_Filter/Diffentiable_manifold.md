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
      2. $\boxplus$ / $\boxminus$ operator를 통해 다음 식들도 유도할 수 있다.
        $$ x \boxplus (y \boxminus x) = y$$
        $$ (x \boxplus u) \boxminus x = u \tag{3}$$
      3.  의 의미는 $x \in \cal{M}$에서 $u \in \mathbb{R}^n$만큼의 perturbation을 가한 점이라는 것이다.
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


## Important manifolds and their derivatives
### 2-sphere : $\mathbb{S}^2$
   #### Overview
   1. 2-sphere
   $$
      \mathbb{S}^2 \cong \left \{ x \in \mathbb{R}^3 \mid \|x\| = r, r \gt 0 \right \}
   $$

   2. 2-sphere의 \boxplus / \boxminus operator
      $$
         x \boxplus u = R(B(x) \cdot u) \cdot x
      $$
      $$
         y \boxminus x = B(x)^T \left ( \theta \frac{ \left \lfloor x \right \rfloor y}{\left \| \left \lfloor x \right \rfloor y \right \|} \right ), \theta = atan2(\left \| \left \lfloor x \right \rfloor y \right \|, x^T y)
      $$
      $$ x \oplus v = R(v) \cdot x$$
      1. $R(W) = Exp(W) \in SO(3)$은 $W \in \mathbb{R}^3$에 대한 axis-angle로 회전하는 rotation.
      2. $B(x) = [b_1(x), b_2(x)] \in \mathbf{R}^{3 \times 2}$는 x에 대한 orthonormal basis이며 $x \in \mathbb{S}^2$의 접평면(tangent plane) 위에 있다.

   3. Derivative
   $$ \frac{\partial (((x \boxplus u) \oplus v) \boxminus y)}{\partial u} = N((x \boxplus u) \oplus v, y)R(v)M(x,u)$$

   $$ \frac{\partial (((x \boxplus u) \oplus v) \boxminus y)}{\partial v} = N((x \boxplus u) \oplus v, y)R(v) \left \lfloor x \boxplus u \right \rfloor A(v)^T$$

   $$ N(x,y) = \frac{\partial(x \boxminus y)}{\partial x} = B(y)^T (\frac{\theta}{\| \left \lfloor y \right \rfloor x \|} \left \lfloor y \right \rfloor x P(x,y))
   $$   

   $$ M(x,u) = \frac{\partial(x \boxplus u)}{\partial u} = -Exp(B(x)u) \| \left \lfloor x \right \rfloor A(B(x)u)^T B(x)$$

   $$ P(x,y) = \frac{1}{r^4} ( \frac{-y^T x \| \left \lfloor y \right \rfloor x \| + r^4 \theta}{\| \left \lfloor y \right \rfloor x \| ^3}x^T \left \lfloor y \right \rfloor ^2 - y^T )$$ 

   #### Explanation
   1. $x \in \mathbb{S}^2$에서의 perturbation x의 접평면에서 벡터 x에 대한 회전으로 표현되고 이는 $\mathbb{S}^2$에 여전히 있다.
   2. 그러므로 perturbation은 $u \in \mathbb{R}^2$로 parameterized된다.
   3. $\boxplus$ operator는 다음 과정을 통해 이루어 진다.
      ![S2_manifold](/fig/Diffentiable_manifold/S2_manifold.png)
      1. x의 접평면 위에 있는 2-dimension 벡터 u를 두개의 orthonormal basis vector $b_1, b_2$로 표현한다.
      2. 위 그림과 같이 x는 $b_1, b_2$ 방향으로 회전한다.
   4. $\boxminus$는 $\boxplus$의 inverse이다.
      1. $ \mathbb{S}^2$에서의 두 states 사이의 rotation vector를 구하는 것이다.

   