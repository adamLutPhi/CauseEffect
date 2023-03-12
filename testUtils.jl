include("helper.jl")
using Test
contentSwapped = nothing

a = findall(x -> x == aContent, arr) # findsd all indices x (whose content  matches `acon`) # 9

@inline function swapContent(aContent :: Float32 , bContent :: Float32, arr::Array{Int64,1}) # ; offset=1) #new! # a,b,indicies in arr  #the less arguments the better

    contentSwapped = nothing

    a = findall(x -> x == aContent, arr) # findsd all indices x (whose content  matches `acon`)
    #a = a[offset]
    println("a = ", a, " length = ", length(a))
    a = firstindex(a) #first(a)
    println("firstindex a = ", a)
    ##  a = a[a+1] ## a[firstindex(arr)]] # first index
    ##  a = first(a) +1

    b = findall(x -> x == bContent, arr) # 4
    println("b = ", b, " length = ", length(b))

    ##    if length(a) == 0 || length(b) == 0
    #    return
    ##    end
    ## b = lastindex(b) #last(b)
    #b = b[b-1]
    #b = b[lastindex(b)] # copy(b[length(b)])   # -offset])

    b =  length(b) # lastindex #last(b) # 4

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
        ##   _first = arr[a]
        #  _last = arr[b]
        #if condition

    end
end # corrected , 11 true

#=minmax(a, b) = (a < b) ? a, b : b, a
#isMinmax(a,b) = (a < b) ? true : false
#oldSchoolSwap(a,b,arr)  = begin

isMinmax(a,b) && isMinmax(arr[a],arr[b])
    if (arr[a]> arr[b] && a < b)  a , b  = b, a
    else # a , b  = a, b
    end
     a,b
 end =#

arr = [9,8,5,2] #length = 4

shouldSwap(a,b,arr)  = arr[a]> arr[b] && a < b ? (return true) : return false # beware of julia's eager functinality - Tamas Papp https://discourse.julialang.org/t/expression-error-message-is-not-unambiguous/11994
println("shouldSwap = ",shouldSwap(1,2,[9,8,6])) #should swap at index 1 & 2 ? Yes
oldSchoolSwap(a,b,arr) = shouldSwap(a,b,arr) ? (return a,b = b,a) : return a,b
acontent,bcontent = oldSchoolSwap(1,2,arr)
println("oldSchoolSwap", acontent,bcontent )  #oldSchoolSwap(1,2,arr))
_length = copy(length(arr))
contentSwapped = false  #nothing

# erroneous values!
lowerBound = firstindex(arr)
upperBound = length(arr)
println("lowerBound",lowerBound)
println("arr[first] = ", arr[lowerBound]) # 9
condition =  arr[lowerBound] > arr[upperBound]
aContent =  arr[lowerBound]
upperBound = _length #lastindex(arr) # 4 wrong ! #Reasoning: julia's default function returns the `length` & not the actual real index

println("upperBound",upperBound)
condition =  arr[lowerBound] > arr[upperBound] # 9  >

if condition == true
    println("before swapping: arr[lowerBound], arr[upperBound] ",arr[lowerBound]," ", arr[upperBound] )
    println("arr = ",arr)
    #swap
    arr[lowerBound], arr[upperBound] =  arr[upperBound],arr[lowerBound]
    println("after arr[lowerBound], arr[upperBound]  = ",arr[lowerBound]," ", arr[upperBound] )
    println("arr = ",arr)
elseif condition == false
end


