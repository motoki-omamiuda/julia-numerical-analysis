include("src/commons/linear_algebra.jl")
using LinearAlgebra: solve_eigen

test_matrix::Matrix{Float64} = [
    1.0 2.0 3.0;
    4.0 5.0 6.0;
    7.0 8.0 9.0;
]
