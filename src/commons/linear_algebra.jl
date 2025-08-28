module MyLinearAlgebra


"""
ベクトルのノルムを計算する

# Parameters
- vector::Array{<:Number, 1}
    ノルムを計算するベクトル
"""
function norm(vector::Array{<:Number, 1})
    return sqrt(sum(vector .^ 2))
end


"""
グラムシュミット直交化法を用いて、行列のQR分解を行う

# Parameter
- matrix::Array{<:Number, 2}
    QR分解を行う行列

# Returns
- Q:: Array{<:Number, 2}
    直交行列
- R:: Array{<:Number, 2}
    上三角行列

"""
function qr(matrix::Array{<:Number, 2})
    m, n = size(matrix)
    Q = zeros(m, n)
    R = zeros(n, n)

    # Q の各列を計算
    basis = zeros(m, n)
    before_Q = zeros(m, n) # 正規化前のQ
    before_Q[:, 1] = matrix[:, 1]
    basis[:, 1] = before_Q[:, 1] ./ dot(before_Q[:, 1], before_Q[:, 1])
    for column in 2:1:n
        temp_vec = zeros(m)
        for i in 1:1:column-1
            temp_vec .+= dot(before_Q[:, i], matrix[:, column]) .* before_Q[:, i] ./ dot(before_Q[:, i], before_Q[:, i])
        end
        before_Q[:, column] = matrix[:, column] .- temp_vec
    end

    # Q を正規化
    Q = zeros(m, n)
    for i in 1:1:n
        Q[:, i] = before_Q[:, i] ./ norm(before_Q[:, i])
    end
    return Q, R
end


"""
QR分解を行い、行列の固有値、固有ベクトルを計算する

# Parameters
- matrix::Array{<:Number, 2}
    QR分解を行う行列

# Returns
- eigenvalues::Array{<:Number, 1}
    行列の固有値
- eigenvectors::Array{<:Number, 2}
    行列の固有ベクトル
"""
function eigen(matrix::Array{<:Number, 2})
    Q, R = qr(matrix)
    eigenvalues = diagm(R)
    eigenvectors = Q
    return eigenvalues, eigenvectors
end

end