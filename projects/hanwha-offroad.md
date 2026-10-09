---
# Private sponsor: only paper material. Numbers come from the SE(3)-LIO paper (ICRA 2026).
kind: project
title: "Off-Road Autonomous Driving in Unstructured Terrain"
sponsor: Hanwha Aerospace
period: 2023 – 2026
confidential: "Confidential project. Figures and numbers shown are from the published paper."
links:
  - {name: "Paper: SE(3)-LIO (ICRA 2026)", url: "https://arxiv.org/abs/2603.16118"}
  - {name: "Code", url: "https://github.com/url-kaist/se3-lio"}
published: true

teaser:
  src: /assets/img/projects/teasers/hanwha-offroad.jpg
  caption: "The project vehicle on an off-road test track."

overview:
  points:
    - "An unmanned ground vehicle drives through unmapped off-road terrain while GPS is jammed."
    - "Absolute position comes from matching satellite images; everything else from onboard sensors."
    - "**All quantitative targets met**; closed in 2026 with an integrated field demo."
  modules:
    - {name: "Sensors", note: "LiDAR, camera, IMU"}
    - {name: "Localization", note: "SLAM + satellite-image fixes", mine: true}
    - {name: "Terrain and obstacles"}
    - {name: "Path planning"}
    - {name: "Vehicle"}

glance:
  - {label: Platform, value: "Tracked ground vehicle"}
  - {label: Sensors, value: "128-channel LiDAR, cameras, IMU"}
  - {label: Environment, value: "Forest, open fields, steep dirt tracks"}

mypart:
  - title: "SE(3)-LIO: odometry for rough ground"
    text: "IMU propagation on SE(3) and uncertainty-aware motion compensation, so jerky motion no longer breaks the odometry."
    result: "Paper: ATE 5.10 / 15.86 / 2.29 m vs. 14.07 / 17.08 / 2.50 m for FAST-LIO2"
    fig: {src: /assets/img/projects/hanwha-offroad/se3lio.jpg, caption: "SE(3)-LIO (from the paper)."}
  - title: "Fusion with satellite-image fixes"
    text: "A per-fix confidence and a weighted solve, so fixes that jump by tens of meters carry little weight."
---
