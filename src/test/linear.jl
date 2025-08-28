include("../commons/linear_algebra.jl")
using .MyLinearAlgebra: norm, qr, eigen

test_matrix::Array{Float64, 2} = [
    1.0 2.0 3.0;
    4.0 5.0 6.0;
    7.0 8.0 9.0;
]

test_matrix::Array{Float64, 2} = [
    2.0 5.0;
    0.0 2.0;
]

println(qr(test_matrix))
# println(qr(test_matrix))