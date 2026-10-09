---
kind: challenge
title: "COMFORT Localization Challenge"
result: Winner
venue: IROS 2026
period: "2026"
links:
  - {name: Code, url: "https://github.com/url-kaist/se3-livom-comfort"}
  - {name: Video, url: "https://youtu.be/6d9qwjqTFwc"}
  - {name: "Paper: SE(3)-LIO", url: "https://arxiv.org/abs/2603.16118"}
published: true

teaser:
  src: /assets/img/projects/comfort-2026/teaser.jpg
  caption: "SE(3)-LIVOM on four of the six test missions. One configuration, real time on 8 CPU cores."

overview:
  points:
    - "Real-time trajectory of an ANYmal quadruped in ETH's GrandTour field data, scored by ATE against a total station."
    - "Six test missions, from a collapsed building to a snowfield; no post-processing."
    - "**Winner.** Mean ATE 1.40 cm with one configuration."
  fig:
    src: /assets/img/projects/comfort-2026/framework.jpg
    caption: "SE(3)-LIVOM: frontend (left) and online backend (right)."

glance:
  - {label: Platform, value: "ANYmal quadruped"}
  - {label: Sensors, value: "Two LiDARs, cameras, IMU"}
  - {label: Environment, value: "Collapsed and smoke-filled buildings, construction site, snowfield"}
  - {label: Metric, value: "Mean ATE over six missions"}

mypart:
  - title: "Lead, the whole entry"
    text: "I built SE(3)-LIVOM, made every submission, and released the code and video."
  - title: "Two LiDARs and a camera in one filter"
    text: "Both LiDARs merged into one time-ordered scan, plus a photometric camera update."
    result: "Corridor position loss: 19 s → ≤3 s"
    fig: {src: /assets/img/projects/comfort-2026/corridor.mp4, caption: "Collapsed building (ARC-2), 5x speed."}
  - title: "Adaptive downsampling"
    text: "The voxel size adapts every scan to keep matched points near a target."
    result: "Best-fixed-size accuracy at ~35 ms per scan"
    fig: {src: /assets/img/projects/comfort-2026/adaptive.jpg, caption: "Time per scan (boxes) and ATE (markers), six validation missions."}
  - title: "Online backend"
    text: "Plane bundle adjustment on submaps, joined in an iSAM2 pose graph while the robot walks."
    result: "Test ATE 1.66 → 1.40 cm"
    fig: {src: /assets/img/projects/comfort-2026/backend.jpg, caption: "The backend (dashed box)."}

table:
  cols: [Method, Test mean ATE]
  rows:
    - {cells: ["FAST-LIVO2 (baseline we ran)", "2.16 cm"]}
    - {cells: ["Ours, frontend only", "1.66 cm"]}
    - {cells: ["**Ours, full system**", "**1.40 cm**"], mine: true}
  note: "Mean ATE RMSE over the six test missions."

award:
  - {src: /assets/img/projects/comfort-2026/certificate.jpg, caption: "Winner certificate, IROS 2026 workshop Data in Field Robotics, Pittsburgh."}
---
