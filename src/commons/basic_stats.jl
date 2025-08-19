module BasicStats


"""
データに対する平均値を計算する

# Parameters
- data::Array{<:Number, 1}:
    1次元の数値データ

# Returns
- <:Number:
    数値データの平均値
"""
function average(data::Array{T, 1}) where {T<:Number}
    # データ数が足りない場合にはエラー
    n::Int64 = length(data)
    if n == 0
        throw(ArgumentError("Cannot compute average of empty data"))
    end

    # 平均値の計算
    s::Number = zero(eltype(data))
    for x in data
        s += x
    end
    return s / n
end


"""
データに対する標準偏差を計算する

# Parameters
- data::Array{T, 1} where {T<:Number}:
    1行の数値データ

# Returns
- <:Number:
    数値データの標準偏差
"""
function sd(data::Array{T, 1}) where {T<:Number}
    # データ数が足りない場合にはエラー
    n::Int64 = length(data)
    if n <= 1
        throw(ArgumentError("At least two data points are required to compute standard deviation"))
    end

    # 標準偏差の計算
    u::Number = average(data)
    ssd::Number = zero(eltype(data))
    for x in data
        ssd += (x - u)^2
    end
    return sqrt(ssd / (n - 1))
end


"""
データ行列に対する分散共分散行列を計算する

# Arguments
- data::Array{T, N} where {T<:Number, N}:
    行がラベル、列がデータベクトルとなっている標準化されたデータ行列

# Returns
- Array{T, N} where {T<:Number, N}:
    分散共分散行列

# Examples
```
data::Array{Float64, 2} = [
    10.1, 20.1, 30.3;
    55.2, 23.1, 44.4
]
var_cov_matrix(data=data)
```
"""
function var_cov_matrix(data::Array{T, N}) where {T<:Number, N}
    # データの次元数
    d = size(data, 2)

    # 平均を引く
    mean_data = mean(data, dims=1)
    centered_data = data .- mean_data

    # 共分散行列の計算
    cov_matrix = (centered_data' * centered_data) / (size(data, 1) - 1)

    return cov_matrix
end

end