# Bayes Filter

## 1. Conditional Probability(조건부 확률)
- 어느 R.V은 다른 R.V의 영향을 받는 경우가 있다.
  - 만약 우리가 R.V. Y의 값이 y라는 것을 사전에 알고 있을 때, R.V. X의 값이 x일 확률을 구하고 싶다고 해보자.
  - Odometry에서는 센서를 통해 measurement를 Y를 알았을 때 로봇의 위치를 X로 추정하고 싶은 경우를 생각할 수 있다.
- 식으로 표현하면,
$$ 
\begin{equation} 
    P(x|y) = P(X=x|Y=y) 
    \tag{1} 
\end{equation}
$$


- 만약, R.V. X와 Y가 독립이라면, 식 (1)은 다음과 같이 표현할 수 있다.
    $$ P(x|y) = \frac{P(x,y)}{P(y)} = \frac{P(x)P(y)}{P(y)} = P(x) \tag{2}$$
  - 식 (2)에서 알 수 있듯이, X와 Y가 독립이라면, X의 값이 y에 영향을 받지 않는다.
- 식 (2)를 다음과 같이 바꿔보자. 
   $$ P(x,y) = P(x|y)P(y) \tag{3}$$
   $$ P(x) = \int P(x,y)dy = \int P(x|y)P(y)dy \tag{4}$$
   - 식(4)은 marginalization, total probability law를 참고하면 된다.
   - 참고로, 해당 식은 continuous space에서의 확률을 다루고 있다.
 - 위 식들을 다음 파트에서 Bayesian Filter를 유도할 때 사용된다.


## 2. Bayes' Rule
- Bayes' Rule은 $P(x|y)$를 $P(y|x)$를 이용하여 표현할 수 있다는 점에 주목한다.
- 식으로 표현하면,
$$
\begin{equation}
    P(x|y) = \frac{P(y|x)P(x)}{P(y)} = \frac{P(y|x)P(x)}{\int P(y|x)P(x)dx} \tag{5}
\end{equation}
$$

- 우리가 구하고 싶은 것은 $P(x|y)$이다. 즉, 어떤 measurement y가 주어졌을 때, x의 probability distribution(PD)을 구하고 싶다는 것이다.
- 그런데 왜 $P(x|y)$를 $P(y|x)$를 통해 구하는 것일까? 그 이유는 우리가 활용할 수 있는 데이터를 보면 알 수 있다. 
  - 먼저, $P(x)$는 prior PD이다. 즉, 어떤 measurement y가 주어지기 전에 x의 PD이다. Fast-LIOd에서는 IMU를 이용하여 forward propagation을 통해 x의 prior PD를 구한다.
  - 다음 y는 sensor measurement이다.
  - 자, 그럼 $P(y|x)$는 무엇일까? 
    - 이 식을 이해하기 위해서는 사전에 Map이 있다는 것을 인지해야 한다. 이때 사전의 map은 아예 이전에 offline으로 만들어진 map일 수도 있고 현재 로봇이 구동하면서 online으로 world 좌표계에서 만들고 있는 map일 수도 있다.
    - 이때, $P(y|x)$는 로봇이 어느정도 불확실성을 가지고 map에 어떤 위치에 있을 때 측정한 sensor measurement y가 나올 확률이다.
  - 마지막으로 $P(x|y)$는 posterior PD이다.     


   


