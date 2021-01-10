cd(dirname(@__FILE__))

# include("tensordecomp.jl")

include("ScTenifold.jl")

using .ScTenifold

using LinearAlgebra, Statistics, Distributions, Random

d=NegativeBinomial(20,0.98)
X=rand(d,100,2000)
lbszv=30

X=X[:,vec(sum(X,dims=1).>lbszv)]

@time Z1,A1=ScTenifold.tenrnet(X, donorm=true)


include("tensordecomp2.jl")

Z0a=ScTenifold.tensordecomp(A1)
Z2=tensordecomp2(A1)