function docompare( arr ; exceptionParameter = UnexpectedError) #debugged

    # erroneous values!

    lowerBoundIndex =  firstindex(arr) # lowerBound
    upperBoundIndex = length(arr) # upperBound

    # lowerBound = getIndex(lowerBound)
    # upperBound = getIndex(uppperbound)

    println("lowerBound",lowerBound)
    println("arr[first] = ", arr[lowerBound]) # 9
    condition =  arr[lowerBound] > arr[upperBound]
    aContent =  arr[lowerBound]
    #upperBound = _length(arr) #lastindex(arr) # 4 wrong ! #Reasoning: julia's default function returns the `length` & not the actual real index
    contentswapped = false
    println("upperBound",upperBound)

    condition =  arr[lowerBound] > arr[upperBound] # 9  >
    if condition
        println("before swapping: lowerBound "+lowerBound +" upperBound "+ upperBound+" arr[lowerBound], arr[upperBound] ",arr[lowerBound]," ", arr[upperBound] )
        println("arr = ",arr)
        #swap Content
        arr[lowerBound], arr[upperBound] =  arr[upperBound], arr[lowerBound]
        contentswapped = true # content swapped
        println("after arr[lowerBound], arr[upperBound]  = ",arr[lowerBound]," ", arr[upperBound] )

        println("arr = ",arr)
    elseif condition == false
    else raise(exceptionParameter)
    end
    # arr[lowerBound], arr[upperBound], contentswapped
    lowerBound, upperBound, contentswapped
end


function checkValidIndex(idx1, idx2; exceptionParameter= UnexpectedError) #check

    isValid = true
    if idx1 > idx2
        isValid = false
    elseif idx1 <= idx2 # include ``=` (before compiler thinks it's an exception)
    else raise(exceptionParameter) #something unexpected occured, raise error
    end
    #if idx1 == idx2 # special case (but is a valid index;handle seperately)
    #end
    return isValid
end
function isEqual(idx1, idx2;exceptionParameter = UnexpectedError)

    _isEqual  = true
    if idx1 != idx2 # special case (but is a valid index;handle seperately)
        _isEqual = false
    elseif idx1 == idx2
    else raise( exceptionParameter)
    end
    _isEqual
end

#Rule1: helper functions should be minimal (if possible) (no function calls anot)
# Rule2: if helpful -> keep, else -> do not keep
#if

#=

""" compares indicies """ # it doesn't make sense (this function has to compare content , or else: we don't need it)- even if indicies compared , it's outside of problem scope

function docompareIndex(a,b,arr) #question integrity

    idx1 = a
    idx2 = b
    #check valid Index
    #rule: do not call another function (inside a minimal function)

    if checkEqual(idx1, idx2) == false #another scope (unwanted), but helpeful [so, call before this function ] #unnecessary in scope

    end
    isValid = checkValidIndex(idx1, idx2)
    if isValid == true

    elseif isValid == false
    else raise(UnexpectedError)
    end
=#

""" compares content , from the given index a, b , returns the

``
""" #rule: docompare is not required to do another thing (i.e. getinde)
function docompare(a, b, arr; exceptionParameter = UnexpectedError) #debugged

    # erroneous values!

    lowerBound = a #firstindex(arr)     # lowerBound =  getIndex(lowerBound,arr) #need the index

    upperBound = b #length(arr)     # upperBound = getIndex(upperBound,arr)

    println("lowerBound",lowerBound)
    println("arr[first] = ", arr[lowerBound]) # 9

    condition =  arr[lowerBound] > arr[upperBound]
    aContent =  arr[lowerBound]
    #upperBound = _length(arr) #lastindex(arr) # 4 wrong ! #Reasoning: julia's default function returns the `length` & not the actual real index
    contentSwapped = false
    println("upperBound",upperBound)
    condition =  arr[lowerBound] > arr[upperBound] # 9  >
    if condition == true
        println("before swapping: arr[lowerBound], arr[upperBound] ",arr[lowerBound]," ", arr[upperBound] )
        println("arr = ",arr)
        #swap
        arr[lowerBound], arr[upperBound] =  arr[upperBound],arr[lowerBound] # swap content
        contentSwapped = true
        println("after arr[lowerBound], arr[upperBound]  = ",arr[lowerBound]," ", arr[upperBound] )

        println("arr = ",arr)
    elseif condition == false # not an issue
    else raise(exceptionParameter) #raise an issue
    end
    lowerBound, upperBound, contentSwapped # Always return indicies
    # arr[lowerBound], arr[upperBound], contentswapped # Rule: do NOT return content ! [index, alone, is  required]
