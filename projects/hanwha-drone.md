---
# Private sponsor, no paper yet: text and an outline diagram only.
kind: project
title: "GNSS-Free Visual-Inertial Navigation for Drones"
sponsor: Hanwha Aerospace
period: 2026 – 2028
confidential: "Confidential project. Internal figures and numbers are not shown."
links: []
published: true

teaser:
  src: /assets/img/projects/teasers/hanwha-drone.jpg
  caption: "Flight paths of the public high-altitude sequences used for development. Imagery: Google Earth."

overview:
  points:
    - "Real-time drone navigation where GNSS is jammed."
    - "Absolute fixes from matching the downward camera to satellite imagery, fused with visual-inertial odometry."
    - "**First year:** methods on public data; then the sponsor's drone."
  modules:
    - {name: "Downward camera + IMU"}
    - {name: "VIO", mine: true}
    - {name: "Satellite-map matching"}
    - {name: "Fusion", note: "VIO + absolute fixes", mine: true}
    - {name: "Navigation output"}

glance:
  - {label: Platform, value: "Drone with an embedded GPU computer"}
  - {label: Sensors, value: "Downward camera, IMU"}
  - {label: Environment, value: "High altitude, GNSS jammed"}

mypart:
  - title: "Which VIO survives high altitude"
    text: "At several hundred meters many VIO systems lose scale. I picked the one that kept scale on every public sequence."
  - title: "Pose-graph fusion"
    text: "Each absolute fix becomes a factor on the VIO trajectory; the fused error is a small fraction of VIO alone."
---
