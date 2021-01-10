module ScTenifold
export Net, Knk

include("sctenifoldnet.jl")
include("sctenifoldknk.jl")

using .Net
using .Knk

end # module
