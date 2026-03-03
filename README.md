# Notes from the Abstract — You Have ADHD. YOU Have ADHD! Everyone Has ADHD!
### How a shadow diagnostic system got into the official record and why nobody cares.

Published March 3, 2026 in [Notes from the Abstract](https://andrewrcrocker.substack.com/p/you-have-adhd-you-have-adhd-everyone)

---

## Contents

| File | Description |
|------|-------------|
| `article.md` | Full published article text in Markdown |
| `adhd_chart.jpeg` | Final chart as published |
| `adhd_chart.R` | R code to reproduce the chart |

---

## The Chart

**The Adults Caught Up Fast** plots ADHD diagnosis prevalence by age group (children 5–17 and adults 18–64) from 1997 to 2023, with annotations marking three structural threshold changes: DSM-IV (1994), DSM-5 (2013), and the COVID telehealth waiver (2020).

### Data Sources

- **NHIS (CDC)** — National Health Interview Survey, child and adult prevalence estimates
- **London & Landes 2021** — Adult ADHD prevalence trend data
- **National Wellbeing Survey 2023** — PMC12434681; working-age adult self-reported diagnosis (13.9%)
- **MMWR Staley et al. 2024** — Current ADHD diagnosis and telehealth utilization in U.S. adults
- **NCHS Data Brief No. 499, March 2024**

> **Methodological note:** The dotted segment for children (1997–2003) reflects an earlier NHIS methodology using a different age range and is not directly comparable to the post-2003 series.

### Reproducing the Chart

Define `theme_1950s()` before running `adhd_chart.R`:

```r
theme_1950s <- function() {
  theme_minimal(base_family = "Arial", base_size = 14) +
    theme(
      plot.background = element_rect(fill = "#FAF5E9", color = NA),
      panel.background = element_rect(fill = "#FAF5E9", color = NA),
      panel.grid.major = element_line(color = "#E6DECA", linewidth = 0.6),
      panel.grid.minor = element_blank(),
      axis.title = element_text(face = "bold", color = "#3A3A3A"),
      axis.text = element_text(color = "#4A4A4A"),
      plot.title = element_text(face = "bold", size = 20, color = "#3A3A3A"),
      plot.subtitle = element_text(size = 13, color = "#5A5A5A"),
      plot.margin = margin(15, 15, 15, 15),
      legend.position = "none"
    )
}
```

Then run:

```r
source("adhd_chart.R")
```

Output renders at 1456×816px (16:9), optimized for Substack's maximum post width.

---

## About Notes from the Abstract

*Notes from the Abstract* covers the infrastructure of health data — how diseases get counted, coded, and reported, and what happens when that infrastructure fails. Written by a Health Information Management professional with certifications in professional and emergency department coding.

[Subscribe on Substack](https://andrewrcrocker.substack.com)
