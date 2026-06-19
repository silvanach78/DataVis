# Load required library
library(ggplot2)

# ------------------------------------------------------------
# Inputs and calculations
# ------------------------------------------------------------
A_counted <- 1873
B_counted <- 1787
total_counted <- A_counted + B_counted
total_votes <- total_counted / 0.8
remaining <- total_votes - total_counted
winning_threshold = (total_votes / 2)+1
# Current proportions
p_A <- A_counted / total_counted

# Point estimate for the final margin (current margin)
margin_est <- A_counted - B_counted

# Point estimates for final totals (based on the current margin)
A_est <- (total_votes + margin_est) / 2
B_est <- (total_votes - margin_est) / 2


#Calculating 95% CI
set.seed(123)
n_sims <- 100000
sim_A_remaining <- rbinom(n_sims, size = remaining, prob = p_A)
final_A <- A_counted + sim_A_remaining
final_B <- total_votes - final_A
margin_sim <- final_A - final_B

sim_lower <- quantile(margin_sim, 0.025)
sim_upper <- quantile(margin_sim, 0.975)
cat("Simulation-based 95% CI for final margin: [", round(sim_lower, 0), ",", round(sim_upper, 0), "]\n")


