#module commented

msg =  "unexpected error occured"

euclidDist( a :: Int64, b :: Int64 ) = -(a,b)+1

@inline function swapContent(aContent :: Float32 , bContent :: Float32, arr::Array{Int64,1}) # ; offset=1) #new! # a,b,indicies in arr  #the less arguments the better

    contentSwapped = nothing

    a = findall(x -> x == aContent, arr)
    #a = a[offset]
    println("a = ", a, " length = ", length(a))
    a= firstindex(a) #first(a)
    println("firstindex a = ", a)
    ##  a = a[a+1] ## a[firstindex(arr)]] # first index
    ##  a = first(a) +1

    b = findall(x -> x == bContent, arr)
    println("b = ", b, " length = ", length(b))

    ##    if length(a) == 0 || length(b) == 0
    #    return
    ##    end
    ## b = lastindex(b) #last(b)
    #b = b[b-1]
    #b = b[lastindex(b)] # copy(b[length(b)])   # -offset])

    b = lastindex #last(b)

    if aContent < bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing
        contentSwapped = false
        println(arr[a], arr[b], contentSwapped)

    elseif aContent == bContent
        # personal preference solution:  first one, closest to lower bound is at first

        contentSwapped = false
        println(arr[a], arr[b], contentSwapped)

    elseif aContent > bContent

        contentSwapped = true
        arr[a], arr[b] = arr[b], arr[a] #swap
        println(arr[a], arr[b], contentSwapped)
    end
        ##   _first = arr[a]
        #  _last = arr[b]
        #if condition
##
    #=
    if aContent > bContent
        arr[a], arr[b] = arr[b], arr[a] #swap
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(arr[a], arr[b], contentSwapped)

    elseif aContent < bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing
        contentSwapped = false
        println(arr[a], arr[b], contentSwapped)

    elseif aContent == bContent
        #personal preference solution , the first one close to lower bound  is at first

        contentSwapped = false
        println(arr[a], arr[b], contentSwapped)

    end =#
##
    return a, b, contentSwapped #returns index (more practical)
end


""" Catch an error on the `backtrace` with specified error, and display elaboration message, by default """
function writeError( msg :: String ; _error :: String = UnexpectedError, elaboration ::String =": please check then try again ")
    @error msg + elaboration + exception = (UnexpectedError, catch_backtrace())
    #@error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
end


function remap( a :: Int64 , b :: Int64 ) # 1 2  abs(max(a, b) - min(a, b)) + 1 ; 2 -1 = 1 + 1 = 2

    b = euclidDist(a, b) + 1 # + 1 #warning you added 1 to the end: recheck new bounds (are all ranges fit) - some got to be out
    a = 1 #always start from this index #or offset
    return a, b
end


#=

""" input vector array , applys view  on each Interval, remap last one"""
function compareQuartet(a, m1, m2, b, arr::Array{Int64,1})
    # try
        twinMiddles = nothing

        # apply view(arr, a:b)

        ###    compareQuartet(a, m1, m2, b, arr)

        # divide a m1  , m2, b

        #                m1, m2, _isSwapped = swapContent(m1, m2, arr)
    #Phase1: local swap (& sort )

        a, m1, _isSwapped = swapContent(a, m1, arr)  # a is local min

    #    m2, b = remap(m2, b)
        subView(m2,b, arr)

        m2, b, _isSwapped = swapContent( m2, b, arr) # b is local max

            #Phase 2:
            # post local sort: rearrange terms into 2 new groups: mins & max(es)
            ## mins: a, ,2
            ## maxes: m1, begin

        a, m2, _isSwapped1 = swapContent(a, m2, arr)  # a is local min

        m1, b, _isSwapped2 = swapContent( m1, b, arr) # b is local max

            # at this point: a is global min, b is global max
            # (still we have yet to check last 2 terms: m1, m2 )

        #Phase3:
        m1, m2, _isSwapped3 = swapContent( m1, m2, arr) # b is local max

        a, m1, m2, b , [_isSwapped1, _isSwapped2, _isSwapped3 ]

