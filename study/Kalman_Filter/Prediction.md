## 코드 설명

1. Input & Output
    ```cpp
    void ImuProcess::UndistortPcl(const common::MeasureGroup &meas,
                                 esekfom::esekf<state_ikfom, 12, input_ikfom> &kf_state,
                                 PointCloudType &pcl_out)
    ```
    - 입력
      - meas : IMU, LiDAR 데이터가 들어있음
      - kf_state : 현재 state
    - 출력    
      - pcl_out : Motion compensation이 적용된 LiDAR pointcloud

2. IMU 데이터 준비
   ```cpp
    auto v_imu = meas.imu_;
    v_imu.push_front(last_imu_);
    const double &imu_beg_time = v_imu.front()->header.stamp.toSec();
    const double &imu_end_time = v_imu.back()->header.stamp.toSec();
   ```
3. LiDAR pointcloud 준비
   ```cpp
    const double &pcl_beg_time = meas.lidar_bag_time_;
    const double &pcl_end_time = meas.lidar_end_time_;
    pcl_out = *(meas.lidar_);
    sort(pcl_out.points.begin(), pcl_out.points.end(), time_list);
   ```
4. Forward Propagtion
   1. 현재 pose 넣기
        ```cpp
        state_ikfom imu_state = kf_state.get_x();
        IMUpose_.clear();
        IMUpose_.push_back(common::set_pose6d(0.0, acc_s_last_, angvel_last_, imu_state.vel, imu_state.pos,
                                            imu_state.rot.toRotationMatrix()));
        ```
        - IMUpose_는 ```std::vector<common::Pose6D>``` 형태로 forward propagation을 과정에서 pose정보를 담는다.
            <details>
            <summary>common::Pose6D</summary>
            <div markdown="1">
            
                float64  offset_time # the offset time of IMU measurement w.r.t the first lidar point
                float64[3] acc       # the preintegrated total acceleration (global frame) at the Lidar origin
                float64[3] gyr       # the unbiased angular velocity (body frame) at the Lidar origin
                float64[3] vel       # the preintegrated velocity (global frame) at the Lidar origin
                float64[3] pos       # the preintegrated position (global frame) at the Lidar origin
                float64[9] rot       # the preintegrated rotation (global frame) at the Lidar origin
            </div>
            </details>

        - 처음이니 offset time은 0.
        - 아직 input값을 넣기 전이니 바로 이전 IMU input값인 ```acc_s_last_, angvel_last_```를 넣는다.
        - 현재 state인 ```imu_state```에서 ```vel, pos, rot```를 넣는다.
    2. IMU input 값들 처리
       ```cpp
       for (auto it_imu = v_imu.begin(); it_imu < (v_imu.end() - 1); it_imu++) {
            auto &&head = *(it_imu);
            auto &&tail = *(it_imu + 1);

            angvel_avr << 0.5 * (head->angular_velocity.x + tail->angular_velocity.x),
                0.5 * (head->angular_velocity.y + tail->angular_velocity.y),
                0.5 * (head->angular_velocity.z + tail->angular_velocity.z);
            acc_avr << 0.5 * (head->linear_acceleration.x + tail->linear_acceleration.x),
                0.5 * (head->linear_acceleration.y + tail->linear_acceleration.y),
                0.5 * (head->linear_acceleration.z + tail->linear_acceleration.z);

            acc_avr = acc_avr * common::G_m_s2 / mean_acc_.norm();

            in.acc = acc_avr;
            in.gyro = angvel_avr;

            Q_.block<3, 3>(0, 0).diagonal() = cov_gyr_;
            Q_.block<3, 3>(3, 3).diagonal() = cov_acc_;
            Q_.block<3, 3>(6, 6).diagonal() = cov_bias_gyr_;
            Q_.block<3, 3>(9, 9).diagonal() = cov_bias_acc_;
            
            kf_state.predict(dt, Q_, in);
       ```
        <!-- - angular velocity와 linear acceleration의 평균을 구한다. -->
        - ```angvel_avr```와 ```acc_avr```의 평균을 구한다.
        - 마지막 줄처럼 acc_avr를 처리해 주는 이유는 방향을 유지한 채로 크기를 중력가속도로 맞춰주기 위함이다.
        - ```mean_acc_```는 initialization 과정에서 IMU acceleration의 평균을 구해놓은 값이다.
        - ```Q_```는 IMU noise covariance matrix이다. 이들은 모두 yaml파일로 부터 읽어온다.

        ```cpp
            imu_state = kf_state.get_x();

            angvel_last_ = angvel_avr - imu_state.bg;
            acc_s_last_ = imu_state.rot * (acc_avr - imu_state.ba);
            for (int i = 0; i < 3; i++) {
                acc_s_last_[i] += imu_state.grav[i];
            }

            double &&offs_t = tail->header.stamp.toSec() - pcl_beg_time;

            IMUpose_.emplace_back(common::set_pose6d(offs_t, acc_s_last_, angvel_last_, imu_state.vel, imu_state.pos,
                                                    imu_state.rot.toRotationMatrix()));
        ```
        - angular velocity와 linear acceleration의 bias를 빼준다.
        - linear acceleration은 gravity acceleration의 영향을 제거해주기 위해 world frame으로 변환해주고 gravity acceleration을 더해준다.