end

ar2 = [10,8,2]
println(ar2)
print("docompare = ",docompare(1,2,ar2) ) #pass-in index only
println(ar2)

println("arr[last] = ", length(arr)) #length(arr)])
bContent = length(arr)
#lowerBound,upperBound aContent, bContent

""" compareTriad : Algorithm

#scan1

    doCompare(a,m1 )
    doCompare(m1, b)
#now, max is found, which is at b [exclude from the next scan ]

#scan2:  finds the min ( which should be at index a)
- [imagine]: as if there is a stack ,& we  poped b so it's  not longer required
    doCompare(a,m1) [now scan should be finished]
    afterwards, a is the min
    numOps = 3 (as in Triad)
"""
function compareTriad(a, m1, b, arr; exceptionParameter = UnexpectedError)

    try
        #scan1:
        # a, m1
        # from the index a find its value , from index m1 find its value compare , swap only  if a's content is larger that the other
        a, m1, _isSwapped1 = docompare(a, m1, arr) #view(arr, a:m1))

        println("max is b = ", b)
        m1, b, _isSwapped2 = docompare(m1, b, arr) #view(arr, m1:b))
        #scan1 finishes , max is b
        # scan2 : # finds the min
        a, m1, _isSwapped3 = docompare(a, m1, arr)

        println("a, m1, b = ", a, " ", m1, " ", b)

        a, b, m1 , [_isSwapped1, _isSwapped2, _isSwapped3 ]
    catch exceptionParameter
        writeError(msg, exceptionParameter)
    end
end

println(docompare(2,3,arr))
println("arr",arr)


ar3 = [10,8,6]
println("ar3 = ",ar3)


#a, m1, _isSwapped1 =
docompare(1, 2, ar3) #view(arr, a:m1))

#println("max is b = ", b)
m1, b, _isSwapped2 = docompare(2, 3, ar3) #view(arr, m1:b))
#scan1 finishes , max is b
# scan2 :
a, m1, _isSwapped3 = docompare(1, 2, ar3) #view(arr, a:m1))
println("ar3 = ",ar3, "CompareTriad is DONE!")


""" Print array """
function Print(arr)

    println("arr[1] = ", arr[1], " arr[2] = ", arr[2], "arr[3] = ", arr[3], "arr[4]", arr[4])
end


@inline function getIndex(a, arr ; kernel=firstindex)
    a = findall(x -> x == a, arr) #find all indicies
    a = kernel(a)
    a
end