end
=#

#= #CauseEffect.jl
function stoppingCondition(_view::SubArray) #depreciate
    # m1, m2, isWhole = callMiddle!(first(_view), last(_view), _view)
    isWhole = getIsWhole(_view)
    #calcUnexplored
    # # length(arr) - 2 - isWhole= 1 : 2
    formula = calcTotalMiddles(_view)
    formula -= getSubtractedValue(isWhole)
    if formula == 0 #useful for a recursion #check if done
        #stoppage condition
        return true #0
    #end
    else
        #instead
        #callMiddle!(a, m1,) #TODO: compllete this logic
        #create view
        #callMiddle!(a,b,view)
        #isWhole == true ? callMiddle(m1, b) : callMiddle(m2, b)
        return false
    end
end
=#

function stoppingCondition( a :: Int64 , b :: Int64 , _view)#depreciate

    m1, m2, isWhole = callMiddle!(a, b, _view)
    #calcUnexplored
    if calcTotalMiddles(_view) - getSubtractedValue(isWhole) == 0 #useful for a recursion #check if done
        #stoppage condition
        return true #0
    else
        ## instead
        #callMiddle!(a, m1,) #TODO: compllete this logic
        #create view
        #callMiddle!(a,b,view)
        ## isWhole == true ? callMiddle(m1, b) : callMiddle(m2, b)
        return false
    end
end

#no method matching getIndex(::Int64, ::Vector{Int64})
function getindices( a  , b , arr )

    firstIndex = firstindex(findall(x -> x == a, arr ))
    lastIndex = lastindex(findall(x -> x == b, arr ))

    idxA, idxB = firstIndex, lastIndex
    idxA, idxB
end

#from index.jl
include("index.jl")

function getindices2( a  , b  , arr )

    firstIndex = getIndex( a , arr ) #firstIndex(findall(x -> x == a, arr ))
    lastIndex  = getIndex( b , arr ) #lastindex(findall(x -> x == b, arr ))

    idxA, idxB = firstIndex, lastIndex
    idxA, idxB
end

ar = [3,2,1]
println(  CartesianIndices(axes(ar) ))
a1, a2 = getindices2(1,2, ar )

println("a1,a2: a1 = ", a1, " a2 = ", a2 )


function swapContents( a :: Int64 , b :: Int64, lst ; first ::Int64 = 1 ) # check?


    #0. Init
    idxA, idxB = 0, 0
    n = length(lst)
    nMax = n - 1 +  first
    is_swapped = nothing

    #1. Get indicies
    idxA, idxB = getindices(a,b, lst)


    ## if a < nMax || b < nMax
        # if collection is ordered
        if lst[idxA] < lst[idxB]
            is_swapped = false  # no swap
            print(" Content is not swappable\n")
        # If collection is not ordered
    elseif lst[idxA] > lst[idxB]

           lst[idxA], lst[idxB] =  lst[idxB], lst[idxA]
            ## a , b = b, a
            ## lst[idxB], lst[idxA] = lst[idxA], lst[idxB] #swap
            is_swapped = true # swap
            print(" Content Swapped\n")
        end

    a, b, is_swapped
end


function swap( a :: Int64 , b :: Int64, lst ; first :: Int64 = 1 )

    #0. Init
    idxA, idxB = 0, 0
    n = length(lst)
    nMax = n - 1 +  first
    is_swapped = nothing

    #1. check if index is above max
    if a > nMax || b > nMax

        #2.1.1 Call Procedure
        idxA, idxB = getindices(a , b, lst)
        #2.1.2 Swap Indices
        a,b = idxA, idxB
    end

    #2. Otherwise, if interval(a,b): is valid
    if a < nMax || b < nMax

        #2.1 if collection is ordered
        if lst[a] < lst[b]
            is_swapped = false  # no swap
            print(" Content is not swappable\n")
        #2.2 If collection is not ordered
        elseif lst[a] > lst[b]
            lst[a], lst[b] = lst[b], lst[a] #swap
            is_swapped = true # swap
            print(" Content Swapped\n")
        end
    end
    #3 Return
    print("a = ", a , " b ", b , " lst[a] = ", lst[a], " lst[b] = ", lst[b])
    a, b, is_swapped
