library(slendr)
init_env()

chimp <- population("CHIMP", time = 7e6, N = 5000)
afr <- population("AFR", parent = chimp, time = 6e6, N = 15000)
eur <- population("EUR", parent = afr, time = 70e3, N = 3000)
nea <- population("NEA", parent = afr, time = 600e3, N = 1000, remove = 40e3)

gf <- gene_flow(from = nea, to = eur, rate = 0.03, start = 50000, end = 40000)

model <- compile_model(
  populations = list(chimp, nea, afr, eur),
  gene_flow = gf,
  generation_time = 30
)

# verify visually
plot_model(model, sizes = FALSE, proportions = TRUE)
plot_model(model, sizes = FALSE, log = TRUE, proportions = TRUE)


# notes -------------------------------------------------------------------

# sanity checks

# population needs to exist within gene-flow time window
gf <- gene_flow(from = nea, to = eur, rate = 0.03, start = 6.9e6, end = 5.9e6)

model <- compile_model(
  populations = list(chimp, nea, afr, eur),
  gene_flow = gf,
  generation_time = 30
)

# verify visually
plot_model(model, sizes = FALSE, proportions = TRUE)
