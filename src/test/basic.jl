# local module
include("../commons/statistics.jl")
using .Statistics: average, sd, var_cov_matrix

array::Array{Int64, 1} = [1, 2, 3, 4, 5]

av = average(array)
println(av)

std = sd(array)
println(std)

data::Array{Float64, 2} = [
    -1.1 -0.4 0.4 1.1 1.3;
    -2.0 -2.1 0.5 1.3 2.4
]
println(var_cov_matrix(data))
