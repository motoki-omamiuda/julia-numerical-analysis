module LinearAlgebra

"""
QR分解を行い、行列の固有値、固有ベクトルを計算する

# Parameters
- aimed_matrix:: Matrix{T} where {T<:Number}
    QR分解を行う行列

# Returns
- eigenvalues:: Vector{T} where {T<:Number}
    行列の固有値
- eigenvectors:: Matrix{T} where {T<:Number}
    行列の固有ベクトル
"""
function solve_eigen(aimed_matrix:: Matrix{T}) where {T<:Number}:: Tuple{Vector{T}, Matrix{T}} where {T<:Number}

    return eigenvalues, eigenvectors
end

end