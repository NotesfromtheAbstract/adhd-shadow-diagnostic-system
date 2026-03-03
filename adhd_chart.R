# Copyright (c) 2026 Andrew R. Crocker. All rights reserved.
# Notes from the Abstract — https://andrewrcrocker.substack.com

library(ggplot2)

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

child_early <- data.frame(
  year = c(1997, 2000, 2003),
  prevalence = c(6.1, 6.8, 7.8),
  group = "Children (5–17)"
)

child_data <- data.frame(
  year = c(2003, 2007, 2011, 2016, 2019, 2022),
  prevalence = c(7.8, 9.5, 10.0, 10.2, 9.8, 10.5),
  group = "Children (5–17)"
)

adult_data <- data.frame(
  year = c(2003, 2007, 2012, 2019, 2023),
  prevalence = c(2.9, 3.8, 4.25, 5.4, 13.9),
  group = "Adults (18–64)"
)

df_main <- rbind(adult_data, child_data)

palette <- c("Adults (18–64)" = "#C0392B", "Children (5–17)" = "#2471A3")

p <- ggplot() +
  geom_vline(xintercept = c(1994, 2013, 2020),
             linetype = "dashed", color = "#999999", linewidth = 0.5) +
  geom_line(data = child_early,
            aes(x = year, y = prevalence, color = group),
            linetype = "dotted", linewidth = 1.1) +
  geom_point(data = child_early,
             aes(x = year, y = prevalence, color = group),
             size = 2.5, shape = 1) +
  geom_line(data = df_main,
            aes(x = year, y = prevalence, color = group),
            linewidth = 1.2) +
  geom_point(data = df_main,
             aes(x = year, y = prevalence, color = group),
             size = 3) +
  # Methodological note near early data
  annotate("text", x = 1997, y = 5.5,
           label = "Earlier data uses\ndifferent methodology",
           hjust = 0, vjust = 1, size = 2.6, color = "#888888",
           fontface = "italic", family = "Arial") +
  # DSM-IV annotation — top
  annotate("text", x = 1994.2, y = 14.2,
           label = "DSM-IV:\nADHD formalized\nin adults",
           hjust = 0, vjust = 1, size = 2.8, color = "#555555", family = "Arial") +
  # DSM-5 annotation — top
  annotate("text", x = 2013.2, y = 14.2,
           label = "DSM-5:\nOnset age raised;\nadult Dx broadened",
           hjust = 0, vjust = 1, size = 2.8, color = "#555555", family = "Arial") +
  # COVID annotation — moved BELOW the red line (around y = 6.5, just above children line)
  annotate("text", x = 2020.2, y = 6.8,
           label = "COVID telehealth\nwaiver: in-person\nrequirement dropped",
           hjust = 0, vjust = 0, size = 2.8, color = "#555555", family = "Arial") +
  scale_color_manual(values = palette, name = NULL) +
  scale_x_continuous(breaks = seq(1994, 2023, by = 3),
                     limits = c(1993, 2026)) +
  scale_y_continuous(labels = function(x) paste0(x, "%"),
                     limits = c(0, 15.5),
                     breaks = seq(0, 15, by = 3)) +
  labs(
    title = "The Adults Caught Up Fast",
    subtitle = "ADHD diagnosis prevalence by age group, United States, 1997–2023",
    x = NULL,
    y = "Prevalence (%)",
    caption = "Sources: NHIS (CDC); London & Landes 2021; National Wellbeing Survey 2023 (PMC12434681); MMWR Staley et al. 2024\nDotted segment (1997–2003) reflects earlier NHIS methodology with different age range; not directly comparable to post-2003 series."
  ) +
  theme_1950s() +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 11))

ggsave("/home/claude/adhd_chart.png", plot = p,
       width = 1456, height = 816, units = "px", dpi = 150, bg = "#FAF5E9")
cat("Done\n")
