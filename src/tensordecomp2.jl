using TensorDecompositions

function tensordecomp2(Λ::AbstractArray{T,3}, p::Int=5;
    scaleout::Bool=true) where T
    Λ=convert(Array{Float64}, Λ)
    size(Λ)
    𝒯=TensorDecompositions.candecomp(Λ, p,  (randn(size(Λ,1), k), randn(size(Λ,2), k), randn(size(Λ,3), k)), compute_error=true, method=:ALS);
    # 𝒯=TensorToolbox.cp_als(Λ,p)
    𝕏=TensorDecompositions.compose(𝒯)
    A=mean(𝕏[:,:,i] for i=1:size(𝕏,3))
    if scaleout
    A ./=maximum(abs.(A))
    end
    return A
end



#=
u = randn(10); v = randn(20); w = randn(30)
T = cat(map(x -> x * u * v', w)..., dims=3) + 0.2 * randn(10, 20, 30)
k=2
F = candecomp(T, k, (randn(10, k), randn(20, k), randn(30, k)), compute_error=true, method=:ALS);


# https://juliapackages.com/p/ntfk

import NTFk
import TensorDecompositions

csize = (2, 3, 4)
tsize = (5, 10, 15)
tucker_orig = NTFk.rand_tucker(csize, tsize; factors_nonneg=true, core_nonneg=true)

T_orig = TensorDecompositions.compose(tucker_orig)
T_orig .*= 1000

sizes = [csize, (1,3,4), (3,3,4), (2,2,4), (2,4,4), (2,3,3), (2,3,5)]
tucker_estimated, csize_estimated = NTFk.analysis(T_orig, sizes, 3; eigmethod=[false,false,false], progressbar=false, tol=1e-16, max_iter=100000, lambda=0.);
=#
