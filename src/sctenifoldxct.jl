module Xct

export sctenifoldxct

const NCOMP1,NCOMP2=3,5
const NLAYERS,NCELLS=10,500

using Statistics, LinearAlgebra, Distributions, Random
using MultipleTesting, Random, SparseArrays, TSVD, TensorToolbox
# import KrylovKit

include("support.jl")

function sctenifoldxct(X::AbstractMatrix{T}, Y::AbstractMatrix{T}; donorm::Bool=false) where T<:Real

end

end