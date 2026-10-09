---
kind: challenge
title: "HILTI SLAM Challenge (LiDAR Single-Session)"
result: Winner
venue: ICRA 2023
period: "2023"
links: []
published: true

teaser:
  src: /assets/img/projects/hilti-2023/teaser.jpg
  caption: "The handheld LiDAR rig on a construction site (left, photo: HILTI) and our map of a site-2 building under construction (right)."

overview:
  points:
    - "LiDAR SLAM on construction sites, from a handheld rig and a tracked robot."
    - "The operator walks right up to walls, so the LiDAR sees only a small patch and odometry diverges."
    - "**1st of 63 teams** in the LiDAR session (3,000 CHF), a year after 4th overall in 2022."
  fig:
    src: /assets/img/projects/hilti-2023/multisession.jpg
    caption: "Multi-session maps: site 2 before and after alignment (left), four site-3 sessions (right)."

glance:
  - {label: Platform, value: "Handheld rig and tracked robot"}
  - {label: Sensors, value: "Hesai 32 (handheld), Robosense (robot)"}
  - {label: Environment, value: "Construction sites, one underground"}
  - {label: Metric, value: "Score by position error, max 1600"}

mypart:
  - title: "AdaLIO on every sequence"
    text: "Our adaptive odometry changes its parameters when a scan is degenerate. I tuned and ran it per sequence."
    fig: {src: /assets/img/projects/hilti-2023/adalio.jpg, caption: "Faster-LIO diverges in a cramped space; AdaLIO does not."}
  - title: "Multi-session alignment"
    text: "Quatro for a global guess, G-ICP to refine, then a multi-session pose graph."

award:
  - {src: /assets/img/projects/hilti-2023/certificate.jpg, caption: "LiDAR single-session first-place certificate, HILTI SLAM Challenge 2023."}
  - {src: /assets/img/projects/hilti-2023/award.jpg, caption: "The team at KAIST EE with the certificates."}
---
