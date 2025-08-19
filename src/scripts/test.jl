# local module
include("../commons/basic_stats.jl")
using .BasicStats: average, sd, var_cov_matrix

data::Array{Int64, 1} = [1, 2, 3, 4, 5]

av = average(data)
println(av)

std = sd(data)
println(std)
