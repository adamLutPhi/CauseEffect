
# 16-2-2023
## Added

-`subView`:  takes   `startindex`, `endIndex`, and `view` or `subArray`

Adds the ability to subdivide the `Vector`
using function `subView`: 

"As long as index rang values are valid "
i.e. 
startindex < endIndex

### Example
To Create a `subView`: from `3` to `5`
```
  1 2 3 4 5 6 7 8 9
     [3 4 5] 

```

`julia> subView(3,5, res)`
```
 3
 4
 5
```

**WARNING:**

type of `res` is no longer a vector, but a `subArray`

for more information, please visit:

https://docs.julialang.org/en/v1/base/arrays/#Views-(SubArrays-and-other-view-types


# 16-2-2023
## updated
`compareTriad`


# 9-1-2022

## Action Plan
### Added

`objBounds(_view,arr)`

Although first seems to be as `_view`, input parameters are of type `any`,
So, they could be of any type , that's what that line on the website would say

# 9-5-2022

## Action Plan

### Updated

`objBounds(arr)`
    corrected function output

`objBounds(_view,arr)`
    corrected its return

# 9-7-2022
## Action Plan

### added
 `lineLengthAcceptable(a,b,_length)`
To add consistency, keeping it simple, & not repeating thyself

### corrected
the `swapContent` return output parameters
it was primarily mistakenly left as array content, but got changed into
array indicies , with a contentSwapped bool, as a third parameter

# 9-7-2022

## Action Plan

### replaced
`oldschoolSwap` with `swapContent`, as the intent was to replace content, if proven to be bigger
### Corrected
`elementAt` ouputs

### depreciated
`calcVerteciesLeft!`  , `isStoppingCondition` , `traverse` , `mappedIndex`, `collect`,  `checkCond` , `checkCondition` , `collect`
all depreciated functions are moved into `unUsed.jl`


# 9-12-2022

## Action Plan

### Corrected

=`swapContent` inner function logic (so that function enters)

### Removed

- Unnecessary `half-Comment` operators `#=` and `=#` across the `Utils.jl` (From Uneven Commenting )

Now, `Utils.jl` output displays the main issue:
`boundError` -  to be dealt with

### Updated
- `Unused.jl`
- `makeVector` into the built-in `collect`

# 9-17-2022

## Action Plan

## Updated

- `UnUsed2`: files from `Utils` has been Transferred for it
-  `Utils` : removed non-functional code
- `demo`: spaces been added

# 9-18-2022

## Action Plan

### Updated
- `novelApproach`:  requires more work on debugging

# 9-19-2022
## Action Plan
### Updated
- `novelApproach` runs until completion, finishes with typical error type `BoundError`

## Next Action Plan
Bound handling Phase:
- Recheck `elementAt` output
- Issues detected with functions `compareTriad`, `compareQuartet`:
bound handling those functions


- Depreciate every **non-functional** `_view`,
and replace it the debugged `objBounds`
