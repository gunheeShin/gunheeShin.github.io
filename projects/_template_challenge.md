---
# Challenge detail page. Copy to projects/<slug>.md, fill, set published: true and page: /projects/<slug> in _data/projects.yml.
# Two sections: Overview (the whole challenge) and My Part (only what I did), then Award. One line per point.
# Images: /assets/img/projects/<slug>/. fig = {src, caption}; src may be .jpg/.png/.gif/.mp4.
kind: challenge
title: ""                 # same as _data/projects.yml
result: ""                # Winner | 2nd Place
venue: ""                 # IROS 2026
period: ""                # 2026
links: []                 # [{name: Code, url: ...}, {name: Video, url: ...}, {name: "Paper: X", url: ...}]
published: false

teaser:
  src: ""
  caption: ""

overview:
  points:                 # three one-liners: task, what makes it hard, **result**
    - ""
    - ""
    - "****"
  fig:                    # system figure; mine = [left, top, width, height] in % marks my part
    src: ""
    caption: ""
    mine: [0, 0, 0, 0]
    mine_label: "My part"

glance:                   # Platform, Sensors, Environment, plus Metric or Venue
  - {label: Platform, value: ""}
  - {label: Sensors, value: ""}
  - {label: Environment, value: ""}
  - {label: Metric, value: ""}

mypart:                   # 2 to 3 items: title, one line, number, one figure
  - title: ""
    text: ""
    result: ""
    fig: {src: "", caption: ""}

table:                    # optional comparison; mine: true highlights our row
  cols: [Method, Metric]
  rows:
    - {cells: ["", ""]}
    - {cells: ["**Ours**", "****"], mine: true}
  note: ""

award:                    # certificate, then award photo
  - {src: "", caption: ""}
  - {src: "", caption: ""}
---