end


function compareTriad( a :: Int64,  m1 :: Int64 , b :: Int64, arr ; exceptionParameter = UnexpectedError)

    try
        # Scan #1
        ##Swap #1
        a, m1, _isSwapped = swap(a, m1, arr)
        ##Swap #2
         m1, b, _isSwapped = swap(m1, b, arr)

        #Scan2
        ## Swap3
        a, m1, _isSwapped = swap(a, m1, arr)

        print("a , m1, b", a, " ", m1, " ", b)
        a, b, m1
    catch exceptionParameter
        writeError( msg, exceptionParameter)
    end
end


# DEMO
ar1 = [10, 8, 3]
a, b, m1 = compareTriad(1,2, 3, ar1)
print(" a = ", a,  " m1 = ", m1, " b = ", b ," ; lst[a] = ", ar1[a],
 " ar1[a] = ", ar1[a], " ar1[m1] = ", ar1[m1]," ar1[b] = ", ar1[b]) # to dislay at the end
println("\nar1 = ", ar1)


""" get a subView from any view, provided a `lowerBound` & an `upperBound` """
function subView(lowerBound :: Int64 ,upperBound :: Int64 ,_view)
    collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
end


function compareQuartet(a :: Int64, m1 :: Int64 , m2 :: Int64, b ::Int64 , _view)

    try

        ## artest = [10, 8, 6, 3]
        ##  a, m1, m2 , b

        twinMiddles = nothing
        mins=[]
        maxes=[]

        #= # apply view(arr, a:b)
            compareQuartet(a, m1, m2, b, arr)
        =#
        #   m1, m2, _isSwapped = doCompare(m1, m2, view(_view, m1:m2)) #compare twinMiddles' content
        ##   a, b, _isSwapped = doCompare(a, b, view(_view, a:b)) #compare bounds' content
        #   a, m1, _isSwapped = doCompare(a, m1, view(_view, a:m1))

        a, m1, _isSwapped1 = swapContents(a, m1, _view) #swapContent(a, m1, _view)  # a is local min # 8 10 true
        println("After swap : a, ",a, " m1 = ", m1," _view = ",_view )

        ## mins.append(a)
        ## maxes.append(m1)

        ## m2, b = remap(m2, b)

        m2, b, _isSwapped2 = swapContents(m2, b, _view)  #swapContent( m2, b, _view) # b is local max # 810true  # 38true
        println("after swap : m2w, ", m2," b =", b, " view = ", _view )

        #m2, b, _iswapped = subView(m2, b, _view )

        #Phase 2: mins vs maxes
        # post local sort: rearrange terms into 2 new groups: mins & max(es)
        #println("a, m2", a, m2)
        ## mins:
        ##unCommentMe:    a, m2, _isSwapped3 = swap(a, m2, _view) #swapContent(a, m2, _view)  # a is local min

        println("after swap : a ", a," m2 =", m2," view = ",_view)
        #m1, b, _iswapped = subView(   m1, b, _view )

        # maxes:
    ##    m1, b, _isSwapped4 = swap( m1, b, _view) #swapContent( m1, b, _view) # b is local max
    ##    println("after swap  subView:  m1, ", m1, " b = ", b, " view = ",_view )
        # at this point: a is global min, b is global max
        # (still we have yet to check last 2 terms: m1, m2 )

        #Phase3:
        #m1, m2, _iswapped = subView(   m1, m2, _view )
        #m1, m2, _isSwapped3 = swapContents( m1, m2, _view) #swapContent( m1, m2, _view) # b is local max

        println("end: :  m1, ", m1," m2 =", m2," view = ", _view)

        #scan2
        #=
         a, m2, _isSwapped4 = swap(a, m2, _view) #swapContents(a, m2, _view)  # a is local min

        m1, b, _isSwapped5 = swapContents(m1, b, _view)  #swapContent( m2, b, _view) # b is local max # 810true  # 38true
        # m2, b, _isSwapped5 = swap(m2, b _view) #swapContents(a, m2, _view)  # a is local min
        =#

        m1,m2, _isSwapped6 = swapContents(m1,m2, _view) # [8 6] -> [6 8]
        #    a,b, _isSwapped6 = swapContents(m1,m2, _view)

    a, m1, m2, b , [_isSwapped1, _isSwapped2, _isSwapped6 ]  # _isSwapped4,  _isSwapped5 # _isSwapped4,  _isSwapped5, _isSwapped6 ]  # _isSwapped3 ,_isSwapped4,  _isSwapped5, _isSwapped6 ]  #_isSwapped4, _isSwapped5 ]

    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end