""" compareQuartet: Algorithm

    G1 = { a, b}
    G2 = { m1,m2}
    ## Phase1:
        G1 = {a, b}
        G2 = {m1, m2}
        #1
        docompare(a, b, arr )
        #2
        docompare(m1, m2, arr)

        Regroup (free)

    ## Phase2:
        mins [local min group]= { m1 , m2} out of the mins, find the min (& the max)
        maxes [local max group]= {a , b }out of the maxes, find the max (& the min)
 input vector array , applies a view  on each Interval, remaps the last one

num Ops = 4 (as in Quartet)
"""
function compareQuartet(a, m1, m2, b, arr; exceptionParameter = UnexpectedError) # debugged

    try
        #0. Init
        isSwapped = []
        #G1: Group1 = {a, b}

        #G2: Group2 = {m1, m2}

        # Phase1:
        println("phase1 : G1  (10, 3)  at indicies & G2 at indicies ")

        #conversion to index a
        a = firstindex(arr)
        #conversion to index b
        b = lastindex(arr)
        # get m1 (in relation to a)

        m1 = a + 1
        # find  m2 (in relation to b)
        m2 = b - 1

        idx1 = 0 ; idx2 = 0

        # Phase 1:
        println("Scan #1")
        #1
        println("#1")
        #  docompare(a,b, arr)
        # At 1,4 , arr    , values   (8, 6) -> (6, 8) , isSwapped =true

        a, b, isSwapped1 = docompare(a,b, arr)
        println("arr = ", arr)

        # 2
        println("#2")
        # m1 m2
        # At 2,3 , arr    , values   (10, 3) -> (3, 10 ) , isSwapped =true

        m1, m2 , isSwapped2 = docompare( m1, m2, arr )
        println("arr = ", arr)
        # arr = [ 6, 10, 3, 8 ]

        println("Scan #2")

        # Compare group 1 values (arr[a], arr[b]) at indicies: a  , b
        # Phase2 :

        #find the local min , out of { arr[a] , arr[m1] }
        # compare values whose indicies G1  are   a with m1 indicies: compare their values , now `a` should have the `local min`
        # 6 , 3  -> 3, 6  , isSwapped = true

        #3 local min
        #Group1
        #find the local min , out of { arr[a] , arr[m1] }
        # compare values whose indicies G1  are   a with m1 indicies: compare their values , now `a` should have the `local min`

        println("#3")
        a, m1, isSwapped3 = docompare(a,m1, arr)
        println("arr = ", arr)
        # arr = [ 6, 10, 3, 8 ]

        #4 local max
        # Group2: find the local max (from the maxes arr[m2], arr[b] at indicies m2, b  )

        println("#4")
        # 10 , 8  -> 10 , 8  , isSwapped = true
        m2, b, isSwapped4 = docompare(m2, b, arr)
        println("arr = ", arr)

        # 2 misc. group flags
        # 2 group flags
        swapped = [isSwapped1, isSwapped2, isSwapped3 , isSwapped4] # a, b, m1 , [_isSwapped1, _isSwapped2, _isSwapped3 ]
        println("swapped = ", swapped)

        #3. Return
        a, b, m1 , m2 , swapped

    catch exceptionParameter #UnexpectedError
        #@error , "Unexpected error" , exception = (UnexpectedError, catch_backtrace())
        writeError(msg, exceptionParameter) # @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end

#DEMO (2):

## array1:  descending list
arr1 = [ 10 , 8 , 6, 3]
b = length(arr1);
m2 = b - 1
m1 = m2 - 1
swapped = []
# a,m1,m2, b, Ms
a, b, m1 , m2 , swapped = compareQuartet(a,m1,m2,b, arr1)

#even to  figureout the toughtest:

## array2
arr2 = [8, 10, 3, 6] # check this

# a, b, m1 , m2 , swapped
# a, m1, m2, b, Ms

a, b, m1 , m2 , swapped = compareQuartet( a, m1 , m2, b , arr2 )
println("compareQuartet finished without errors")

#=

println("a, m1, b = ", a, " ", m1, " ", b)


println("before = ",ar3)
a, b, m1,_vectorSwapping = compareTriad(ar3) #, _vectorSwapping = compareTriad(ar3)
println("comparetriad",compareTriad)
println("after = ",ar3)
=#
#=
function  getContent(arr)
    lowerBound = firstindex(arr)
    aContent = arr[upperBound]
    upperBound = length(arr)
    bContent = arr[upperBound]
    aContent, bContent
end
function getIndex(arr)
    a =  firstindex(arr)
    b = length(arr)
    a, b
end
=#

#=

function docompare(arr)

    lowerBound = firstindex(arr)
    aContent = arr[lowerBound]
    upperBound = length(arr)
    bContent = arr[upperBound]

    if lowerBound < upperBound
        if aContent< bContent
        elseif aContent > bContent

            #swap arr's contents, at bot a, b :
            a,b =  arr[lowerBound]  arr[upperBound] #lowerBound
        end
    end
    lowerBound, upperBound, aContent, bContent
end


println("doCompare = ", docompare(arr))
a,b = getIndex(arr)
println("indicies = ",a," ",b)
=#
#println("Contents = ". getContent(arr))
#----

function getbounds(a,b,arr) #checkUsage

    a = firstindex(arr) #findall(x -> x == a, arr) #getIndex(a,arr) #findall(x -> x == a, arr)
    aContent = arr[a]

    b = lastindex(arr) #findall(x -> x == b, arr) #getIndex(b,arr) #a = findall(x -> x == b, arr)
    bContent = arr[b] #length(b)]
    aContent,bContent
