module MyLinearAlgebra


"""
ベクトルのノルムを計算する

# Parameters
- vector::Array{<:Number, 1}
    ノルムを計算するベクトル

# Returns
- Number:
    ベクトルのノルム
"""
function norm(vector::Array{<:Number, 1})
    return sqrt(sum(vector .^ 2))
end


"""
ベクトルの内積を計算する

# Parameters
- vector_1::Array{<:Number, 1}
- vector_2::Array{<:Number, 1}

# Returns
- Number:
    ベクトルの内積
"""
function dot(vector_1::Array{<:Number, 1}, vector_2::Array{<:Number, 1})
    if length(vector_1) != length(vector_2)
        throw(ArgumentError("Vectors must be of the same length"))
    end
    return sum(vector_1 .* vector_2)
end


"""
グラムシュミット直交化法を用いて、行列のQR分解を行う

# Parameter
- mat::Array{<:Number, 2}
    QR分解を行う行列

# Returns
- Q:: Array{<:Number, 2}
    直交行列
- R:: Array{<:Number, 2}
    上三角行列

"""
function qr(mat::Array{<:Number, 2})
    m, n = size(mat)
    Q = zeros(m, n)
    R = zeros(n, n)

    # Q の各列を計算
    Q[:, 1] = mat[:, 1] ./ norm(mat[:, 1])
    for column in 2:1:n
        u = zeros(m)
        for i in column:-1:1
            u .+= dot(Q[:, i], mat[:, column]) .* Q[:, i]
        end
        Q[:, column] = ( mat[:, column] .- u ) ./ norm(mat[:, column] .- u)
    end

    # R の各要素を計算
    for i in 1:1:m
        for j in i:1:n
            R[i, j] = dot(Q[:, i], mat[:, j])
        end
    end
    return Q, R
end


"""
QR分解を行い、行列の固有値、固有ベクトルを計算する

# Parameters
- mat::Array{<:Number, 2}
    QR分解を行う行列

# Returns
- eigenvalues::Array{<:Number, 1}
    行列の固有値
- eigenvectors::Array{<:Number, 2}
    行列の固有ベクトル
"""
function eigen(mat::Array{<:Number, 2})
    Q, R = qr(mat)
    eigenvalues = diagm(R)
    eigenvectors = Q
    return eigenvalues, eigenvectors
end

end