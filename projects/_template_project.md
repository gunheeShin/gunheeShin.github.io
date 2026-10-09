---
# Funded project detail page. Copy to projects/<slug>.md, fill, set published: true and page: /projects/<slug> in _data/projects.yml.
# Two sections: Overview (the whole project) and My Part (only what I did). One line per point.
# Private sponsors: figures and numbers only from published papers; set confidential.
# Images: /assets/img/projects/<slug>/. fig = {src, caption}; src may be .jpg/.png/.gif/.mp4.
kind: project
title: ""                 # same as _data/projects.yml
sponsor: ""               # Hanwha Aerospace
period: ""                # 2023 – 2026
confidential: ""          # private sponsors only
links: []                 # paper and code links only
published: false

teaser:
  src: /assets/img/projects/teasers/<slug>.jpg
  caption: ""

overview:
  points:                 # three one-liners: goal, setting, **result**
    - ""
    - ""
    - "****"
  modules:                # stack outline; mine: true highlights my blocks (or use fig with mine box)
    - {name: "", note: ""}
    - {name: "", mine: true}

glance:                   # Platform, Sensors, Environment
  - {label: Platform, value: ""}
  - {label: Sensors, value: ""}
  - {label: Environment, value: ""}

mypart:                   # 2 to 4 items: title, one line, number, optional figure
  - title: ""
    text: ""
    result: ""
    fig: {src: "", caption: ""}
---
