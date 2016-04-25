import Optim

"""
Compute highest density interval from inverse cdf 
icdf is a function handle
Find minimum width interval that contains specified mass

Based on p630 "Doing Bayesian Data Analysis" Kruschke 2010
See also hdiFromSamples
"""
function hdiFromIcdf(icdf::Function, mass::Real=.95)
    widthFn(lower::Real) = icdf(lower+mass)-icdf(lower)
    results = Optim.optimize(widthFn, 0, 1-mass)
    @assert Optim.converged(results)
    lower = results.minimum
    [icdf(lower), icdf(lower+mass)]
end

