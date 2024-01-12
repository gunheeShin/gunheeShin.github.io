# Normal Distribution
- Probabilistic Robotics에서는 sensor measurement, robot pose와 같은 quantities를 `랜덤변수(random variable, R.V.)`로 다룬다.
- 또한, robotics에서 estimation 및 decision making은 continuous space에서 이루어진다.
- Continuous space에서는 discrete space와 달리 연속적인 R.V.를 다루어야 하고, 이를 위해 `확률밀도함수(probability density function, pdf)`를 사용한다.
- 가장 대표적인 pdf인 `정규분포(normal distribution)`에 대해 알아보자.
  
  ## Normal Distribution in Continuous Space
    - 정규분포 식에서 x는 R.V.이고, x가 scalar(1-D)일 경우와 vector(Multi-D)일 경우 식의 표현이 다르다. (하지만 같은 의미)
    - 1-D 
      - $\mu$: 평균(mean), $\sigma$: 표준편차(standard deviation)라고 한다면 정규분포는 다음과 같다. 
       $$p(x) = \frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$$ 
   - Multi-D
     - x가 vector일 경우, normal distribution을 multivariate normal distribution이라고 한다.
     - $\mu$: 평균 벡터(mean vector), $\Sigma$: 공분산 행렬(covariance matrix)라고 한다면 정규분포는 다음과 같다.
        $$p(x) = \frac{1}{\sqrt{(2\pi)^n|\Sigma|}}e^{-\frac{1}{2}(x-\mu)^T\Sigma^{-1}(x-\mu)}$$
      - 여기서 x의 dimension은 n이라 하면, $\mu$의 dimension은 n이고, $\Sigma$의 dimension은 $n\times n$이다.


