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

        println(arr[lowerBoundIndex], arr[upperBoundIndex], contentSwapped)

    elseif aContent <= bContent

        contentSwapped = false
        println(arr[lowerBoundIndex], arr[upperBoundIndex], contentSwapped)
    end

    return lowerBoundIndex, upperBoundIndex, contentSwapped #returns index (more practical)
end

ar1 =  [3,2,1]

a,b,isSwapped = swapContent(3,2,ar1)
