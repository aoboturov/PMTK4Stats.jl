using StatsBase

"""
Normalize in logspace while avoiding numerical underflow
L is the log normalization constant

    logPost, L = normalizeLogspace(logprior .+ loglik)
    post = exp(logPost)

"""
function normalizeLogspace{T<:Real}(x::AbstractArray{T,1})
    L = logsumexp(x)
    y = broadcast(-, x, L)
    (y, L)
end

