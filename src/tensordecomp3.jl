import CanDecomp

A = rand(2, 3)
B = rand(5, 3)
C = rand(10, 3)
T_orig = CanDecomp.totensor(A, B, C)

Af = rand(size(A)...);
Bf = rand(size(B)...);
Cf = rand(size(C)...);

import StaticArrays
CanDecomp.candecomp!(StaticArrays.SVector(Af, Bf, Cf), T_orig, Val{:nnoptim}; regularization=1e-3, print_level=0, max_cd_iters=1000)

T_est = CanDecomp.totensor(Af, Bf, Cf);

import NTFk
import LinearAlgebra

@info("Norm $(LinearAlgebra.norm(T_est .- T_orig))")


import Cairo, Fontconfig


NTFk.plot2matrices(A, Af; progressbar=nothing)
NTFk.plot2matrices(B, Bf; progressbar=nothing)
NTFk.plot2matrices(C, Cf; progressbar=nothing)
NTFk.plotlefttensor(T_orig, T_est; progressbar=nothing)
