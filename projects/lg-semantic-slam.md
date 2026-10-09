---
# Private sponsor, no paper: text and an outline diagram only.
kind: project
title: "Semantic SLAM for Spatial AI"
sponsor: LG Electronics
period: 2023
confidential: "Confidential project. Internal figures and numbers are not shown."
links: []
published: true

teaser:
  src: /assets/img/projects/teasers/lg-semantic-slam.jpg
  caption: "Hydra on real data: the metric-semantic mesh of a building floor and its 3D scene graph."

overview:
  points:
    - "Run a 3D scene graph SLAM (Hydra, MIT) on real sensors instead of simulation."
    - "Goal: a robot told \"go to the fridge\" instead of given coordinates."
    - "**Delivered** a semantic SLAM survey and a real-building evaluation with three improvement directions."
  modules:
    - {name: "Sensor inputs", note: "depth, semantics, odometry", mine: true}
    - {name: "Mesh and places"}
    - {name: "Objects and rooms"}
    - {name: "Loop closing", mine: true}

glance:
  - {label: Platform, value: "Handheld rig"}
  - {label: Sensors, value: "Depth camera, RGB camera, IMU"}
  - {label: Environment, value: "Two floors of a KAIST building"}

mypart:
  - title: "Real-sensor inputs"
    text: "Depth, semantics (HRNet trained on ADE20K, mapped to 20 classes), and odometry wired into Hydra."
  - title: "Loop closing with Quatro"
    text: "Replaced TEASER++ with our gravity-aligned Quatro; revisited floors stopped drifting apart in height."
---