end

function getbounds(arr)

    _first = getIndex(1,arr) #findall(x -> x == a, arr)

    aContent = arr[_first]

    _last = length[arr]

    #b = getIndex(length(arr),arr) #a = findall(x -> x == b, arr)
    bContent = arr[_last] #length(b)]
    aContent,bContent
end

#aContent,bContent = getbounds(arr) # getbounds(1,4,arr)
## println("aContent,bContent", aContent,bContent)

#=
a = findall(x -> x == 9, arr)
#a = a[offset]
println("a = ", a, " length = ", length(a), " arr[1] = ",arr[length(a)])
_first = arr[length(a)]
println("firstXIndex = ",_first)
a= firstindex(a) #first(a)
println("firstindex a = ", a)
##  a = a[a+1] ## a[firstindex(arr)]] # first index
##  a = first(a) +1

b = findall(x -> x == 2, arr) # 4
b = arr[b]

println("b = ", b, " length = ", length(b), " arr[4] = ",arr[length(b)])
_last = arr[length(b)] # 9
bContent = arr[length(b)]

=#

#----
#=

if lowerBound < _length && upperBound < _length && lowerBound >= 0 && upperBound >= 0 # && upperBound >= m2 # if lowerBound <= _length && upperBound <= _length

    #0. Init
    aContent = first(arr) #arr[lowerBound] #<------
    bContent = last(arr) #arr[upperBound]
    contentSwapped = false #true  #  nothing
    #= try
    # Base.@propagate_inbounds =#

    #1. Check condition
    if aContent <= bContent
        # pass

    elseif aContent > bContent # arr[lowerBound] > arr[upperBound] n# <--- critial decision
        #Base.@propagate_inbounds
        lowerBound, upperBound, contentSwapped = oldSchoolSwap(lowerBound, upperBound,arr) #arr[lowerBound] , arr[upperBound] , arr) #oldSchoolSwap(lowerBound, upperBound, arr) #swapContent(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap

        #    contentSwapped = true   #arr[lowerBound], arr[upperBound]
    #TODO:unCommentMe    #println("at index lowerBound = ", lowerBound, " upperBound = ", upperBound, ", aContent = ", arr[lowerBound], " , bContent = ", arr[upperBound])
    #elseif aContent <= bContent  # arr[lowerBound] < arr[upperBound] #review#1 #<----- # includes bothContents are equal
    else
        raise(exceptionParameter)
    end

   elseif lowerBound == _length || upperBound == _length # last step: scalar
    return  lowerBound, upperBound, nothing  #getLastElement2(lowerBound, upperBound) #TODO:check
    #contentSwapped = nothing
end

=#

#=
@inline function oldSchoolSwap(a,b,arr)

    _length = length(arr)
    contentSwapped = false
    #if  a < b
        if arr[a]< arr[b]
        elseif arr[a]> arr[b] && a< b #a <= _length && b <= _length &&
            println("Before: a , b", a , b) #
            a , b  = (arr[a]> arr[b] && a < b) ? b, a :  a, b  # a , b  =  b, a : a , b  =   a, b
            println("after : a , b", a , b)
            contentSwapped = true
        end
    #end
        a, b, contentSwapped
end
=#

