function pcnet(X::AbstractMatrix{T}, p::Int=3;
              scalein::Bool=true, scaleout::Bool=false,
              symmout::Bool=false) where T<:Real
    if scalein
        σ=std(X,dims=1)
        σ[σ.==0].=1.0
        X=(X.-mean(X,dims=1))./σ
    end
    ℊ=size(X,2)
    A=1.0 .-Matrix(I,ℊ,ℊ)
    Threads.@threads for k in 1:ℊ
        y=X[:,k]
        𝒳=X[:,1:end.≠k]
        ϕ=TSVD.tsvd(𝒳,p)[3]
        s=𝒳*ϕ
        s ./= (vecnorm(s).^2)'
        b=sum(y.*s,dims=1)
        𝒷=ϕ*b'
        @inbounds A[k,A[k,:].==1.0]=𝒷
    end
    if symmout
        A=0.5*(A+A')
    end
    if scaleout
        A=A./maximum(abs.(A))
    end
    return convert(Matrix{Float16},A)
end 
