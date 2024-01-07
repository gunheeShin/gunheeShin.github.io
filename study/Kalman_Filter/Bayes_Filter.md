# Bayes Filter

## 1. Conditional Probability(조건부 확률)
- 어느 R.V은 다른 R.V의 영향을 받는 경우가 있다.
  - 만약 우리가 R.V. Y의 값이 y라는 것을 사전에 알고 있을 때, R.V. X의 값이 x일 확률을 구하고 싶다고 해보자.
  - Odometry에서는 센서를 통해 measurement를 Y를 알았을 때 로봇의 위치를 X로 추정하고 싶은 경우를 생각할 수 있다.
- 식으로 표현하면,
<!-- $$ P(x|y) = P(X=x|Y=y) \tag{1}\label{2}$$ -->
$$ 
\begin{equation} 
    P(x|y) = P(X=x|Y=y) 
    \label{11}\tag{1} 
\end{equation}
$$


- 만약, R.V. X와 Y가 독립이라면, 식 {eq:1}은 다음과 같이 표현할 수 있다.

