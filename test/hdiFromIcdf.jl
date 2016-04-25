using Base.Test
using StatsFuns
using PMTK4Stats

a = 3
b = 9
icdf(p::Real) = betainvcdf(a, b, p)
lb, ub = hdiFromIcdf(icdf)

@test_approx_eq_eps .04 lb 1e-2
@test_approx_eq_eps .48 ub 1e-2

