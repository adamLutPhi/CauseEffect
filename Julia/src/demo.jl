include('./unUsed.jl')
export subView 

function swapContent(aContent, bContent, arr)# compiles #; offset=1) #new! # lowerBound,upperBound,indicies in arr

    contentSwapped = nothing
    lowerBoundIndex = findall(_view -> _view == aContent, arr) # find an array of all matched indices  of aContent in arr array
    lowerBoundIndex = first(lowerBoundIndex)  #lowerBound[offset]

    upperBoundIndex = findall(_view -> _view == bContent, arr) # gets back array indicies of all matches of bContent in arr array
    upperBoundIndex = last(upperBoundIndex)   #fetch the last value
     #copy(upperBound[length(upperBound)])   # -offset])
    #Intent: Set lower upper bound to the Min, & Max possible


    if aContent > bContent

        arr[lowerBoundIndex], arr[upperBoundIndex] = arr[upperBoundIndex], arr[lowerBoundIndex] #swap
        contentSwapped = true

        println(arr[lowerBoundIndex]," ", arr[upperBoundIndex]," ",contentSwapped)

    elseif aContent <= bContent

        contentSwapped = false
        println(arr[lowerBoundIndex]," ", arr[upperBoundIndex]," ", contentSwapped)
    end

    return lowerBoundIndex, upperBoundIndex, contentSwapped #returns index (more practical)
end

ar1 =  [3,2,1]

a,b,isSwapped = swapContent(3,2,ar1)

# Demo : subView 
loBound = 1; upBound=9;
arr = collect(loBound:upBound)
# hypothetical middle
m1, m2 = 5, 6 # Intervals should be [1, 4] [5, 6] [ 7, 9]
using Base.
Int.Inf 
tmpBound = m1-1
_stack = []
if tmpBound >0:
_stack.append( subView(loBound, tmpBound) ) 
    
subView(loBound, tmpBound) 
subView(1,1)
