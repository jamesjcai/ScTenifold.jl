function drgenes(d::AbstractVector{T}) where T<:Real
    d²=d.^2
    fc=d²./mean(d²)
    χ² = Chisq(1)
    pVals = ccdf.(χ², fc)
    pAdjusted = MultipleTesting.adjust(pVals, BenjaminiHochberg())
    return fc,pVals,pAdjusted
end