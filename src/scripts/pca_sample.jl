using Plots: savefig, scatter, plot!
using Random: rand, seed!
using Distributions: Normal

# local module
include("../commons/statistics.jl")
using .MyStatistics: average, sd, var_cov_matrix

seed!(123)

n = 30  # 点の数

σx = 3.0
σy = 4.0

x_list = 80 .+ rand(Normal(0, σx), n)
y_list = x_list .- 20 .+ rand(Normal(0, σy), n)

x_list = reshape(Int.(floor.(x_list)), 30)
y_list = reshape(Int.(floor.(y_list)), 30)
data = vcat(x_list', y_list')

# 標準化
x_list = (x_list .- average(x_list)) ./ sd(x_list)
y_list = (y_list .- average(y_list)) ./ sd(y_list)
data = vcat(x_list', y_list')
print(data)

# 共分散行列の計算
cov_matrix = var_cov_matrix(data)
println(cov_matrix)

# 固有値問題を解く
breakpoint()

p = scatter(
    data[:, 1], data[:, 2];
    legend = false,
    markersize = 3,
    markerstrokewidth = 0,
    color = :red,
    dpi = 300,
    # xlims = (-1, 1),
    # ylims = (-3, 3),
)
plot!(
    p,
    [1, 1], [-2, 2],
    color=:black,
    lw=1,
    # linestyle=:dash
)
savefig(p, "./images/pca.png")