function endAlgorithmSafely()
    return # 0
end


## swapContent(_view[lowerBound], _view[upperBound], _view)
#oldSchoolSwap(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap
#lowerBound, upperBound = oldSchoolSwap(lowerBound, upperBound, _view)
# contentSwapped = true   #arr[lowerBound], arr[upperBound]
#  elseif aContent > bContent
#do nothing
#  contentSwapped = false
#  end
# ===========
# Utils.jl
# ===========

# 5305

## orphaned Code Block compiles inputArguments() # TODO: create lowerBound function, for it
# m2, upperBound relation (m2+1 , upperBound-1 )
#= UncommentMe
if euclidDistDifference(m2 + 1, upperBound - 1) > 2 #?  #TODO: fix orphaned code
    conquer(collect(m2+1:upperBound-1), kernel) #: return

elseif isUnitDistanceReached(m2 + 1, upperBound - 1) == true # , kernel) == true #1  # euclidDistDifference(m2 + 1, upperBound - 1) == 1

    #v = collect(m2:upperBound)
    #_view = view(v, firstindex(v):lastindex(v))
    if m2 == upperBound - 1 || m2 + 1 == upperBound # (instead of 4 points,) [we have unique 2 points]

        # the difference between m2 & m2+ 1 is 1 -> docompare() is the best compare function
        _view = collect(m2:m2+1) # |>
        _view -> view(_view, firstindex(_view):lastindex(_view))
        res = swapContent(m2, m2 + 1, _view)

        #check return
        if res !== nothing
            lowerBound, upperBound, contentSwapped = res
            return lowerBound, upperBound, contentSwapped
        end
    else # if there are 4 points

        _view = collect(m2:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        res = compareQuartet(m2, m2 + 1, upperBound - 1, upperBound, _view) # <------------------ indexed_iterate(I::Nothing, i::Int64)
        if res !== nothing
            m2, m2 + 1, upperBound - 1, upperBound = res
            return m2, m2 + 1, upperBound - 1, upperBound
        end
    end
    # the difference between m2 & m2+ 1 is 1 -> docompare() is the best compare function
    # _view = collect(m2:m2+1) |> _view -> view(_view, firstindex(_view):lastindex(_view))

    # m2 == upperBound - 1 && m2 + 1 == upperBound ? swapContent(m2, m2 + 1, _view1) : compareQuartet(m2, m2 + 1, upperBound - 1, upperBound, _view)
    #infer information, locations are equal : lowerBound = m2+1 , upperBound = upperBound-1

elseif isEndReached(1, 1) #euclidDistDifference(m2 + 1, upperBound - 1) == 0 # scalar
#  return true #isEndReached(m2, upperBound)
else
    throws(error(msg))
end

#end
=#
# end

artest = [10, 8, 6, 3]

a, m1, m2, b, _swapped = compareQuartet(10, 8,6,3, artest)

println("artest = ", artest)

artest = [6,10, 4,1 ]
a, m1, m2, b, _swapped = compareQuartet(6, 10,4,1 ,  artest)

println("End: artest  = ", artest)
