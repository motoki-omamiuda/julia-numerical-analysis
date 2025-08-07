module BasicStats

"""
    average(data::AbstractVector{<:Number})

Calculate the average (mean) of the numeric vector `data`.
"""
function average(data::AbstractVector{<:Number})
    n = length(data)
    if n == 0
        throw(ArgumentError("Cannot compute average of empty data"))
    end
    s = zero(eltype(data))
    for x in data
        s += x
    end
    return s / n
end

"""
    sd(data::AbstractVector{<:Number})

Calculate the standard deviation of the numeric vector `data`.
"""
function sd(data::AbstractVector{<:Number})
    n = length(data)
    if n < 2
        throw(ArgumentError("At least two data points are required to compute standard deviation"))
    end
    u = average(data)
    ssd = zero(eltype(data))
    for x in data
        ssd += (x - u)^2
    end
    return sqrt(ssd / (n - 1))
end

end