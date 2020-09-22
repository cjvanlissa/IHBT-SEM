library(tidySEM)
library(ggplot2)
lo <- get_layout("iamsup", "",        "",        "",        "", 
                     "",       "camsup1", "camsup2", "camsup3", "camsup4",
                     "ide",    "cde1",    "cde2",    "cde3",    "cde4",
                     "",       "cafsup1", "cafsup2", "cafsup3", "cafsup4",
                     "iafsup", "",        "",        "",        "", rows = 5)
nod <- matrix(c(
  "iamsup", "Intercept\nmaternal\nsupport", "oval",
  "iafsup", "Intercept\npaternal\nsupport", "oval",
  "ide", "Intercept\nemotion\nregulation", "oval",
  "camsup1", "Maternal\nsupport", "oval",
  "camsup2", "Maternal\nsupport", "oval",
  "camsup3", "Maternal\nsupport", "oval",
  "camsup4", "Maternal\nsupport", "oval",
  "cafsup1", "Paternal\nsupport", "oval",
  "cafsup2", "Paternal\nsupport", "oval",
  "cafsup3", "Paternal\nsupport", "oval",
  "cafsup4", "Paternal\nsupport", "oval",
  "cde1", "Emotion\nregulation", "oval",
  "cde2", "Emotion\nregulation", "oval",
  "cde3", "Emotion\nregulation", "oval",
  "cde4", "Emotion\nregulation", "oval"
), ncol = 3, byrow = T)
nod <- as.data.frame(nod)
names(nod) <- c("name", "label", "shape")
edg <- matrix(c("iamsup", "ide", "", "none", 60, "gray", 2,
                "iamsup", "iafsup", "", "none", 60, "gray", 2,
                "ide", "iafsup", "", "none", 60,  "gray", 2,
                "camsup1", "cafsup1", "", "none", 60, "gray", 2,
                "camsup1", "cde1", "", "none", 60,  "gray", 2,
                "cde1", "cafsup1", "", "none", 60, "gray", 2,
                "camsup1", "camsup2", "", "last", NA, "gray", 1,
                "camsup2", "camsup3", "", "last", NA, "gray", 1,
                "camsup3", "camsup4", "", "last", NA, "gray", 1,
                "cafsup1", "cafsup2", "", "last", NA, "gray", 1,
                "cafsup2", "cafsup3", "", "last", NA, "gray", 1,
                "cafsup3", "cafsup4", "", "last", NA, "gray", 1,
                "cde1", "cde2", "", "last", NA, "gray", 1,
                "cde2", "cde3", "", "last", NA, "gray", 1,
                "cde3", "cde4", "", "last", NA, "gray", 1,
                "cde1", "camsup2", "", "last", NA, "gray", 1,
                "cde2", "camsup3", "", "last", NA, "gray", 1,
                "cde3", "camsup4", "", "last", NA, "gray", 1,
                "cde1", "cafsup2", "", "last", NA, "gray", 1,
                "cde2", "cafsup3", "", "last", NA, "gray", 1,
                "cde3", "cafsup4", "", "last", NA, "gray", 1,
                "camsup1", "cafsup2", "", "last", NA, "gray", 1,
                "camsup2", "cafsup3", "", "last", NA, "gray", 1,
                "camsup3", "cafsup4", "", "last", NA, "gray", 1,
                "cafsup1", "camsup2", "", "last", NA, "gray", 1,
                "cafsup2", "camsup3", "", "last", NA, "gray", 1,
                "cafsup3", "camsup4", "", "last", NA, "gray", 1,
                "camsup1", "cde2", "mb/mg", "last", NA, "black", 1,
                "camsup2", "cde3", "mb/mg", "last", NA, "black", 1,
                "camsup3", "cde4", "mb/mg", "last", NA, "black", 1,
                "cafsup1", "cde2", "fb/fg", "last", NA, "black", 1,
                "cafsup2", "cde3", "fb/fg", "last", NA, "black", 1,
                "cafsup3", "cde4", "fb/fg", "last", NA, "black", 1
                ), byrow = TRUE, ncol = 7)
edg <- as.data.frame(edg)
names(edg) <- c("from", "to", "label", "arrow", "curvature", "colour", "linetype")
edg$curvature <- as.numeric(edg$curvature)
edg$linetype <- as.numeric(edg$linetype)
p <- graph_sem(edges = edg, layout = lo, nodes = nod, angle = 1, ellipses_height = 1.5, text_size = 3) + 
  geom_vline(xintercept = 2.7, linetype =3, colour = "gray") + 
  geom_label(aes(x = c(1, 4), y = c(12, 12), label = c("Between-family level", "Within-family level"))) + scale_x_continuous(limits = c(0, 10.5))
nodes
ggsave("figure1.png", p)