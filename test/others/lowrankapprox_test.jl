import Pkg
Pkg.add("LowRankApprox")
using LowRankApprox

m=128
n=64
M = matrixlib(:fourier, rand(m), rand(n))
A=real(M)
F = psvdfact(A)
@time U, S, V = psvd(A)

using LinearAlgebra
@time U1, S1, V1 = svd(A)