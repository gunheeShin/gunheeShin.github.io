---
kind: project
title: "Mobility Intelligence Software for Legged Robots"
sponsor: "KEIT (Korea Evaluation Institute of Industrial Technology)"
period: 2022 – 2026
links:
  - {name: "Paper: SE(3)-LIO (ICRA 2026)", url: "https://arxiv.org/abs/2603.16118"}
  - {name: "Paper: NM-LIO (RiTA 2024)", url: "https://arxiv.org/abs/2610.04551"}
published: true

teaser:
  src: /assets/img/projects/teasers/keit-quadruped.jpg
  caption: "A Go1 with the two-LiDAR sensor unit at the orchard test site."

overview:
  points:
    - "A five-year national project: software that lets quadruped robots move on their own through unstructured sites."
    - "Tested at a disaster-response course, a substation, and an orchard; phase 2 extends it to a two-robot team."
    - "**Phase 1 met all eight targets** and passed a certified third-party test; phase 2 met its three error targets."
  modules:
    - {name: "Sensors", note: "two LiDARs, camera, IMU", mine: true}
    - {name: "Odometry and localization", mine: true}
    - {name: "Static map and terrain"}
    - {name: "Navigation and control"}
    - {name: "Mission and teleoperation"}

glance:
  - {label: Platform, value: "Unitree Go1 and Go2"}
  - {label: Sensors, value: "Two Livox Mid-360, camera, IMU"}
  - {label: Environment, value: "Disaster course, substation, orchard"}

mypart:
  - title: "Two-LiDAR sensor system"
    text: "Replaced one Ouster OS0-128 with two Livox Mid-360s, calibrated them, and moved the stack to ROS 2."
  - title: "NM-LIO (RiTA 2024)"
    text: "Multi-LiDAR odometry that models each LiDAR's noise, so the second LiDAR adds coverage, not error."
    result: "13.45 cm relative error after a 1 km course"
    fig: {src: /assets/img/projects/keit-quadruped/nmlio.jpg, caption: "NM-LIO overview (from the paper)."}
  - title: "SE(3)-LIO (ICRA 2026)"
    text: "Odometry that stays smooth through the shaking of a walking robot; runs on both phase-2 robots."
    result: "Orchard 1 km: RPE 10.0 cm (target 12 cm)"
    fig: {src: /assets/img/projects/keit-quadruped/se3lio.jpg, caption: "SE(3)-LIO (from the paper)."}
  - title: "Map-based localization"
    text: "Offline map building plus online localization in the map; two robots on one shared map in phase 2."
    result: "13.15 cm relative error on the 1 km course"
---
