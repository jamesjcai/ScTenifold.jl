module ScTenifold

using Statistics, LinearAlgebra, Distributions, Random
using MultipleTesting, Random, SparseArrays, TSVD, TensorToolbox
# import KrylovKit

export sctenifoldnet, sctenifoldknk, sctenifoldxct, tenrnet, manialn, drgenes

const NCOMP1,NCOMP2=3,5
const NLAYERS,NCELLS=10,500

include("support.jl")
include("pcnet.jl")                   # include the contents of other files in the module
include("tenrnet.jl")             
include("tensordecomp.jl")
include("manialn.jl")             
include("drgenes.jl")

function sctenifoldnet(X::AbstractMatrix{T}, Y::AbstractMatrix{T}; donorm::Bool=false) where T<:Real
    Z0=tenrnet(X,donorm=donorm)
    Z1=tenrnet(Y,donorm=donorm)
    Z0=0.5*(Z0+Z0')
    Z1=0.5*(Z1+Z1')
    d=manialn(Z0,Z1)
    fc,p,adjp=drgenes(d)
    return d,fc,p,adjp
end

end # module