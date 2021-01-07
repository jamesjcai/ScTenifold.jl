function manialn(X::AbstractMatrix{T},Y::AbstractMatrix{T}) where T<:Real
    μ,dim=0.9,30
    n1,n2=size(X,1),size(Y,1)
    W₁,W₂=X.+1,Y.+1
    ℐ=Matrix(I,n1,n2)
    μ = μ*(sum(W₁)+sum(W₂))/(2*sum(ℐ))
    𝕎 = [W₁ μ*ℐ; μ*ℐ' W₂]
    L=diagm(vec(sum(abs.(𝕎),dims=1))).-𝕎
    # λ,V =KrylovKit.eigsolve(L,35,:SR,krylovdim=40)
    # V=hcat(V)
    λ,V = eigen(L)
    i=real(λ).>=1e-8
    V=real(V[:,i])
    dim=min(dim,size(V,2))
    V=V[:,1:dim]
    aln0=V[1:n1,:]
    aln1=V[n1+1:end,:]
    d = norm.((aln0.-aln1)[i,:] for i = 1:n1)
    # _,idx=findmax(dd)
    return d
end
