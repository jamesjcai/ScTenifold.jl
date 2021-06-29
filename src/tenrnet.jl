function tenrnet(X::AbstractMatrix{T}; donorm::Bool=true) where T<:Real
    ℊ,𝒸=size(X)
    if donorm
        lbsz=sum(X,dims=1)
        # X=(X./lbsz)*median(lbsz)
        X=(X./lbsz)*1e4
        X=log.(X.+1)
    end
    A=zeros(Float16, ℊ, ℊ, NLAYERS)
    for k=1:NLAYERS
        println("network ... $k")
        𝕩=X[:,randperm(𝒸)][:,1:NCELLS]    # jackknife (m-out-of-n)
        # 𝕩=X[:,rand(1:𝒸,NCELLS)];            # bootstrapping (m-out-of-n)
        𝕩ᵀ=transpose(𝕩)
        a=pcnet(𝕩ᵀ,NCOMP1)
        a[abs.(a).<quantile(vec(abs.(a)),0.95)].=0.0
        @inbounds A[:,:,k]=sparse(a)
    end
    Z=tensordecomp(A,NCOMP2)
    return Z,A
end