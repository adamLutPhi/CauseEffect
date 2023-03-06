include("helper.jl")
using Test

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
end

#minmax(a, b) = (a < b) ? a, b : b, a
#isMinmax(a,b) = (a < b) ? true : false
#oldSchoolSwap(a,b,arr)  = begin
#=    isMinmax(a,b) && isMinmax(arr[a],arr[b])
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
if condition
    println("before swapping: arr[lowerBound], arr[upperBound] ",arr[lowerBound]," ", arr[upperBound] )
    println("arr = ",arr)
    #swap
    arr[lowerBound], arr[upperBound] =  arr[upperBound],arr[lowerBound]
    println("after arr[lowerBound], arr[upperBound]  = ",arr[lowerBound]," ", arr[upperBound] )
    println("arr = ",arr)
elseif condition == false


end


function docompare(arr) #debugged

    # erroneous values!

    lowerBoundIndex =  firstindex(arr) # lowerBound

    upperBoundIndex = length(arr) # upperBound

    lowerBound = getIndex(lowerBoundIndex)
    upperBound = getIndex(upperBoundIndex)

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
        #swap
        arr[lowerBound], arr[upperBound] =  arr[upperBound],arr[lowerBound]
        contentswapped = true
        println("after arr[lowerBound], arr[upperBound]  = ",arr[lowerBound]," ", arr[upperBound] )

        println("arr = ",arr)
    elseif condition == false

    end
    # arr[lowerBound], arr[upperBound], contentswapped
    lowerBound, uppedBound, contentswapped
end

function docompare(a, b, arr) #debugged


    lowerBound = a #firstindex(arr)
    lowerBound =  getIndex(lowerBound,arr)

    upperBound = b #length(arr)

    upperBound = getIndex(upperBound,arr)

    println("lowerBound",lowerBound)
    println("arr[first] = ", arr[lowerBound]) # 9

    condition =  arr[lowerBound] > arr[upperBound]
    aContent =  arr[lowerBound]
    #upperBound = _length(arr) #lastindex(arr) # 4 wrong ! #Reasoning: julia's default function returns the `length` & not the actual real index
    contentswapped = false
    println("upperBound",upperBound)
    condition =  arr[lowerBound] > arr[upperBound] # 9  >
    if condition
        println("before swapping: arr[lowerBound], arr[upperBound] ",arr[lowerBound]," ", arr[upperBound] )
        println("arr = ",arr)
        #swap
        arr[lowerBound], arr[upperBound] =  arr[upperBound],arr[lowerBound]
        contentswapped = true
        println("after arr[lowerBound], arr[upperBound]  = ",arr[lowerBound]," ", arr[upperBound] )

        println("arr = ",arr)
    elseif condition == false


    end
   # arr[lowerBound], arr[upperBound], contentswapped
    lowerBound, uppedBound, contentswapped
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
#now, max is found, which is at b [exclude from next scan ]

#scan2:
    doCompare(a,m1) [now scan should be finished]
    numOps = 3 (as in Triad)
"""
function compareTriad(a, m1, b, arr; exceptionParameter = UnexpectedError)

    try
        #scan1:
        # a, m1
        a, m1, _isSwapped1 = docompare(a, m1, arr) #view(arr, a:m1))

        println("max is b = ", b)
        m1, b, _isSwapped2 = docompare(m1, b, arr) #view(arr, m1:b))
        #scan1 finishes , max is b
        # scan2 :
        a, m1, _isSwapped3 = docompare(a, m1, arr) #view(arr, a:m1))
        #scan2 finishes: min is a 
        
        println("a, m1, b = ", a, " ", m1, " ", b)

        a, b, m1 , [_isSwapped1, _isSwapped2, _isSwapped3 ]
    catch exceptionParameter #UnexpectedError
        writeError(msg, exceptionParameter) # @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
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

""" compareTriad : Algorithm

    G1 = { a, b}
    G2 = { m1,m2}
# Phase1:
    G1 = {a, b}
    G2 = {m1, m2}
    docompare(a, b, arr )
    docompare(m1, m2, arr)

Regroup (free)
# Phase2:
mins [local min group]= { m1 , m2} out of the mins, find the min (& the max)
maxes [local max group]= {a , b }out of the maxes, find the max (& the min)

    docompare(m1, m2, arr)

    docompare(a, b , arr)

    [now Phases should be finished]
    numOps = 4 (as in Quartet)
