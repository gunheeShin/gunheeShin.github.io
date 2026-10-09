---
# Private sponsor: only paper material (ICCAS 2026).
kind: project
title: "Online Radar-LiDAR-Camera Calibration for Autonomous Vehicles"
sponsor: LG Innotek
period: 2025 – 2027
confidential: "Confidential project. Figures and results shown are from the published paper."
links:
  - {name: "Paper (ICCAS 2026)", url: "https://arxiv.org/abs/2610.04552"}
published: true

teaser:
  src: /assets/img/projects/teasers/lg-innotek-calib.mp4
  caption: "LiDAR points in the camera image: reference extrinsics (left) and the online estimate converging (right)."

overview:
  points:
    - "Keep radar, LiDAR, and camera on a vehicle calibrated to each other while it drives, with no target."
    - "Then use the calibrated sensors for simultaneous calibration, localization, and mapping."
    - "**First-year targets met**; published as a first-author paper at ICCAS 2026."
  fig:
    src: /assets/img/projects/lg-innotek-calib/pipeline.jpg
    caption: "The online calibration framework (from the paper). I built all of it."

glance:
  - {label: Platform, value: "Passenger vehicle"}
  - {label: Sensors, value: "4D radar, LiDAR, camera"}
  - {label: Environment, value: "Urban driving"}

mypart:
  - title: "Lead developer, planning to evaluation"
    text: "Targets, every module, vehicle data and ground truth, and the evaluation."
  - title: "Joint optimization over all three pairs"
    text: "All three extrinsics optimized together, so the strong camera-LiDAR pair stabilizes the radar pairs."
    result: "Lower error on all pairs; largest gain with radar"
    fig: {src: /assets/img/projects/lg-innotek-calib/result.jpg, caption: "Rotation and translation errors vs. CMRNext (from the paper)."}
  - title: "Making radar usable"
    text: "An adaptive radar noise filter and accumulation of sparse radar matches over frames."
---
