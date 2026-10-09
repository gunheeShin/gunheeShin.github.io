---
kind: research
title: "CVGL-SLAM: Satellite Imagery as an Absolute Constraint for Drift-Bounded SLAM"
venue: In preparation
period: "2026"
links: []
published: true

abstract: >-
  Autonomous robots increasingly operate across large-scale outdoor environments, where reliable navigation depends on accurate self-localization. Odometry provides this estimate but drifts over distance. Existing approaches to bound this drift are limited: loop closure needs revisits, GNSS fails in canyons, and prior maps are costly to build. We introduce CVGL-SLAM, which uses cross-view geo-localization (CVGL), matching ground observations to globally available satellite imagery, as an absolute constraint on odometry. To use noisy cross-view matches, it keeps only confident ones, and anchors the unconstrained vertical axis with gravity. CVGL-SLAM bounds odometry drift at large scale and outperforms odometry-only and loop-closure baselines.

framework:
  src: /assets/img/projects/cvgl-slam/factor-graph.png
  max: 520
  caption: "Factor graph. LIVO odometry links consecutive poses. Confident CVGL matches tie each pose to the anchor T<sub>a</sub> (world to UTM); matches with confidence below 0.3 are rejected."

results:
  title: "Results on TartanDrive 2.0"
  table:
    caption: "**Table 1.** Absolute trajectory error (3D ATE RMSE, m) on TartanDrive 2.0, aligned on the first 100 m. Methods marked † use loop closure; ours does not. Best in **bold**."
    cols: [Method, "1253", "1311", "1342", "1809", "pt2"]
    sub: ["", "4.4 km", "2.2 km", "1.7 km", "1.6 km", "1.6 km"]
    rows:
      - {cells: ["LTA-OM†", "**1.91**", "324", "2.33", "1.44", "9.13"]}
      - {cells: ["GLIM†", "3.00", "17.3", "5.71", "fail", "2.99"]}
      - {cells: ["Voxel-SLAM†", "3.86", "8.92", "3.25", "2.78", "4.19"]}
      - {cells: ["SE(3)-LIO", "2.74", "14.3", "2.99", "1.40", "6.37"], rule: true}
      - {cells: ["Ours", "2.60", "**1.52**", "**1.59**", "**1.39**", "**1.86**"], rule: true}
  videos:
    default: "1311"
    caption: "TartanDrive 2.0 sequences on satellite imagery, 12x speed. Blue: CVGL-SLAM. Orange: SE(3)-LIO odometry. Dots: CVGL matches, colored by confidence."
    items:
      - {key: "1311", label: "1311 · 2.2 km", src: /assets/img/projects/cvgl-slam/seq-1311.mp4}
      - {key: "1342", label: "1342 · 1.7 km", src: /assets/img/projects/cvgl-slam/seq-1342.mp4}
      - {key: "1809", label: "1809 · 1.6 km", src: /assets/img/projects/cvgl-slam/seq-1809.mp4}
      - {key: "pt2", label: "pt2 · 1.6 km", src: /assets/img/projects/cvgl-slam/seq-pt2.mp4}
---
