import TensorDecompositions
import NTFk


csize = (2, 3, 4)
tsize = (5, 10, 15)
tucker_orig = NTFk.rand_tucker(csize, tsize; factors_nonneg=true, core_nonneg=true)

T_orig = TensorDecompositions.compose(tucker_orig)
T_orig .*= 1000

sizes = [csize, (1,3,4), (3,3,4), (2,2,4), (2,4,4), (2,3,3), (2,3,5)]
tucker_estimated, csize_estimated = NTFk.analysis(T_orig, sizes, 3; eigmethod=[false,false,false], progressbar=false, tol=1e-16, max_iter=100000, lambda=0.);


