module Knk

export sctenifoldknk

import ScTenifold.Net

function sctenifoldknk(A::AbstractMatrix{T}, k::Integer) where T<:Real
    A1=copy(A)
    A1[k,:].=0
    return A1
    #d,_,_=Net.manialn(A,A1)
    #fc,p,adjp=Net.drgenes(d)
end

function sctenifoldknk(A::AbstractMatrix{T},genelist::Array{String,1},targetgene::String) where T<:Real
    # genelist=vec(readdlm("genelist.txt",String))
    k=findall(genelist.==targetgene)[1]
    # fc,p,adjp=sctenifoldknk(A, k)
    return sctenifoldknk(A, k)
end

function sctenifoldknk(A::AbstractMatrix{T},genelist::Array{String,1},k::Integer) where T<:Real
    # genelist=vec(readdlm("genelist.txt",String))
    # k=findall(genelist.==targetgene)[1]
    # fc,p,adjp=sctenifoldknk(A, k)
    return sctenifoldknk(A, k)
end

end

#=
function t1(genelist::Vector{String})
    genelist[1]
end
function t2(genelist::Array{String,1})
    genelist[1]
end

using DelimitedFiles
cd(dirname(@__FILE__))
X0=readdlm("X.txt",',',Int16)
X1=copy(X0)
genelist=vec(readdlm("genelist.txt",String))
idx=findall(genelist.=="Cftr")
X1[idx[1],:].=0

lbsz=sum(X0,dims=1)
X0=(X0./lbsz)*1e4
lbsz=sum(X1,dims=1)
X1=(X1./lbsz)*1e4


include("scTenifoldNet.jl")
using .scTenifoldNet
#X0=rand(100,1000);
#X1=rand(100,1000);
@show Threads.nthreads()
@time Z0=scTenifoldNet.pcnet(X0')
@time Z1=scTenifoldNet.pcnet(X1')

@time d,aln0,aln1=scTenifoldNet.manialn(Z0,Z1)
fc,p,adjp=scTenifoldNet.drgenes(d)

writedlm("qvalues.txt",[fc p adjp])

using StatsPlots, Distributions
x=rand(Chisq(1), length(fc)) 
qqplot(x, fc)
end
=#

