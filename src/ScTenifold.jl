module ScTenifold
export Net, Knk, sctenifoldnet, sctenifoldknk, sctenifoldxct

include("sctenifoldnet.jl")
include("sctenifoldknk.jl")
include("sctenifoldxct.jl")

using .Net
using .Knk
using .Xct

end # module
