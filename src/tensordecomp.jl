function tensordecomp(Λ::AbstractArray{T,3}, p::Int=5;
    scaleout::Bool=true) where T
𝒯=TensorToolbox.cp_als(Λ,p)
𝕏=TensorToolbox.full(𝒯)
A=mean(𝕏[:,:,i] for i=1:size(𝕏,3))
if scaleout
A ./=maximum(abs.(A))
end
return A
end
