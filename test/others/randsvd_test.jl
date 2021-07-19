using Distributions
using LinearAlgebra
using BenchmarkTools

# ------------------------------------------------------------------------------

function find_Q(A, l)
    #=
    Given an m × n matrix A, and an integer l, compute an m × l orthonormal
    matrix Q whose range approximates the range of A.
    =#
    m, n = size(A)
    Ω = rand(Normal(), n, l)
    Y = A * Ω
    Q, R = qr(Y)
    return Q
end

# ------------------------------------------------------------------------------

function randomized_SVD(A, k)
    #=
    Given an m × n matrix A, a target number k of singular vectors, and an
    exponent q (say q = 1 or q = 2), this procedure computes an approximate
    rank-2k factorization UΣVt, where U and V are orthonormal and Σ is
    nonnegative and diagonal.
    =#
    Q = find_Q(A, 2*k)
    B = Q' * A
    S, Σ, Vt = svd(B)
    U = Q * S
    return U, Σ, Vt
end

# ------------------------------------------------------------------------------

m = 2000
n = 20000
k = 10
# Construct low-rank matrix
A = rand(m, k) * rand(k, n)
println("Rank of A: ", rank(A))
println("Size of A: ", size(A))

println("Throwaway test:")
@time svd(A)
@time randomized_SVD(A, k)
println("Actual test:")
@benchmark svd(A)
@benchmark randomized_SVD(A, k)

println("Completed")

# https://stackoverflow.com/questions/53162206/why-does-my-randomized-svd-implementation-use-so-much-memory