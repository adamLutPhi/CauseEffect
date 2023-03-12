# CauseEffect

A novel approach on the indexing a vector, via a cause &amp; Effect model

## Work in Progress (WIP)

- Currently Cleaning Utils.jl


(1) `compareTriad `
<https://github.com/adamwillisMastery/CauseEffect/blob/09105102ef647c5ee108cdf458a8eb6f7c6235ac/Julia/src/testUtils.jl#L187>

(2) `compareQuartet`
<https://github.com/adamwillisMastery/CauseEffect/blob/09105102ef647c5ee108cdf458a8eb6f7c6235ac/Julia/src/testUtils.jl#L261>

## Lessons Learned

1. [x] `compareTriad`: for a 1 middle , compares bounds `a` , `b` with the middle `m1` [**3 ops**]
2. [x] `compareQuartet`: for 2 twin middles, compares bounds `a`, `b` with middles `m1`, `m2` [**4 ops**]
Note: both functions are of a `symmetric` structure
