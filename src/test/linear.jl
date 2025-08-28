include("../commons/linear_algebra.jl")
using .MyLinearAlgebra: norm, qr, eigen

test_matrix::Array{Float64, 2} = [
    1.0 2.0 3.0;
    4.0 5.0 6.0;
    7.0 8.0 9.0;
]

println(norm(test_matrix[:, 1]))
# println(qr(test_matrix))