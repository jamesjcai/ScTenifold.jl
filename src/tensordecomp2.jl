using TensorDecompositions

u = randn(10); v = randn(20); w = randn(30)
T = cat(3, map(x -> x * u * v', w)...) + 0.2 * randn(10, 20, 30)
F = candecomp(T, 1, (randn(10, 1), randn(20, 1), randn(30, 1)), compute_error=true, method=:ALS);


using ScTenifold

using LinearAlgebra, Statistics, Distributions, Random

d=NegativeBinomial(20,0.98)
X=rand(d,100,2000)
lbszv=30

Y=copy(X)
Y[10,:]=Y[50,:]
Y[2,:]=Y[11,:]
Y[3,:]=Y[5,:]

X=X[:,vec(sum(X,dims=1).>lbszv)]
Y=Y[:,vec(sum(Y,dims=1).>lbszv)]


@time Z0=ScTenifold.       tenrnet(X, donorm=true)
@time Z1=ScTenifold.tenrnet(Y, donorm=true)
Z0=0.5*(Z0+Z0')
Z1=0.5*(Z1+Z1')
