using Plots: savefig, scatter
using Random: rand, seed!
using Distributions: Normal

# local module
include("../commons/statistics.jl")
using .MyStatistics: average, sd

seed!(123)

n = 500  # 点の数

σx = 2.0
σy = 4.0

x_list = rand(Normal(0, σx), n)
y_list = 2 .* x_list .+ rand(Normal(0, σy), n)

# 標準化を行う
x_list = (x_list .- average(x_list)) ./ sd(x_list)
y_list = (y_list .- average(y_list)) ./ sd(y_list)

p = scatter(
    x_list, y_list;
    legend = false,
    markersize = 3,
    title = "after norm",
    markerstrokewidth = 0,
    color = :red,
    # xlims = (-1, 1),
    # ylims = (-3, 3),
)
savefig(p, "./images/plot_std.png")