"""
function Print(arr)

    println("arr[1] = ", arr[1], " arr[2] = ", arr[2], "arr[3] = ", arr[3], "arr[4]", arr[4])
end

@inline function getIndex(a, arr ; kernel=firstindex)
    a = findall(x -> x == a, arr) #find all indicies
    a = kernel(a)
    a
end


function compareQuartet(a, m1, m2, b, arr; exceptionParameter = UnexpectedError)

    try
        #0. Init
        #G1: Group1
        #conversion to index a
        a = firstindex(arr)
        #conversion to index b
        b = lastindex(arr)
        idx1 = 0 ; idx2 = 0
        #G2: Group2 {m1 , m2}
        m1; m2
        # m1 = getIndex(m1,arr) ; m2 = getIndex(m2,arr) [unnecessary]

        #2: Phases: Phase 1 (a,b)
        #                   (m1,m2)
        #           Phase 2 (a,m1)
        #                   (m2,b)
        #Phase 1:

        # Group1: find local min

        a, b, isSwapped1 = docompare(a,b,arr)
        Print(arr)
        #regroup:
        #casted from the array
        m2 = copy( length(arr) -1  )        #(m2 = b-1)
        m1 = copy(a+ 1) #length(arr) -1 -1       #m1 = m2- 1
        println("m1 , m2,",m1 , m2)
        #Group2: find local min
        #m1 , m2, isSwapped2 = docompare(m1,m2,arr)

        idx1 = getIndex(m1,arr); # m1 # getIndex(m1,arr);  [unnecessary]
        idx2 = getIndex(m2,arr) # m2 #getIndex(m2,arr) [unnecessary]

        m1, m2, isSwapped2 =     docompare(arr[idx1],arr[idx2],arr)# ok #6 3 | 10 8
        Print(arr)

        # m1 = getIndex(m1,arr);  m2 = getIndex(m2,arr)
        #idx1 = getIndex(m1,arr)   ;    idx2= getIndex(m2,arr) [unnecessary]

        a,m1, isSwapped   =  docompare(a,m1,arr)       #
        #a, m1, isSwapped2 =  docompare(arr[idx1],arr[idx2],arr)# ok #6 3 | 10 8

        #idx1 = getIndex(m1)   ;    idx2= getIndex(m2,arr)
        Print(arr)
        m2 ,b, isSwapped3   = docompare(m2,b,arr)
        idx1 = getIndex(m1)   ;    idx2= getIndex(m2,arr)
        Print(arr)

        #Phase2:println
        println("phase2")
        # Re group mins & maxes
    #unCommentMe      m1, m2, isSwapped3 = docompare(m1,m2,arr) #
    #unCommentMe      println("m1 , b,", m1 , b)

    #unCommentMe      println("m1 , m2,", a , m1)

    #unCommentMe    m1, m2, isSwapped4 = docompare(m1,m2,arr)
        println("m1 , m2,", a , m1)
        #println("a , m1,", a , m1)

        # min(s): a  & m1 docompare (to get the min)
    #    a , m1 , isSwapped4 = docompare(a,m1,arr) #

        # max(es):  docompare (to get the max )
        println(" m2, b", m2, b)
        m2, b , isSwapped3 = docompare(m2,b,arr)

        m1, m2, isSwapped4 = docompare(m1,m2,arr) #TODO: IndexOf(m1) , IndexOf(m2)
        println(" m1, b", m1, b)
        #misc. group flags
        Ms = [isSwapped1,isSwapped2,isSwapped3,isSwapped4]
    #3. Return
    a , m1 , m2, b, Ms
    catch exceptionParameter #UnexpectedError
        #@error , "Unexpected error" , exception = (UnexpectedError, catch_backtrace())
        writeError(msg, exceptionParameter) # @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end

#DEMO (2):
# descending list
arr1 = [10,8, 6, 3]
b = length(arr1);
m2 = b - 1
m1 = m2 - 1

a,m1,m2, b, Ms = compareQuartet(a,m1,m2,b, arr1)

#even if figureout the toughtest:

arr2 = [8, 10, 3, 6]

a, m1, m2, b, Ms = compareQuartet(a,m1,m2,b, arr2)


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


function getbounds(a,b,arr)

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
println("aContent,bContent", aContent,bContent)

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