#=
@inline function doCompare(lowerBound, upperBound, arr::Array{Int64,1} ; exceptionParameter = UnexpectedError ) # ,  conditionSame = ) #works

    try
        #[1...8] length = 8+1 -1 = 8
        lowerBound = firstindex(arr)
        upperBound =lastindex(arr)
        _length = copy(length(arr))
        contentSwapped = false  #nothing
        if lowerBound < _length && upperBound < _length && lowerBound >= 0 && upperBound >= 0 # && upperBound >= m2 # if lowerBound <= _length && upperBound <= _length

            #0. Init
            aContent = first(arr) #arr[lowerBound] #<------
            bContent = last(arr) #arr[upperBound]
            contentSwapped = false #true  #  nothing
            #= try
            # Base.@propagate_inbounds =#

            #1. Check condition
            if aContent <= bContent
                # pass

            elseif aContent > bContent # arr[lowerBound] > arr[upperBound] n# <--- critial decision
                #Base.@propagate_inbounds
                lowerBound, upperBound, contentSwapped = oldSchoolSwap(lowerBound, upperBound,arr) #arr[lowerBound] , arr[upperBound] , arr) #oldSchoolSwap(lowerBound, upperBound, arr) #swapContent(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap

                #    contentSwapped = true   #arr[lowerBound], arr[upperBound]
            #TODO:unCommentMe    #println("at index lowerBound = ", lowerBound, " upperBound = ", upperBound, ", aContent = ", arr[lowerBound], " , bContent = ", arr[upperBound])
            #elseif aContent <= bContent  # arr[lowerBound] < arr[upperBound] #review#1 #<----- # includes bothContents are equal
            else
                raise(exceptionParameter)
            end

        elseif lowerBound == _length || upperBound == _length # last step: scalar
            return  lowerBound, upperBound, nothing  #getLastElement2(lowerBound, upperBound) #TODO:check
            #contentSwapped = nothing
        end
        lowerBound, upperBound, contentSwapped #arr[lowerBound], arr[upperBound]
    catch exceptionParameter #UnexpError #<--- exception: Caught: check for euclidDist above the scope of this function
        writeError( msg, exceptionParameter) #@error "ERROR:UnexpError " exception = (UnexpError, catch_backtrace())
    end
end



ar1 = [9,6,4,2]
#
#print
#a,b,m1, _flagSwap = doCompare(1, 2, ar1)
# compare1
a=1 ; b = 2
# if a <b && ar1[a]> ar1[b] |> doCompare(1, 2, ar1) end
@Test.test  doCompare(1, 2, ar1)
a, m1, _flagSwap = doCompare(1, 2, ar1) #
println("ar1: a,m1 =", a , m1  )
println("ar1: ar1[a], ar1[m1]", ar1[a] , ar1[m1] )
println("ar1 = ", ar1)
# compare 2:
m1,b, _flagSwap = doCompare(2, 3, ar1)
println("m1,b: ", m1," ",b)
#scan2:

# compare 3:
a, m1, _flagSwap = doCompare(1, 2, ar1) #


a, b, m1, _swapVector =compareTriad(1,2,3,ar1)  #a, m1, b) #input indicies ,  output indicies

println("a, m1, b", a,m1, b)
println("_swapVector = ",_swapVector)
println("ar1",ar1)
#compareTriad
@Test.test a < m1 && m1 < b
@Test.teset ar1[a] < ar1[m1] && ar[m1] < ar1[b]

print(" doCompare(9, 6, ar1)",  )
@Test.test _flagSwap == true
#don't swap # return values
#  return
#    contentSwapped = false #arr[lowerBound], arr[upperBound]
#@inbounds lowerBound[st], lowerBound[ed] = lowerBound[st] , lowerBound[ed]        #an inbounds swap

#  elseif aContent == bContent # arr[lowerBound] == arr[upperBound] #contents the same Can increase the count (in lowerBound dictionary?)
#lowerBound<upperBound Always
#   if lowerBound < upperBound
#     contentSwapped = false  #arr[lowerBound], arr[upperBound]

#end

#Base.@inbounds
#TODO: situation where both contents are equal # current: do nothing
# elseif

# elseif aContent <= bContent  # arr[lowerBound] < arr[upperBound] #review#1 #<----- # includes bothContents are equal
#don't swap # return values
#  return
#    contentSwapped = false #arr[lowerBound], arr[upperBound]
#@inbounds lowerBound[st], lowerBound[ed] = lowerBound[st] , lowerBound[ed]        #an inbounds swap

#  elseif aContent == bContent # arr[lowerBound] == arr[upperBound] #contents the same Can increase the count (in lowerBound dictionary?)
#lowerBound<upperBound Always
#   if lowerBound < upperBound
#     contentSwapped = false  #arr[lowerBound], arr[upperBound]
#do nothing
#else?
#end
=#
