# local module
include("../commons/basic_stats.jl")
using .BasicStats: average, sd

data_list::Array{Int64, 1} = [1, 2, 3, 4, 5]
av = average(data_list)