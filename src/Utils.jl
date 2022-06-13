## TODO: check "all values that currentValue can take" , across its lifespan (from start init till end) #Done 
# Q . Gold Question: Does it reach the end i.e. currentValue = 0 (with safely exit ?) [Yes] (if <0 () change it to it zero)
# [before: does it subtract correctly?] yes 

# how about: updateCurrentValue , no need for extra 
# last currentvalue = 1 -2 = -1 -> convert to 0. on handling: if currentValue == 0 Compare , then init exit sequence 
# to do Compare, check callMiddle first 
#update:
#for stopping:  we're only concerned with the "given interval"  (current outer bounds : points ) 
# #adds currentValue as input 
#Objective: Generalize the Cause-Effect model:
#(now, not only for middle, but for any 'kernel' function )
#the hard part: remove all automatic calls for cause (& effect) 
## Methodology: 
### categorize functions to their usage class: 1. partition () , 2. sort()
## replace every vital necessary un[]
# Novelty: Build a seperate function 'kernelFunction' takes a custom function i.e. middle, a,b, & arr 
## [control the customFunction , Bounds, & original arr 
### Update: oldSchoolSwap (added condition) [assuming do compare [function above ]]

#= 
# Hierarchy of functions, sort(): 
1. oldSchoolSwap: compares 2 numbers  [checked] 
2. doCompare : compares 2 numbers in an object
3. compareTriad , compareQuartet : compares a set of structures 3-points, 4-points accordingly 
4. compareBounds : calls below functions, based on the nature of a given input "points or intervals"
=#
### TODO: ensure to convert functions, above, into Event-driven functions
### Note: the current call hierarchy suggests: 
# the Domino Effect 
#### the correctness of a One function may lead to the  correctness of the one above 
#=However, the Faultiness in any one , may also be reflected in the one above it 
(Assuming: potential scenarios are provided )
=#
#start with the top (3) downwards
### possible issue: potential error in the lower functions: 

#### Completed: boundComparisonCondition
#### Completed: doCompare()
#### completed: compareTriad, compareQuartet
### extra: function frequency
### count number of function calls 
#### Completed: depreciate goleft & goright 

## Issue: with makeVector (reason: v's output is interesting, but erroneous )
## idea: checkCond is calling them 

### the thing : no direction relationship with index 
### solution: look for a higher order function that is calling them 

#= 
Use only a generic _stack , with you pop the next arbitrary interval, 
and redo the same thing on , call kernel function, partition & Sort 

# Correct-Form of view:

view(v, firstindex(v[1]):lastindex(v[length(v)]))

#check all views 

update: euclidDist( bug 
# check all euclidDist values 


=#
#TODO: compareIntervals, recursively 

import Base: @propagate_inbounds
global msg = "Unexpected Error"


function intervalLength(a, b)

    return a + b - 1
end

"""Another variation of intervalLength (): this intervalLength is vaid , under context of sum """
function intervalLength2(a, b)

    return a + b  #- 1
end

#intervalLength(3,1)

euclidDist(a::Int64, b::Int64) = 0 <= a && 0 <= b ? abs(max(a, b) - min(a, b)) + 1 : 0 #+ 1 : 0 #-1 #both a,b > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset
euclidDistDifference(a::Int64, b::Int64) = 0 <= a && 0 <= b ? abs(max(a, b) - min(a, b)) : 0 #+ 1 : 0 #-1 #both a,b > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset

#euclidDist(3, 1)

euclidDist(3, 1) #+ 1 # 1 2 3  #valid value 

#euclidDist(3, 1)


function isEven(a, b) # review#1 corrected: adds offset adjustment #review#2: ; offset = 1 #offset is Independent 

    try
        number = -1

        if a > 0 && b > 0
            number = b + a  # calculates Interval length  #  offset - 1
            number > 0 && number % 2 == 0 ? true : false   #always exists (if conditions apply)

        else
            throw(error("Unexpected value error"))
        end
    catch UnexpectedError
        @error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace) #passing function pointer to catch_backtrace 
    end
end

function isEven(number) # =  #review#2: offset & number are independent 

    isItEven = nothing

    try

        if number > 0 #&& number % 2 == 0 #isEven 
            # number += offset - 1        #  number = number + offset -1  #review#2
            if number % 2 == 0
                isItEven = true
            else
                isItEven = false
            end
        else
            throw(error("not positive error"))
        end

    catch nonPositiveError
        @error "ERROR: input not Positive" exception = (nonPositiveError, catch_backtrace())
    end

    return isItEven
end

function getIsWhole(a::Int64, b::Int64)

    isWhole = isEven(a, b) # sumInterval(a,b) % 2 == 0
    return isWhole

end

function getIsWhole(arr::Array{Int64,1})

    isWhole = firstindex(arr) + lastindex(arr) % 2 == 0
    return isWhole

end
#-----------
#1. get isWhole 
isWhole = getIsWhole(1, 3)

### B: getSubtractedValue
""" either drop 1 from total if isWhole (1 middle), or 2 if not Whole (twinMiddles)"""
function getSubtractedValue(isWhole::Bool)

    try
        subtract = nothing
        if isWhole == true
            subtract = 1

        elseif isWhole == false
            subtract = 2
        else
            throw(error("Unexpected Error Occured"))
        end
        return subtract

    catch UnexpectedError
        @error "Unexpected Error: please check then try again" exception = (UnexpectedError, catch_backtrace())
    end

end

## 2. stoppinng condition 

getSubtractedValue(true)#1
getSubtractedValue(false)#2
#getSubtractedValue

### A:  calcTotalMiddles
function calcTotalMiddles(arr) #name displays what it supposed to do 

    res = length(arr) - 2
    println("init calcTotalMiddles; currentValue (from bound pts to middles left) = length(arr) - 2= ", res)
    # res >=0 ? return res;  : return nothing 
    if res > 0
        return res
    elseif res <= 0
        return 0 # -1 
    end
end

intervalLength(1, 3) #sumInterval(1,3)
#intervalLength2(1,3) Wrong, remove it,Please 

intervalLength(1, 10)

function calcTotalMiddles(a, b) #name displays what it supposed to do 

    res = intervalLength(a, b) - 2
    println("currentValue (from bound pts to middles left)  = intervalLength(a, b) - 2 =", res)
    # res >=0 ? return res;  : return nothing 
    if res > 0
        return res
    elseif res <= 0
        return 0 #-1
    end
end


#--------
"""for a given vector, calculate currentValue"""
#checkCurrentValue!(a, b, currentValue)
#--------
"""before kernel: callMiddle (cause): checks isStop """
#calls checkCurrentValue
global theEnd = false # has only 2 values false or true 
function doInit(a::Int64, b::Int64)

    currentVal = calcVerteciesLeft!(a, b, nothing) # checkCurrentValue!(a, b) #<----
    println("initialized currentValue = ", currentVal)
    return currentVal
end

function initCurrentValue(a::Int64, b::Int64) #vital

    # currentValue = checkCurrentValue!(a, b) #<----
    # println("initialized currentValue = ", currentValue)
    currentVal = doInit(a, b)
    return currentVal
end

#warning not using arr ! the input
function initCurrentValue(arr::Array{Int64,1}) #vital

    a = firstindex(arr)
    b = lastindex(arr)
    # currentValue = checkCurrentValue!(arr)
    currentVal = doInit(a, b)
    return currentVal
end


""" called after function Criteria """ # scaffold #light #Best
function calcVerteciesLeft!(a::Int64, b::Int64, currentValue) # =nothing) # ,formula)

    isWhole = isEven(a, b)
    try
        #  if theEnd == true
        #      return  #true
        # else
        # msg = "Unexpected Error"
        if currentValue === nothing #&& theEnd == false # or ===
            currentValue = calcTotalMiddles(a, b) #initCurrentValue(a, b)  #intervalLength(a, b) - 2 # calcTotalMiddles(arr) # #A()= length(arr) - 2 
        # println("now, currentValue =   ", currentValue)
        elseif currentValue !== nothing #&& theEnd == false # subtract from currentValue (1 or 2 ) , subtract B() 
            #uncomment me 
            # currentValue -= getSubtractedValue(isWhole) #<--------- the issue not one value (same as interval)
            #println("currentVaule = ", currentValue) # = [1, 3] 
            # println("typeof(currrentValue) = ", eltype(currentValue))

            tmp = getSubtractedValue(isWhole)
            currentValue -= tmp
            println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
            println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))

            if currentValue <= 0
                currentValue = 0
                #theEnd = true
                return
            end
        else
            throw(error(msg))
        end

        return currentValue
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end
end
#=
function calcVerteciesLeft!(a::Int64, b::Int64, isWhole::Bool, currentValue=nothing) # ,formula)
    # great subtle error detected 
   # msg = "Unexpected Error"
    try
       # msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = initCurrentValue(a, b)  #intervalLength(a, b) - 2 # calcTotalMiddles(arr) # #A()= length(arr) - 2 
        # println("now, currentValue =   ", currentValue)
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B() 
            currentValue -= getSubtractedValue(isWhole)
            println("currentVaule = ", currentValue) # = [1, 3] #<--------- the issue not one value (same as interval)
            println("typeof(currrentValue) = ", typeof(currentValue))

            println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
            println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))

            if currentValue < 0
                currentValue = 0
            end
        else
            throw(error(msg))
        end
        return currentValue
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end

end
=#

# Custom counter: calcVerteciesLeft! [Erroneous]

""" A custom counter: an event driven, self-decrementing function  
called upon progess with any  Function Criteria )
initialized automatically, since first run, hence it goes at least once 

checks 
""" # scaffold #light #Best
function calcVerteciesLeft!(arr::Array{Int64,1}, currentValue) # ,formula)

    # 
    # msg = "Unexpected Error"
    isWhole = isEven(length(arr))
    try
        # msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = calcTotalMiddles(arr) # #A()= length(arr) - 2  #correct move 
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B() 
            currentValue -= getSubtractedValue(isWhole)
            println("currentVaule = ", currentValue) # = [1, 3] #<--------- the issue not one value (same as interval)
            # println("typeof(currrentValue) = ", typeof(currentValue))

            println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
            # println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))
            if currentValue <= 0 #  the last step 
                currentValue = 0 #-100 #0

            end

            #elseif currentValue == 0 
            #        return currentValue

        else
            throw(error(msg))
        end
        return currentValue
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end

end

function calcVerteciesLeft!(_view::SubArray{Int64,1}, currentValue) # ,formula)

    # 
    # msg = "Unexpected Error"
    isWhole = isEven(length(_view))
    try
        # msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = calcTotalMiddles(_view) # #A()= length(arr) - 2  #correct move 
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B() 
            currentValue -= getSubtractedValue(isWhole)
            println("currentVaule = ", currentValue) # = [1, 3] #<--------- the issue not one value (same as interval)
            # println("typeof(currrentValue) = ", typeof(currentValue))

            println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
            # println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))
            if currentValue <= 0 #  the last step 
                currentValue = 0 #-100 #0

            end

            #elseif currentValue == 0 
            #        return currentValue

        else
            throw(error(msg))
        end
        return currentValue
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end

end

#1 function implementation
#=
function calcVerteciesLeft!(arr::Array{Int64,1}, isWhole::Bool; currentValue) # ,formula)
    # 
   #msg = "Unexpected Error"
    try
       # msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = calcTotalMiddles(arr) # #A()= length(arr) - 2  #correct move 
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B() 
            currentValue -= getSubtractedValue(isWhole)
            println("currentValue = ", currentValue) # = [1, 3] #<--------- the issue not one value (same as interval)
            println("typeof(currrentValue) = ", typeof(currentValue))

            println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
            println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))
            if currentValue <= 0
                currentValue = 0
            end
        else
            throw(error(msg))
        end
        return currentValue
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end

end
=#

#-----testing
currentValue = nothing
arr = [1, 4, 8]
#calcVerteciesLeft! calls calcTotalMiddles
if currentValue === nothing # or ===
    currentValue = calcTotalMiddles(arr) # #A()= length(arr) - 2 
elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B() 
    currentValue -= getSubtractedValue(isWhole)
    println("currentVaule = ", currentValue) # = [1, 3] #<--------- the issue not one value (same as interval)
    println("typeof(currrentValue) = ", typeof(currentValue))

    println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
    println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))
    if currentValue <= 0
        currentValue = 0
    end
end

#correct values were  provided # checked 
#TODO: depreciate 
#
function makeVector(tuple)
    return collect(tuple)
end


#the following does not work (as expected )
#=
function makeView(arr::Array{Int64,1}, range)
    v = @view arr[range]
    return v
end
=#
# make View

function makeView(a, b)
    return view(collect(a:b), a:b)
end

@assert makeView(1:3) == makeView(1, 3)

#-----
### makeExample
#ab[1]:ab[]

1:2

(1:2)[1]
(1:2)[length(1:2)]

(1:2)[1]:(1:2)[length(1:2)]
collect(1:2)

euclidDist(1,3) #3  #TODO: use it for any remap 
euclidDistDifference(1, 3) #TODO: 2 # use it for any remap2  # its context is to subtract 
#i.e. TODO: to be replaced by -(1,3)

#-------
function makeView(ab::UnitRange)#compiles
    a = ab[1]
    b = ab[2]
    println("b = ", b)
    v = collect(a:b)
    return view(v, firstindex(v):lastindex(v))
   # return view(collect(ab), (ab)[1]:(ab)[length(ab)])
end

makeView(1:2)#done 
#=
function makeView(_view::SubArray, range) # Bug # this is not the  the way

    v = @view _view[range]
    return v
end
=#
#Done 


res = makeView(1, 9)
typeof(res)
# in divide conquer: while dividing 
#3 5 becomes 
remap(3, 5)# 1 , 3  

remap2(3, 5) 

#TODO: adjust remap , update: removed +1 #Dome 
function remap(a::Int64, b::Int64) #Bug found # 1 2  abs(max(a, b) - min(a, b)) + 1 ; 2 -1 = 1 + 1 = 2  # <----
    b = euclidDist(a, b) #+ 1 # + 1 #warning you added 1 to the end: recheck new bounds (are all ranges fit) - some got to be out 
    a = 1 #always start at this #or offset 
    return a, b
end
function remap2(a::Int64, b::Int64) #Bug found # 1 2  abs(max(a, b) - min(a, b)) + 1 ; 2 -1 = 1 + 1 = 2  # <----
    b = euclidDistDifference(a, b) #+ 1 # + 1 #warning you added 1 to the end: recheck new bounds (are all ranges fit) - some got to be out 
    a = 1 #always start at this #or offset 
    return a, b
end
#=
function makeView2(_a,_b)
    v = makeVector(_a:_b)
    res = remap(v[1], v[length(v)])
    return view(v, res[1]:length(res))

end

res = makeView2(1,9)
typeof(res)
=#
#------
arr = [1, 4, 8]

currentVal = calcVerteciesLeft!(arr, 2) #true #works (with an arr as input argument) 
currentVal = calcVerteciesLeft!(arr, nothing) #  false # nothing(start):init 
currentVal = calcVerteciesLeft!(arr, currentVal)  #  false # 0 

currentVal = calcVerteciesLeft!(1, 3, nothing) #1 #error  # does not work  #fatal error adds calcTotalMiddles(a,b)#fixed 
currentVal = calcVerteciesLeft!(arr, currentVal) # false 0 

#calcTotalMiddles(arr) #1 middle in a 3 items # true #erroneous use calcVerteciesLeft!
#---- correct 
calcVerteciesLeft!(1, 9, 4) #  # when 1 it returns 0 ( guess: returns )

calcVerteciesLeft!(1, 2, nothing)

v = collect(1:3)
_view = makeView(v, firstindex(v):length(v))
calcVerteciesLeft!(_view, nothing)# 0 # correct 

v = collect(1:2)
_view = makeView(v, firstindex(v):length(v))
calcVerteciesLeft!(_view, nothing)# 0 # correct 

#2. initialize currentValue to nothing 
currentValue = nothing

a = 1
b = 9

#fabricate view from points only 
v = collect(1:9)
_view = view(fi)
makeView(v, 1:9)

calcVerteciesLeft!(a, b, currentValue) # faulty Error

function handleCurrentValue(currentValue)

    if currentValue <= 0 # isStop(currentValue) == 0 #useful for a recursion #check if done 
        #stoppage condition 
        println("currentValue == 0 actual = ", currentValue)
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
#=
function checkCurrentValue!(a::Int64, b::Int64; currentValue) #vital 

    currentValue = calcVerteciesLeft!(a, b, currentValue) # initCurrentValue mot defined 
    #  if currentValue == 0 
    #      return 0
    # end
    return currentValue

end


function checkCurrentValue!(arr::Array{Int64,1}; currentValue) #vital 
    isWhole = isEven(arr) #getIsWhole(arr)
    currentValue = calcVerteciesLeft!(arr, isWhole, currentValue)
    return currentValue
end

""" for a given view, calculate currentValue"""
function checkCurrentValue!(_view::SubArray; currentValue=nothing) # =nothing) #vital 
    isWhole = isEven(arr) # getIsWhole(_view)
    currentValue = calcVerteciesLeft!(_view, isWhole, currentValue)
    return currentValue
end
currentVal = nothing
=#
## from points to vector 
v = collect(1:3)
_view = view(v, firstindex(v): length(v)) #view(v, firstindex(v), length(v)) #v, firstindex(v):length(v))  #makeView(
#currentVal = checkCurrentValue!(_view, currentVal)
#currentVal = checkCurrentValue!(_view, currentVal) # currentValue = 1 # correct #<------

calcVerteciesLeft!(1, 3, nothing) #1 #not correct  #checkCurrentValue!(1,3) #erroneous 
a
b
currentValue
currentValue = calcVerteciesLeft!(a, b, currentValue)



#--------------
## IntervalLength Affects the sum (be careful)
totalLength = intervalLength(1, 3)
#copy(intervalLength(a, b)) #a+b -1 (or euclidDist +1)
sum = totalLength #+ 1 #  this is for euclidDist #removed 1 #Done 

isWhole = isEven(sum)
currentValue = 1
getSubtractedValue(isWhole)
currentValue -= getSubtractedValue(isWhole)
#handleCurrentValue(currentValue)
length([1, 2, 3]) == intervalLength(1, 3) # == 3 #true 
isEven(length([1, 2, 3]))
#isEven(length([1, 2, 3]) + 1) #Rule: in isEven always add 1 to the total length  
#---------

function swapContent(aContent, bContent, arr)#; offset=1) #new! # a,b,indicies in arr  

    contentSwapped = nothing
    #a = findall(x -> x == aContent, arr)
    #a = a[offset]

    #b = findall(x -> x == bContent, arr)
    #b = copy(b[length(b)])   # -offset])
    a = firstindex(arr)
    b = lastindex(arr)

    if aContent > bContent && a < b ##
        arr[a], arr[b] = arr[b], arr[a] #swap
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(arr[a], arr[b], contentSwapped)

    elseif aContent <= bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing 
        contentSwapped = false
        println(arr[a], arr[b], contentSwapped)
    end

    return a, b, contentSwapped #returns index (more practical)
end

function swapContent(aContent, bContent, _view::SubArray)#; offset=1) #new! # a,b,indicies in arr  

    # Hint: what if the there are multiple values ( of the same )
    contentSwapped = nothing
    #a = findall(x -> x == aContent, arr)
    #a = a[offset]

    #b = findall(x -> x == bContent, arr)
    #b = copy(b[length(b)])   # -offset])
    a = firstindex(_view)
    b = lastindex(_view)

    if aContent > bContent && a < b ##
        _view[a], _view[b] = _view[b], _view[a] #swap
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(_view[a], _view[b], contentSwapped)

    elseif aContent <= bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing 
        contentSwapped = false
        println(_view[a], _view[b], contentSwapped)
    end

    return a, b, contentSwapped #returns index (more practical)
end
#---------
""" 
Swaps two items in a vector 


Indices, has to be correctly sorted, as expected 
Additional condition : first input must be lower tham 2nd one 

Note: 
if the first input argument (for the lower bound a) is larger than b 
then swapping indicies has to happen, to ensure the process consistency of this function 


"""
function oldSchoolSwap(a, b, arr::Array{Int64,1}) #a,b,indecies in arr  

    #check left-most bound is lower than right most bound, if not, replace indicies 
    if a > b
        a, b = b, a
    end
    contentSwapped = nothing

    aContent = arr[a]
    bContent = arr[b]
    #_first = nothing
    #_last = nothing

    #comparing contents 
    if aContent > bContent
        arr[a], arr[b] = arr[b], arr[a] #swap
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(arr[a], " ", arr[b], contentSwapped)

    elseif aContent <= bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing 
        contentSwapped = false
        println(arr[a], arr[b], contentSwapped)
    end
    # content evaluation #review#1: maybe unnecessary here 

    # _first = arr[a]
    # _last = arr[b]
    return a, b, contentSwapped  #  _first, _last  #a, b
end

""" 
Swaps two items in a view 


indices, has to be correctly sorted, as expected 
Additional condition : first input must be lower tham 2nd one 

Note: 
if the first input argument (for the lower bound a) is larger than b 
then swapping indicies has to happen, to ensure the process consistency of this function 
"""
function oldSchoolSwap(a, b, _view::SubArray) #a,b,indecies in arr  

    #check left-most bound is lower than right most bound, if not, replace indicies 
    if a > b
        a, b = b, a
    end
    contentSwapped = nothing

    aContent = _view[a]
    bContent = _view[b]
    #_first = nothing
    #_last = nothing

    #comparing contents 
    if aContent > bContent
        _view[a], _view[b] = _view[b], _view[a] #swap
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(_view[a], " ", _view[b], contentSwapped)

    elseif aContent <= bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing 
        contentSwapped = false
        println(_view[a], " ", _view[b], contentSwapped)

        #  elseif aContent == bContent
        #personal preference solution , the first one close to lower bound  is at first 
        #a < b always! but here, we are assuming the assumption was not ta
        #if a < b
        #arr[a], arr[b] = arr[a], arr[b] #do nothing 
        #     contentSwapped = false
        #     println(_view[a]," " ,_view[b], contentSwapped)

        #= elseif a > b #swap 
            arr[a], arr[b] = arr[b], arr[a] #ture 
            contentSwapped = true
            println(arr[a], arr[b], contentSwapped)

        else #do nothing or 
            # throw(error("Unexpected Error ))
        end =#
    end
    # content evaluation #review#1: maybe unnecessary here 

    # _first = arr[a]
    # _last = arr[b]
    return a, b, contentSwapped  #  _first, _last  #a, b
end
#--------
euclidDist(a, b) #1
b
euclidDist(a, b)
v = collect(a:b)
#remap 
#return 
view([1, 2, 3, 4, 5], 1:5)
view(v, firstindex(v):lastindex(v)) #Correct-Form # ==view(v, remap(a, b)) 
# view(v, remap(a, b)) #v[length(v)])
#end
euclidDistDifference(1, 1)
euclidDistDifference(a, b)
a
b
(m2 + 1, b - 1)

### Patch for doCompare


function getLastElement(a, b)

    if euclidDistDifference(a, b) == 0 #1 #0
        return
    else
    
        #remap TODO: remap true form 
        #return view(v, remap(a, b)) #v[length(v)])
        
        v = collect(a:b) #+1)
        return view(v, firstindex(v):lastindex(v)) #not view(v, firstindex(v), lastindex(v))
    end
end

function getLastElement2(a, b) #
    if euclidDistDifference(a, b) == 0 #1 #0
        return -1, -1, nothing
    else
        v = collect(a:b) #+1)
        
        return view(v, firstindex(v): lastindex(v))
    end
end

#-----------
## comparing two indicies, in a view 
#index, value space  [vital]
@inline function doCompare(a, b, _view::SubArray)

    _length = copy(length(_view)) #ok 
    if a < _length && b < _length && a >= 0 && b >= 0
        # aContent = _view[a] #view(_view, a) #arr[a]
        ``#   bContent = _view[b] #view(_view, b) #arr[b]
    
        contentSwapped = nothing
    
        #  if aContent > bContent # arr[a] > arr[b]
        v = collect(a, b)# collect(a, b + 1) #
    
        _view = view(v, firstindex(v), lastindex(v)) #<------------------
        a, b, contentSwapped = oldSchoolSwap(a, b, _view) # # swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap 
       
        #a, b = oldSchoolSwap(a, b, _view) 
        # contentSwapped = true   #arr[a], arr[b]
    
        #  elseif aContent > bContent
        #do nothing 
        #  contentSwapped = false
        #  end
        return a, b, contentSwapped
    elseif a == _length || b == _length # last step 
        return getLastElement2(a, b)
    
    end
end

#index, value space  [vital]
@inline function doCompare(a, b, arr::Array{Int64,1}) #works 

    #[1...8] length = 8+1 -1 = 8 

    _length = copy(length(arr))

    if a < _length && b < _length &&  a >= 0 && b >= 0 # && b >= m2 # if a <= _length && b <= _length 
        # aContent = arr[a] #<-------
        # bContent = arr[b]


        contentSwapped = nothing
        # try
        # Base.@propagate_inbounds 
        # if aContent > bContent # arr[a] > arr[b] n# <--- critial decision 
        #Base.@propagate_inbounds  
        a, b, contentSwapped = oldSchoolSwap(a, b, arr) #swapContent(arr[a], arr[b], arr)  #an inbounds swap #actual array swap 
        #    contentSwapped = true   #arr[a], arr[b]
        println("at index a = ", a, " b = ", b, ", aContent = ", arr[a], " , bContent = ", arr[b])
        #Base.@inbounds 
        #TODO: situation where both contents are equal # current: do nothing 
        # elseif 

        # elseif aContent <= bContent  # arr[a] < arr[b] #review#1 #<----- # includes bothContents are equal 
        #don't swap # return values  
        #  return 
        #    contentSwapped = false #arr[a], arr[b]
        #@inbounds a[st], a[ed] = a[st] , a[ed]        #an inbounds swap 

        #  elseif aContent == bContent # arr[a] == arr[b] #contents the same Can increase the count (in a dictionary?) 
        #a<b Always
        #   if a < b
        #     contentSwapped = false  #arr[a], arr[b]
        #do nothing 
        #else? 
        #end
        #catch UnexpError #<--- exception: Caught: check for euclidDist above the scope of this function 
        #    @error "ERROR:UnexpError " exception = (UnexpError, catch_backtrace())
        #end
        return a, b, contentSwapped #arr[a], arr[b]

    elseif a == _length || b == _length
        return getLastElement2(a, b)

    end
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
oldSchoolSwap(1, 2, arr)
oldSchoolSwap(5, 6, arr)
#additional condition : first input must be lower tham 2nd one 
oldSchoolSwap(6, 5, arr)
arr
arr

arr[length(arr)]

# compare Triad & Quartet
#---------
function compareTriad(a, m1, b, arr::Array{Int64,1})

    try
        # if arr[a] > arr[b]
        a, b, _isSwapped = doCompare(a, b, arr)
        println("twinMiddles [a, b]= ", a, " ", b, " checked ")
        # end
        #  if arr[a] > arr[m1]
        a, m1, _isSwapped = doCompare(a, m1, arr)
        println(" [a, m1]= ", a, " ", m1, " checked ")
        #  end
        # if arr[m1] > arr[b]
        m1, b, _isSwapped = doCompare(m1, b, arr)
        println(" [a, m1]= ", m1, " ", b, " checked ")
        #  end
        #=
                a, b, _isSwapped = doCompare(a, b, arr)#view(arr, a:b)) #compare bounds
                a, m1, _isSwapped = doCompare(a, m1, arr) #view(arr, a:m1))

                #no need for remap, (context: arr is giiven, & not altered in this one - remap not needed at all )
                m1, b, _isSwapped = doCompare(m1, b, arr) #view(arr, m1:b))
        =#
        # push!(Middles, m1)
        println("a, m1, b = ", a, " ", m1, " ", b)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end

function compareTriad(a, m1, b, _view) #applied remap

    try
        #a=0;m1 =0;m2=0;b=0;
        _isSwapped = nothing
        if _view[m1] > _view[b]
            m1, m2, _isSwapped = doCompare(m1, b, _view)
            println("twinMiddles [m1, m2]= ", m1, " ", m2, " checked ")
        end
        if _view[a] > _view[b]
            a, b, _isSwapped = doCompare(a, b, _view)
            println(" [a, b]= ", a, " ", b, " checked ")
        end
        if _view[a] > arr[m1]
            a, m1, _isSwapped = doCompare(a, m1, _view)
            println(" [a, m1]= ", a, " ", m1, " checked ")
        end
        #=
        a, b, _isSwapped = doCompare(a, b, view(_view, a:b)) #compare bounds' content
        a, m1, _isSwapped = doCompare(a, m1, view(_view, a:m1))

        m1, b = remap(m1, b)
        println("@view: m1, b = ", m1, b)
        m1, b, _isSwapped = doCompare(m1, b, view(_view, m1:b)) #<------- remap is required 
        =#

        #push!(Middles, m1)
        println("a, m1, b = ", a, m1, b)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end
#---------
## Comparing Four numbers, in a vector 

""" input vector array , applys view  on each Interval """
function compareQuartet(a, m1, m2, b, arr::Array{Int64,1}) #<-------- input expecting indicies 

    try
        twinMiddles = nothing

        # apply view(arr, a:b)
        #=
            compareQuartet(a, m1, m2, b, arr)
        =#

        #  if arr[m1] > arr[b]
        m1, b, _isSwapped = doCompare(m1, b, arr)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")
        #  end
        #  if arr[a] > arr[b]
        a, b, _isSwapped = doCompare(a, b, arr)
        println(" [a, b]= ", a, " ", b, " swapped ")
        #  end
        # if arr[a] > arr[m1]
        a, m1, _isSwapped = doCompare(a, m1, arr)
        println(" [a, m1]= ", a, " ", m1, " swapped ")
        #  end

        # println("a, m2, b = ", a, m2, b)
        # if arr[m2] > arr[b]
        m2, b = doCompare(m2, b, arr)  #view(arr, m2:b)) #<------
        # end
        #m2, b, _isSwapped = doCompare(m2, b, view(arr, m2:b))

        twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", m1, " ", m2)
        # push!(Middles, twinMiddles) #TODO: push each _isSwapped to swapped[] vector, as well 
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ? #no this is much practical
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end

""" input vector array , applys view  on each Interval """
function compareQuartet(a, m1, m2, b, _view::SubArray)

    try
        println("entering compareQuartet")
        #  twinMiddles = nothing

        # apply view(arr, a:b)
        #=
            compareQuartet(a, m1, m2, b, arr)
        =#
        #   m1, m2, _isSwapped = doCompare(m1, m2, view(_view, m1:m2)) #compare twinMiddles' content 

        #   a, b, _isSwapped = doCompare(a, b, view(_view, a:b)) #compare bounds' content

        #   a, m1, _isSwapped = doCompare(a, m1, view(_view, a:m1))

        #  if _view[m1] > _view[b]
        m1, b, _isSwapped = doCompare(m1, b, _view)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")
        #  end
        #  if _view[a] > _view[b]
        a, b, _isSwapped = doCompare(a, b, _view)
        println(" [a, b]= ", a, " ", b, " swapped ")
        #  end
        #  if _view[a] > _view[m1]
        a, m1, _isSwapped = doCompare(a, m1, _view)
        println(" [a, m1]= ", a, " ", m1, " swapped ")
        #  end
        #m2, b = remap(m2, b)
        # println("a, m2, b = ", a, m2, b)
        #  if _view[m2] > _view[b]
        m2, b = doCompare(m2, b, _view)  #view(arr, m2:b)) #<------
        #  end


        #=  m2, b = remap(m2, b)
          println(" m2,b = ", m2, b)
          m2, b = doCompare(m2, b, view(_view, m2:b))=#


        #twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", [m1, m2])
        #        push!(Middles, twinMiddles)
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ?
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end

#TODO: exmperimental compareQuartet with no input argumrnt view , returns view 

#unused functions
#unused 
""" called after compare Quartet """
function remapCompare(m2, b, _view::SubArray)

    m2, b = remap(m2, b)
    println(" m2,b = ", m2, b)
    m2, b = doCompare(m2, b, view(_view, m2:b))

end
#---------
@propagate_inbounds function middle(a::Int64, b::Int64) # b  + a -1  # Acceptable #review#2 ; offset = 1 #rule-found: offset only used in an array (at its start)

    try
        _sum = sumInterval(a, b)  #    b + a - 1  # distance between them  <---- Error 
        println("a , b =", a, " ", b)
        println("sum = ", _sum)
        isItEven = isEven(_sum)# #even is a proxy for divisibility # TODO: surround by a copy()  #homeMade Heuristic  <------
        println("iseven  = ", isItEven)
        mid = _sum / 2 #  -1  # precalculate mid (_sum /2 )  #Float32(64)
        println("mid( sum / 2) = ", mid)

        # isWhole = getIsWhole(arr) # uncommentMe if everything else not working 

        if isItEven == true
            # 1 middle calculate 
            println("Even = ", isItEven)
            mid = Int(mid) #Int 
            println("Rational mid(index)= ", mid)
            # isWhole = true
            println("isItEven = ", isItEven)

            return mid, mid + 1, isItEven

        elseif isItEven == false
            # calculate fractionalMid 
            println("Even = ", isItEven)
            println("fractionalMiddle, twinMiddles ")
            lower = -1
            upper = -1
            lower = Int(floor(mid))
            upper = Int(ceil(mid))
            # isWhole = false
            println("lower = ", lower)
            println("upper = ", upper)
            println("isItEven = ", isItEven)

            return lower, upper, isItEven # the differenece is still 1, only way to discriminate is by using isWhole 
        else
            throw(error("Unexpected error occured")) #<-------
        end

    catch UnexpectedError #errors out 
        @error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end
end

middle(1, 3)
#---------

"""calls middle on bounds a,b then calls cause( & effect model) for a vector"""
@propagate_inbounds function callMiddle!(a::Int64, b::Int64, arr::Array{Int64,1})

    try
        # Reviewr#2: removed distance() should be here ( distance is only in isStop )
        #distance = euclidDistDifference(a,b) # response = isStop(a, b, arr)

        if a != b && a > 0 && b > 0 # only condition we require 
            #contentSwapped = []  #nothing
            # _isSwapped = nothing
            m1, m2, isWhole = middle(a, b) #gets middle of a length (in rational positive integer ) <---ERROR: no iterate(Nothing)
            #TOOO: do sth different from middle(a,b)
            cause(a, b, arr)
            # if a !=b 

            #  doCompare()
            #compareTriad / compareQuartet 
            #code
            #optimization: Q.do we use euclidDist between verticies: a, m1, m2, b ? A. Possible; at this point: further processing is not necessaily needed, as of result 
            #review2: comment: euclidDist won't come alone, but with isNotDivide: better yet is, after finished handling Ms, contentSwapped, call explore (that has all desired functions)

            # return [a, b], 
            #return m1, m2
            #return [m1,m2]
            # return [m1, m2]
            return m1, m2, isWhole  # lastindex(contentSwapped): min= 0, max=4 #edited!

        #return a, m1, m2, b #indices (practical) # Q. shouldn't we return their content (no, unless we're working with some `DataStructure` i.e. trees, where content is necessary to be read )

        elseif a == b # 1, 1 , arr #singleton 
            #register as a leaf (binTree)
            return 0, 0, nothing # 0, 0, 0 # depends on Expected return return

        else
            throw(error("UnexpectedError occured"))
        end
    catch UnexpectedError
        @error "UnexpectedError occured" exception = (UnexpectedError, catch_backtrace())
    end
end
#middle(1,3)
#cause(1,3,[1,2,3]) #finished successfully (?)
#depreciate
@propagate_inbounds function callMiddle!(a::Int64, b::Int64, _view)#::SubArray)

    try
        # Reviewr#2: removed distance() should be here ( distance is only in isStoppingCondition )
        #distance = euclidDistDifference(a,b) # response = isStop(a, b, arr)

        if a != b && a > 0 && b > 0 # only condition we require 
            #contentSwapped = []  #nothing
            # _isSwapped = nothing
            m1, m2, isWhole = middle(a, b) #gets middle of a length (in rational positive integer ) <---ERROR: no iterate(Nothing)

            #check
            v = makeVector((a:b))
            view1 = makeView(v, firstindex(v):length(v))
            # v = makeVector((1:3))
            # _view = makeView(v, firstindex(v):length(v))
            #view1 = view(_view, a, b)

            #cause(a, b, view(_view, a, b)) dice the Interval
            cause(a, b, view1)
            # if a !=b 

            #  doCompare()
            #compareTriad / compareQuartet 
            #code
            #optimization: Q.do we use euclidDist between verticies: a, m1, m2, b ? A. Possible; at this point: further processing is not necessaily needed, as of result 
            #review2: comment: euclidDist won't come alone, but with stoppingCondition: better yet is, after finished handling Ms, contentSwapped, call explore (that has all desired functions)

            # return [a, b], 
            #return m1, m2
            #return [m1,m2]
            # return [m1, m2]
            return m1, m2, isWhole  # lastindex(contentSwapped): min= 0, max=4 #edited!

        #return a, m1, m2, b #indices (practical) # Q. shouldn't we return their content (no, unless we're working with some `DataStructure` i.e. trees, where content is necessary to be read )

        elseif a == b # 1, 1 , arr #singleton 
            #register as a leaf (in a binTree)
            return 0, 0, nothing # 0, 0, 0 # depends on Expected return return

        else
            throw(error("UnexpectedError occured"))
        end
    catch UnexpectedError
        @error "UnexpectedError occured" exception = (UnexpectedError, catch_backtrace())
    end
end


function isStoppingCondition(a::Int64, b::Int64, currentValue) #vital

    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function 
    println("isStoppingCond...  currentValue passed")
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = calcVerteciesLeft!(a, b, currentValue) #checkCurrentValue!(a, b, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    return currentValue #handleCurrentValue(currentValue)


end

"""after kernel function: callMiddle: checks  """ #input: 3 numbers 

function isStoppingCondition(a::Int64, b::Int64, currentValue) #vital #practical #adds currentValue as input 
    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function 

    currentValue = calcVerteciesLeft!(a, b, currentValue) #checkCurrentValue!(a, b, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    #calcUnexplored
    return currentValue #handleCurrentValue(currentValue)

end

function isStoppingCondition(arr::Array{Int64,1}, currentValue) # =2::Int64) #vital
    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function 

    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = calcVerteciesLeft!(arr, currentValue)  #checkCurrentValue!(arr, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    return currentValue  #handleCurrentValue(currentValue)

end

function isStoppingCondition(_view::SubArray, currentValue) #vital
    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function 


    #  currentValue = checkCurrentValue!(_view, currentValue)    #checkCurrentValue!(_view, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)
    currentValue = calcVerteciesLeft!(_view, currentValue)
    #calcUnexplored
    return currentValue # handleCurrentValue(currentValue)

end

#kernel #is passed 
#isStoppingCondition #is passed (either stop, or continue)

#---------
# scaffolding function 
"""sum of indicies""" #scaffold
sumInterval(a::Int64, b::Int64) = a > 0 && b > 0 ? abs(b) + abs(a) : 0


#----
#=
remap(1, 10) #missing 1 at last  +1 #fixed 
remap(5, 10) # correct 


#requires compareQuartet, compareTriad 
#a ::Int64, m1::Int64, m2::Int64, b::Int64, ::Bool, ::Vector{Int64})
function checkCond(a::Int64, m1::Int64, m2::Int64, b::Int64, arr::Array{Int64,1})
    isWhole = copy(getIsWhole(arr))

    if isWhole == true

        #m region  
        #compare content (of 3-Fractal: a, m, b )

        compareTriad(a, m1, b, _view) #ok #issue: arr [should be view ] #hillarious : was b1 instead of b    #compareTriad(..,_view)
        newView = view(_view, a:m1)
        println("CheckCond(): isWhole ==True, a = ", a, " m1= ", m1, " newView = ", newView)
        #Ideal return newView 
        # goleft!(a, m1, newView) # middle om am Interval  #using subview  #was a,m1 #<----- then here (first left I see a:m1 the same i.e )

        #remap is required 
        m1, b = remap(m1, b) #pts remap 
        print("remapping m1, b = ", m1, b)

        # view2 = view(_view, m1:b) #issue: building proper view - subarray of an array #was m1,b
        # goright!(view(_view, m1:b)) # middle om am Interval 

    elseif isWhole == false
        compareQuartet(a, m1, m2, b, _view) #compare arr values at 4 index points: a,m1,m2,b  #ok
        #view1 = view(arr, a:m1) #correct result 
        #Index changes: need for Remapping: m2, b 
        #b- m2 #difference 
        #the fix for the following view: 
        m2, b = remap(m2, b) #done
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #b -= 1
        # b = euclidDistDifference(m2, b) #+1 
        # m2 = 1
        view2 = view(_view, m2:b)

        goleft!(view(_view, a:m1)) #go left iteratively #
        # goright!(view2) ##go left iteratively # 

        goright!(view2, remap(m2, b))
    end
end

## Idea: traverse using _stack; Q. is traverse ready?
""" check condition, for a particular _view"""
function checkCond(a::Int64, m1::Int64, m2::Int64, b::Int64, isWhole::Bool, arr::Array{Int64,1}) #is there a way to convert view to arr  

    if isWhole == true
        #m region  
        #compare content (of 3-Fractal: a, m, b )

        compareTriad(a, m1, b, arr) #ok #issue: arr [should be view ] #hillarious : was b1 instead of b    #compareTriad(..,_view)

        #Do:
        #view1 = view(arr, a:m1) #correct result 
        #view2 = view(arr, m1:b) #unneeded 
        #effect(a, m1, _view) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m1, b, view2) #<---------- # 3:5
        #to go left: fix a, decrease b #(but we start with a:m1) -  verified 
        newView = view(arr, a:m1)
        println("CheckCond(): isWhole ==True, a = ", a, " m1= ", m1, " newView = ", newView)

        #        goleft!(a, m1, newView) #using subview  #was a,m1 #<----- then here (first left I see a:m1 the same i.e )#depreciate

        #remap required 
        m1, b = remap(m1, b)
        print("remapping m1, b = ", m1, b)

        # view2 = view(_view, m1:b) #issue: building proper view - subarray of an array #was m1,b
        goright!(view(arr, m1:b))

    elseif isWhole == false
        #check bounds  compare content: (of 4-Fractal: a,m1,m2,b )
        #2 middles become one  a ... m1 nc, m1 m2 =1 (n/A) m2 b1
        #should be                  m1  nc, d(m1 m2)=0 m1-m2=0  (m2 loses its previous position to become 1 with m1 )
        # 5 6   7 8 9 
        # (5 6) 7 8 9 #  [-1 ]
        #5 nc 6 7 8 
        #2. length -= 1  
        # remapForm1m2 


        compareQuartet(a, m1, m2, b, arr) #compare arr values at 4 index points: a,m1,m2,b  #ok
        #view1 = view(arr, a:m1) #correct result 
        #Index changes: need for Remapping: m2, b 
        #b- m2 #difference 
        #the fix for the following view: 
        m2, b = remap(m2, b) #done
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #b -= 1
        # b = euclidDistDifference(m2, b) #+1 
        # m2 = 1
        view2 = view(arr, m2:b) #issue: building proper view - subarray of an array  #<----------------error  #was m2,b
        #TODO: handle interval m1,m2 as well (for completeness: we got to compare all vertex intervals )


        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m2, b, view2) #<---------- # 3:5

        goleft!(view(arr, a:m1)) #go left iteratively #
        # goright!(view2) # goright!(m2, b, view(view2, m2:b)) #go right iteratively #<---------

        #goright!(view2) ##go left iteratively # 

        goright!(view2, remap(m2, b))
    end

end

function checkCond2(a::Int64, m1::Int64, m2::Int64, b::Int64, isWhole::Bool, _view::SubArray) #is there a way to convert view to arr  

    if isWhole == true
        #m region  
        #compare content (of 3-Fractal: a, m, b )

        compareTriad(a, m1, b, _view) #ok #issue: arr [should be view ] #hillarious : was b1 instead of b    #compareTriad(..,_view)

        #Do:
        #view1 = view(arr, a:m1) #correct result 
        #view2 = view(arr, m1:b) #unneeded 
        #effect(a, m1, _view) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m1, b, view2) #<---------- # 3:5
        #to go left: fix a, decrease b #(but we start with a:m1) -  verified 
        # newView = view(_view, a:m1)
        println("a = ", a, " m1= ", m1, " newView = ", newView)

        goleft!(a, m1, newView) #using subview  #was a,m1 #<----- then here (first left I see a:m1 the same i.e )

        #remap required  # not required: not under this context  
        m1, b = remap(m1, b)
        print("m1, b = ", m1, b)

        # view2 = view(_view, m1:b) #issue: building proper view - subarray of an array #was m1,b
        # effect(m1, b, view(_view, m1:b)) #isStoppingCondition() #TODO: requires: currentValue
        return m1, b, isWhole
    elseif isWhole == false
        #check bounds  compare content: (of 4-Fractal: a,m1,m2,b )
        #2 middles become one  a ... m1 nc, m1 m2 =1 (n/A) m2 b1
        #should be                  m1  nc, d(m1 m2)=0 m1-m2=0  (m2 loses its previous position to become 1 with m1 )
        # 5 6   7 8 9 
        # (5 6) 7 8 9 #  [-1 ]
        #5 nc 6 7 8 
        #2. length -= 1  
        # remapForm1m2 


        compareQuartet(a, m1, m2, b, _view) #compare arr values at 4 index points: a,m1,m2,b  #ok
        #view1 = view(arr, a:m1) #correct result 
        #Index changes: need for Remapping: m2, b 
        #b- m2 #difference 
        #the fix for the following view: 
        m2, b = remap(m2, b) #done
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #b -= 1
        # b = euclidDistDifference(m2, b) #+1 
        # m2 = 1
        #  view2 = view(_view, m2:b) #issue: building proper view - subarray of an array  #<----------------error  #was m2,b
        #TODO: handle interval m1,m2 as well (for completeness: we got to compare all vertex's intervals )


        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m2, b, view2) #<---------- # 3:5

        #  goleft!(view(_view, a:m1)) #go left iteratively # Redundant 
        #  goright!(view2) # goright!(m2, b, view(view2, m2:b)) #go right iteratively #<---------

        # effect(m2, b, view(_view, m2:b))
        return m2, b, isWhole
    end

end

function checkCond2(a::Int64, m1::Int64, m2::Int64, b::Int64, _view::SubArray) #is there a way to convert view to arr  

    isWhole = getIsWhole(a, b)

    if isWhole == true
        #m region  
        #compare content (of 3-Fractal: a, m, b )
        compareTriad(a, m1, b, _view) #ok #issue: arr [should be view ] #hillarious : was b1 instead of b    #compareTriad(..,_view)

        #Do:
        #view1 = view(arr, a:m1) #correct result 
        #view2 = view(arr, m1:b) #unneeded 
        #effect(a, m1, _view) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m1, b, view2) #<---------- # 3:5
        #to go left: fix a, decrease b #but we start with a:m1 - interval is verified 
        # newView = view(_view, a:m1)
        println("a = ", a, " m1= ", m1, " newView = ", view(_view, a:m1))

        #        goleft!(a, m1, newView) #using subview  #was a,m1 #<----- then here (first left I see a:m1 the same i.e )

        #remap required 
        m1, b = remap(m1, b)

        print("m1, b = ", m1, b, view(_view, m1:b))

        # view2 = view(_view, m1:b) #issue: building proper view - subarray of an array #was m1,b
        # effect(m1, b, view(_view, m1:b)) #isStoppingCondition() #TODO: requires: currentValue
        return m1, b, isWhole
    elseif isWhole == false
        #check bounds  compare content: (of 4-Fractal: a,m1,m2,b )
        #2 middles become one  a ... m1 nc, m1 m2 =1 (n/A) m2 b1
        #should be                  m1  nc, d(m1 m2)=0 m1-m2=0  (m2 loses its previous position to become 1 with m1 )
        # 5 6   7 8 9 
        # (5 6) 7 8 9 #  [-1 ]
        #5 nc 6 7 8 
        #2. length -= 1  
        # remapForm1m2 


        compareQuartet(a, m1, m2, b, _view) #compare arr values at 4 index points: a,m1,m2,b  #ok
        #view1 = view(arr, a:m1) #correct result 
        #Index changes: need for Remapping: m2, b 
        #b- m2 #difference 
        #the fix for the following view: 
        m2, b = remap(m2, b) #done
        print("m1, b = ", m2, b, view(_view, m2:b))
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #b -= 1
        # b = euclidDistDifference(m2, b) #+1 
        # m2 = 1
        #  view2 = view(_view, m2:b) #issue: building proper view - subarray of an array  #<----------------error  #was m2,b
        #TODO: handle interval m1,m2 as well (for completeness: we got to compare all vertex intervals )


        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m2, b, view2) #<---------- # 3:5

        #  goleft!(view(_view, a:m1)) #go left iteratively # Redundant 
        #  goright!(view2) # goright!(m2, b, view(view2, m2:b)) #go right iteratively #<---------

        # effect(m2, b, view(_view, m2:b))
        return m2, b, isWhole
    end

end

#---------
#TODO: make cause!

function goleft!(a::Int64, b::Int64, arr::Array{Int64,1}) #compiles correctly #todo: update a,b

    #to go left: fix a, decrease b
    # effect(a, b, arr)
    #a!=b ? 
    #eval cause once on original vector array
    #a = firstindex(arr)
    # b = lastindex(arr)
    cause(a, b, arr) #we can keep it as it 

    # cause(a, b, view(arr, a, b))

    #build a view 
    checkLeftCondition(arr)
    #=
    if a != b  #<-----------
        #a != b ? cause(a, b, arr) : endAlgorithmSafely(arr) # return

        #a is the same 
        #q. can i get away without remapping here? NO # Yes! (reason remap: is not  for arr )
  #      b = b - 1 #update b #ok
     #   a, b = remap(a, b) #after remap 

        #b = euclidDistDifference(a, b) + 1
        #a = 1 #always start at this
       # #newView = view(arr, a, b) #update view  #was b-1 #ok got remapped
        #isStop() here 

        b - a > 1 ? goleft!(firstindex(view(arr, a, b)), lastindex(view(arr, a, b)), view(arr, a, b)) : endAlgorithmSafely(view(arr, a, b))
        #  b - a > 1 ? goleft!(a, b, view(arr, a, b)) : endAlgorithmSafely(view(arr, a, b)) # return #was b - 1 #it's remapped #Q. why play with intervals manually?

    else #a ==b i.e. scalar value 
        #endAlgorithmSafely(arr) 
        endAlgorithmSafely()    #action: return only 
    end
    =#
end

function goleft!(a::Int64, b::Int64, _view) #compiles correctly #todo: Update a,b

    #to go left, fix a, decrease b

    # call cause on original view once 
    cause(a, b, _view)

    # cause(a, b, view1) #: endAlgorithmSafely(view1) # return
    # checkLeftCondition(_view)  #unneeded

    #b-a >0 #b-a>1 
end

function goleft!(_view::SubArray)
    a = firstindex(_view)
    b = lastindex(_view)

    cause(a, b, _view)
    # checkLeftCondition(_view) #unneeded

end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
=#
#------------
# custom Kernel functions 
function kernel(a, b, consumedFunction)

    return consumedFunction(a, b)
end

function kernel(a, b, consumedFunction)

    return consumedFunction(a, b)
end

function kernel(a, b, arr::Array{Int64,1}, consumedFunction)

    return consumedFunction(a, b, arr)
end

#_view
function kernel(a, b, _view::SubArray, consumedFunction)

    return consumedFunction(a, b, _view)
end

view(v, v)
kernel(a, b, view(v, v), middle!)
#kernel(a, b, arr, middle!)
#------------# infinite loop (no StackOverflowError)
#=
#experimental passing consumed function as input argument parameter # calling kernel in the body
function cause(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    currentValue = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    condition = handleC-urrentValue(currentValue)
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, arr, consumedFunction) #middle)
        #callMiddle!(a, b, arr) # arr) #TODO: replace with middle + isEven
        checkCond(a, m1, m2, b, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end
=#

#preferred
function cause(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    currentValue = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    condition = handleCurrentValue(currentValue)
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, arr, consumedFunction) #, middle)
        #callMiddle!(a, b, arr) # arr) #TODO: replace with middle + isEven
        checkCond(a, m1, m2, b, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end

#TODO: t 
#preferred
function cause(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, arr) #, middle)
        #callMiddle!(a, b, arr) # arr) #TODO: replace with middle + isEven
        checkCond(a, m1, m2, b, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end

function cause(a::Int64, b::Int64, _view::SubArray, kernel) #in: _view  #uses view #error #no isStop(a,b,view) ==false 

    ##if isStop(a, b, view) == false # continue processing  #callMiddle #checkCond #sub-interval #UncommentMe
    #isStop(a, b, view) #Error here
    #isStop(a, b, view(collect(a:b), a:b))
    condition = isStoppingCondition(arr, currentValue) #(a, b, _view) #isstop(a, b, _view) #depreciate this  #TODO Questiona: change it ?

    if condition == true # the actual utility of function #out: view : arr , a:b 
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        #kernel function = callMiddle!(a,b,arr )
        # return callMiddle(a, b) # m1,m2,isWhole 
        #       v = makeVector((a:b)) # overdone 
        #_view = makeView(arr,v)
        #        _view = makeView(_view,v)

        m1, m2, isWhole = kernel(a, b, _view) # arr) #new range new middle #<------------

        #--------
        # a,b remapping
        #no need, in this context 
        #why: the bounds a,b haven't been updated
        #--------
        checkCond(a, m1, m2, b, isWhole, _view) #includes: compare values #<----
        return m1, m2, isWhole #TODO: continue logic

    end

    #m1,m2,isWhole = callMiddle() #checkCond(a,m1,m2,b,view) #is it acceptable to pass it a view?
end

function cause(a::Int64, b::Int64, _view::SubArray, kernel) #in: _view  #uses view #error #no isStop(a,b,view) ==false 

    ##if isStop(a, b, view) == false # continue processing  #callMiddle #checkCond #sub-interval #UncommentMe
    #isStop(a, b, view) #Error here
    #isStop(a, b, view(collect(a:b), a:b))
    condition = isStoppingCondition(arr, currentValue) #(a, b, _view) #isstop(a, b, _view) #depreciate this  #TODO Questiona: change it ?

    if condition == true # the actual utility of function #out: view : arr , a:b 
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        #kernel function = callMiddle!(a,b,arr )
        # return callMiddle(a, b) # m1,m2,isWhole 
        #       v = makeVector((a:b)) # overdone 
        #_view = makeView(arr,v)
        #        _view = makeView(_view,v)

        m1, m2, isWhole = kernel(a, b, _view) # arr) #new range new middle #<------------

        #--------
        # a,b remapping
        #no need in this context 
        #why: the bounds a,b haven't been updated
        #--------
        checkCond(a, m1, m2, b, isWhole, _view) #includes: compare values #<----
        return m1, m2, isWhole #TODO: continue logic

    end

    #m1,m2,isWhole = callMiddle() #checkCond(a,m1,m2,b,view) #is it acceptable to pass it a view?
end

view(collect(a:b), (a:b))
#cause(a, b, view(collect(a:b), a:b), middle) #TODO:uncomment Me

#currentValue
# init
#before first cause, call init 
function cause(a::Int64, b::Int64, arr::Array{Int64,1})#, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #(a, b, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = callMiddle!(a, b, arr) # arr)
        checkCond(a, m1, m2, b, isWhole, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end
#strategy pass-in an arr, for now  #
#---------
#start 
# let ar1 be a view , subarray of the main a,b = 1,9
ar1 = [1, 3]
length(ar1) - 2 # should be 0 (special case: ending make it 1 so that if is checked 1 more time )
firstindex(ar1)
firstindex(ar1) - (length(ar1) - 2) # 1 (1 middle left)
currentValue = nothing
#currentValue = initCurrentValue(arr) # 1 #correct
#currentValue = initCurrentValue(ar1[1], ar1[2]) # 1 i.e.  #correct 
calcVerteciesLeft!(ar1[1], ar1[2], currentValue) # 1 
numMiddles = currentValue # 1 #FYI 

stopFlag = isStoppingCondition(a, b, currentValue) #correct 
stopFlag = isStoppingCondition(a, b, 2) #when currentValue>1 should be false 
#callMiddle!
#m1, m2, isWhole = middle(ar1[1], ar1[2]) # callMiddle!(firstindex(ar1), lastindex(ar1), ar1) #should be true #true  # odd members have an actual middle 
#isWhole = getIsWhole(ar1[1],ar1[2])
#stopFlag = isStoppingCondition(a, b, ar1) #<------- KNOWN ISSUE (checkVerticiesLeft) # logic Discrepency either ar1, nothing or a,b,nothing (not both)
#subtle discripence : check both flows 
stopFlag = isStoppingCondition(a, b, nothing)
stopFlag = isStoppingCondition(ar1, nothing) # we're only concerned with the given interval 

#update currentValue 


#todo: remapping function from indicies to values 
#checkCond(1, m1, m2, 3, isWhole, [1, 2, 3]) #deprecate



#Rule: cause must always get the updated a & b (of the current view )

function cause(a::Int64, b::Int64, _view::SubArray) #in: _view  #uses view #error #no isStop(a,b,view) ==false 

    ##if isStop(a, b, view) == false # continue processing  #callMiddle #checkCond #sub-interval #UncommentMe
    #isStop(a, b, view) #Error here
    #isStop(a, b, view(collect(a:b), a:b))
    condition = isStoppingCondition(arr, currentValue) #(a, b, _view) #isstop(a, b, _view) #depreciate this  #TODO Questionale change it 

    if condition == true # the actual utility of function #out: view : arr , a:b 
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        # return callMiddle(a, b) # m1,m2,isWhole 
        m1, m2, isWhole = callMiddle!(a, b, arr) # arr) #new range new middle  #<----
        #--------
        # a,b remapping
        #no need in this context 
        #why: the bounds a,b haven't been updated
        #--------
        #TODO: checkCond or checkCond2
        checkCond(a, m1, m2, b, isWhole, _view) #includes: compare values #<----
        return m1, m2, isWhole #TODO: continue logic

    end

    #m1,m2,isWhole = callMiddle() #checkCond(a,m1,m2,b,view) #is it acceptable to pass it a view?
end

currentValue
#init
#before first cause, call init 
function cause(a::Int64, b::Int64, arr::Array{Int64,1})#, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #(a, b, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = callMiddle!(a, b, arr) # arr)
        checkCond(a, m1, m2, b, isWhole, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end

#isStoppingCondition(arr, currentValue)  

function cause(a::Int64, b::Int64, arr::Array{Int64,1}, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = callMiddle!(a, b, arr) # arr) #correct
        checkCond(a, m1, m2, b, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end

function cause(a::Int64, b::Int64, _view::SubArray, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = callMiddle!(a, b, _view) # arr) #correct
        checkCond(a, m1, m2, b, _view) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end

### new Idea : use of kernel as input 
#a m1-1 m1+1 b 

#a m1-1 m2+1 b 

# CompareBounds  
#


# hint: experimental 
""" compares  two points of indices , which are subsets of an arr """
function compareBounds(pt1, pt2, arr::Array{Int64,1})
    return doCompare(pt1, pt2, arr)
end

function compareBounds(pt1, pt2, pt3, arr::Array{Int64,1})
    return compareTriad(pt1, pt2, pt3, arr)#doCompare(pt1, pt2, arr)
end

function compareBounds(pt1, pt2, pt3, pt4, arr::Array{Int64,1})
    # return doCompare(pt1, pt2, arr)
    return compareQuartet(pt1, pt2, pt3, pt4, arr)
end

function compareBounds(pt1, pt2, pt3, pt4, _view::SubArray)
    # return doCompare(pt1, pt2, arr)
    return compareQuartet(pt1, pt2, pt3, pt4, _view)
end

""" compares  two points of indices , which are subsets of a _view """
function compareBounds(pt1, pt2, _view::SubArray)
    return doCompare(pt1, pt2, _view)
end

""" compares  a point & an interval of indices , which are subsets of an arr """
function compareBounds(pt, interval, arr::Array{Int64,1})
    return compareTriad(pt, interval[1], interval[2], arr)
end

""" compares  a point & an interval of indices , which are subsets of a _view """
function compareBounds(pt, interval, _view::SubArray)
    return compareTriad(pt, interval[1], interval[2], _view)
end
""" compares two intervals of indices , which are subsets of  arr """
function compareBounds(interval1, interval2, arr::Array{Int64,1})
    # return compareQuartet(arr[interval1[1]], arr[interval1[2]], arr[interval2[1]], arr[interval2[2]], arr)
    return compareQuartet(interval1[1], interval1[2], interval2[1], interval2[2], arr)
end
""" compares two intervals of indices , which are subsets of  _view """
function compareBounds(interval1, interval2, _view::SubArray)
    return compareQuartet(interval1[1], interval1[2], interval2[1], interval2[2], _view)
end

function compareBounds(pt, interval1, _view::SubArray)
    return compareTriad(pt, interval1[1], interval1[2], _view)
end

arr = collect(1:7)
pts = [1, 3, 4, 7]
#pts[1] # proxy for a lower bound 
compareBounds(pts[1], pts[2], arr) #inpu # solved 
#---------
compareQuartet(1, 2, 3, 4, [1, 2, 3, 4])  # 1 4 2 3  # <-----
compareBounds([1, 2], [3, 4], [1, 2, 3, 4]) # 1 4 2 3 # corrected  

compareBounds([1, 2], [3, 4], [1, 2, 3, 4]) #compareQuartet: doCompare

function checkCondition(a::Int64, m1::Int64, m2::Int64, b::Int64) #error #subtle  

    lowerbound = m1 - 1 #m1-1
    upperbound = nothing #m2+1
    if cond == true  #2 middle m1: next check bounds a,m1 m1, b
        upperbound = m1 + 1

        if a < lowerbound # m1 - 1 #
            v, _view = newView(a, lowerbound)
            compareBounds(v[1], v[2], _view)
            #=elseif a == m1 - 1
                v, _view = newView(a, m1)
                compareBounds(v[1], v[2], _view) =#
        elseif a == lowerbound # m1 - 1
            v, _view = newView(a, a)
            compareBounds(v[1], v[2], _view)
        end

        v, _view = newView(m1, m2)
        compareBounds(v[1], v[2], _view)

        if upperbound < b
            v, _view = newView(upperbound, b)
            compareBounds(v[1], v[2], _view)
        elseif upperbound == b
            v, _view = newView(b, b)
            compareBounds(v[1], v[2], _view)
        end


    elseif cond == false  #isEven(a,b) == #twin middles 
        # 1,3  4, 7 , 8, 9
        upperbound = m2 + 1
        if a < lowerbound  #m - 1
            v, _view = newView(a, lowerbound) #  a != m1-1 or a< m -1 
            compareBounds(v[1], v[2], _view)
        elseif a == lowerbound
            v, _view = newView(a, a) #  a != m1-1 or a< m -1 
            compareBounds(v[1], v[2], _view)
        end
        v, _view = newView(m1, m2) # 4, 7 
        compareBounds(v[1], v[2], _view)

        if upperbound < b
            v, _view = newView(upperbound, b) # 8, 9 
            compareBounds(v[1], v[2], _view)
        elseif upperbound == b
            v, _view = newView(b, b) # 8, 9 
            compareBounds(v[1], v[2], _view)
        end
    end
end

"""Event-Driven function  """
function cause(a::Int64, b::Int64, _view, kernel, currentValue, i) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, _view, i) # arr) #correct
        # checkCond(a, m1, m2, b, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2 

        checkCondition(a, m1, m2, b)

    end
end
"""Event-Driven function  """
function cause(a::Int64, b::Int64, arr, kernel, currentValue, i) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, arr, i) # arr) #correct
        # checkCond(a, m1, m2, b, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2 

        checkCondition(a, m1, m2, b)

    end
end

function cause(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, arr) # arr) #correct
        # checkCond(a, m1, m2, b, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2 

        checkCondition(a, m1, m2, b)

    end
end

#preferred 
function cause(a::Int64, b::Int64, _view::SubArray, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        m1, m2, isWhole = kernel(a, b, _view) # arr) #correct
        # checkCond(a, m1, m2, b, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2 
        cond = copy(isEven(a, b))
        if cond == true  #2 middle m1: next check bounds a,m1 m1, b

            v, _view = newView(a, m1)
            compareBounds(v[1], v[2], _view)

            #v, _view = newView(m1, m2)
            #compareBounds(v[1], v[2], _view)

            v, _view = newView(m2, b)
            compareBounds(v[1], v[2], _view)

        elseif cond == false  #isEven(a,b) == #twin middles 
            # 1,3  4, 7 , 8, 9

            if a < m - 1
                v, _view = newView(a, m1 - 1) #  a != m1-1 or a< m -1 
                compareBounds(v[1], v[2], _view)
            end
            v, _view = newView(m1, m2) # 4, 7 
            compareBounds(v[1], v[2], _view)

            if m2 + 1 < b
                v, _view = newView(m2 + 1, b) # 8, 9 
                compareBounds(v[1], v[2], _view)
            end
        end

        #return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was 

    end
end

#TODO: check usability 
function makeView(_a, _b)
    v = collect(_a:_b)

    return view(v, firstindex(v):lastindex(v))
   # return view(v, (res1:res2)) #view(v, (1:length(res))) #view(v, res1, res2) #res[1]:res[length(res)])#perfect 
end

makeView(1, 9)#done

#res = NewView(1, 9)

typeof(res)
v
view(v, v)

#TODO: Check use of NewView 
function NewView(_a, _b)

    v = makeVector((_a:_b))  
    _view = view(v, firstindex(v),lastindex(v))
   #  _view = makeView(res[1], res[2]) #(res[1]:res[length(res)]))

    return v, _view
end

#new : use of kernel as input  #TODO:
function cause(pts, _view::SubArray, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0 
    elseif condition == false
        a = pts[1]
        b = pts[2]
        m1, m2, isWhole = kernel(a, b, _view) # arr) #correct
        # checkCond(a, m1, m2, b, _view) #includes: compare values #<---- #checkCond2
        # compareBounds(a,b,_view)
        #Pts...sth #TODO: recheckc

        #TODO: traverse(pts)
        if isEven(a, b) == true #1 middle m1
            compareBounds(a, m1, b, _view)

            #  compareBounds(a, m1)
        else
            #return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
            #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
            # isStop(1, 2, view([1, 2], 1:2)) #was 
        end
    end
end
#-------------
#effect #depreciated
""" from arr , get the view(arr, a:b)"""
function effect(a::Int64, b::Int64, _view::SubArray) # = view(_view, a, b)) 

    #to subarray the view 
    #=
    condition = isStop(a, b, _view)
    if condition == true
        return
    elseif condition == false
    =#
    #a != b ? 
    #cause(offset, length(_view), _view) #view(_view, a:b)) #: return  # cause(a, b, view(_view, a:b))  #<-------
    cause(a, b, _view)
    #end
end
#--------
#preferred 
function effect(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue)

    cause(a, b, arr, kernel, currentValue)
end
function effect(a::Int64, b::Int64, _view::SubArray, kernel, currentValue)

    cause(a, b, _view, kernel, currentValue)
end

#-------
function checkSumIsEven(a::Int64, b::Int64)

    _sum = sumInterval(a, b) #    b + a - 1  # distance between them  <---- Error 
    println("a,b =", a, " ", b)
    println("sum = ", _sum)
    isItEven = isEven(_sum)# #even is a proxy for divisibility # TODO: surround by a copy()  #homeMade Heuristic  <------
    println("iseven  = ", isItEven)
    mid = _sum / 2 #  -1  # precalculate mid (_sum /2 )  #Float32(64)
    println("mid( sum / 2) = ", mid)

    return isItEven, mid #warning: sum is not functional(no utility)
end

#----------

#value-check:
ϕ = [1, 3]
mid = 1.5 # 3/2 = 

lower = -1 # <-------
upper = -1 # <-----------
lower = Int(floor(mid))
upper = Int(ceil(mid))
#---------------------------

# ow, you have a triad of Points (1,2,3), which can compare & sort

#Int(floor(5.5))

#checked 
function getSingleMiddle(mid, isItEven::Bool)
    newMid = 0
    println("Even = ", isItEven)
    newMid = Int(floor(mid)) #Int 
    println("Rational mid(index)= ", mid)
    #= isWhole = true
    println("is whole = ", isWhole) =#
    return newMid, newMid + 1, isItEven #=, isWhole =#

end

function getFractionalMiddle(mid, isItEven::Bool)

    # calculate fractionalMid 
    println("Even = ", isItEven)
    println("fractionalMiddle, twinMiddles ") # worrisome: one be 1 other -1
    lower = -1
    upper = -1
    lower = Int(floor(mid))
    upper = Int(ceil(mid))
    #=isWhole = false =#
    println("lower = ", lower)
    println("upper = ", upper)
    #= println("isWhole = ", isWhole) =#
    #TODO: recommendation: lower, upper , isItEven
    return lower, upper, isItEven # the differenece is still 1, only way to discriminate is by using isWhole 

end

@propagate_inbounds function middle(a, b) # b  + a -1  # Acceptable #review#2 ; offset = 1 #rule-found: offset only used in an array (at its start)

    try

        #=
        _sum = sumInterval(a, b) #    b + a - 1  # distance between them  <---- Error 
        println("a,b =", a, " ", b)
        println("sum = ", _sum)
        isItEven = isEven(_sum)# #even is a proxy for divisibility # TODO: surround by a copy()  #homeMade Heuristic  <------
        println("iseven  = ", isItEven)
        mid = _sum / 2 #  -1  # precalculate mid (_sum /2 )  #Float32(64)
        println("mid( sum / 2) = ", mid)
        =#

        isItEven, mid = checkSumIsEven(a, b) # _sum removed 

        # isWhole = getIsWhole(arr) # uncommentMe if everything else not working 
        m1 = 0
        m2 = 0
        isItEven = nothing
        if isItEven == true
            # 1 middle calculate
            mid = Int(floor(mid))#int 
            m1, m2, isItEven = mid, mid + 1, isItEven#Int  #getSingleMiddle(mid, isItEven)
            return m1, m2, isItEven #mid, mid + 1, isItEven #=, isWhole =#

        elseif isItEven == false # <-------------
            # calculate fractionalMid 

            m1, m2, isItEven = getFractionalMiddle(mid, isItEven::Bool)
            #TODO: recommendation: lower, upper , isItEven
            return m1, m2, isItEven #lower, upper, isItEven # the differenece is still 1, only way to discriminate is by using isWhole 
        else
            throw(error("Unexpected error occured")) #<-------
        end
    catch UnexpectedError #errors out 
        @error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end
end
#TODO middle!(a,b)

#isItEven, mid = checkSumIsEven(1, 10)


getSingleMiddle(2, true)
getFractionalMiddle(2, false)
checkSumIsEven(1, 10)
checkSumIsEven(1, 9)
checkSumIsEven(1, 3)
#------master function 
middle(1, 10) #works 
#------
#in Progress # unstable 
#=function middle!(a, b)

    try
        isItEven, mid = checkSumIsEven(a, b) # _sum removed 

        m1 = 0
        m2 = 0
        isItEven = nothing
        if isItEven == true
            # 1 middle calculate
            m1, m2, isItEven = getSingleMiddle(mid, isItEven)

            return m1, m2, isItEven #, isItEven #mid, mid + 1, isItEven #=, isWhole =#

        elseif isItEven == false # <-------------
            # calculate fractionalMid 

            m1, m2, isItEven = getFractionalMiddle(mid, isItEven)
            #TODO: recommendation: lower, upper , isItEven
            return m1, m2, isItEven #lower, upper, isItEven # the differenece is still 1, only way to discriminate is by using isWhole 
        else
            throw(error("Unexpected error occured")) #<-------
        end
        #finally , what to do next #(nextMiddle ?) a,m 
        #pop next interval from _stack , then apply kernel 
        middle(a, b) # 
    catch UnexpectedError #errors out 
        @error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end

end=#
#middle!(1,9)
#-----------------
#Q.how to make intervals from points 
#Q2. why to have those (faster than intrvals )
#-----------
#intent finding a wat to depreciate goright! , goleft! 

#=
#depreciate 
function traverseRight(lowerBound::Int64, upperBound::Int64)

    interval = lowerBound:upperBound #UnitRange
    v = makeVector((interval))
    newView = makeView(v, interval)
    # goright!(lowerBound, upperBound, newView)
    return newView
end
#depreciate 
function traverseLeft(lowerBound::Int64, upperBound::Int64)

    interval = lowerBound:upperBound #UnitRange
    v = makeVector((interval))
    newView = makeView(v, interval)
    # goleft!(lowerBound, upperBound, newView)
    return newView

end
=#

#at least 1 partition function 
""" gets _stack of ranges """
function partition(a::Int64, b::Int64, kernel=middle, currentValue)

    m1, m2, isItEven = kernel(a, b) # here, we dunno if it's singleMiddle or twinMiddles 

    currentValue = calcVerteciesLeft!(a, b, currentValue) # valuable utility
    #Infered Rule 1: left side is always a, m1 

    # Inferred rule 2    right side b is always last

    #Right-side Processing  #partitioning 
    #depreciate 
    # processRightSide(isItEven, m1, m2, b)

    #finally, 

    ##Left-side Processing

    interval = copy(a:m1)
    v = makeVector((interval))
    newView = makeView(v, interval)
    # goleft!(a, m1, newView) # goleft!(a, m1, view(newView, a:m1))
    #TODO: cause!(a, m1, newView)

    #traverse middle (if isItEven==false)
    if isItEven == false
        #m1,m2 
        #TODO: call cause 
        v = makeVector((m1:m2))
        makeView(v, v[1]:length(v))
        #kernel function 

        # callCause(m1, m2)

        #cause
    end
    ##traverse right
    traverseLeft(1, m1 - 1)
    #singleMiddle: m1 
    if isItEven == true
        #nextInterval remapping: m1, b
        # m1, b = remap(m1, b) # why remap here 
        #Todo: call 

        traverseRight(m1, b)

        #twinMiddle: m1 , m2 
    elseif isItEven == false
        #nextInterval remapping: m2, b
        #  m2, b = remap(m2, b)
        traverseRight(m2, b)

    else
        throw(error(msg))
    end

end


typeof(_stack)

pts = rangesToPts(_stack)

#compareBounds() #TODO: Check 
pts

function cause!(_stack, kernel)
    if _stack > 0
        interval = pop!(_stack)
        a = interval[1]
        b = interval[2]
        effect!(a, b, kernel)
    end

end

middle!(1, 3)

function effect!(a, b, _stack, kernel=middle)

    if _stack > 0
        m1, m2, isWhole = kernel(a, b)
        #haandling # traverse 

    end
    # cause!(a, b, _stack, kernel)
end

v = makeVector((5:6))
_view = makeView(v, v[1]:length(v))
#callCause(5, 6, _view) # depreciate 
#cause(5, 6, _view)
currentValue = nothing
cause(a, b, _view, calliddle, currentValue)
cause(a, b, arr, middle, currentValue)

interval = copy(1:3)
v = makeVector((interval))
newView = makeView(v, interval)
goleft!(1, 5, newView)


"""remaps the right side """ 
function processRightSide(isItEven::Bool, m1::Int64, m2::Int64, b::Int64)

    #Right-side partitioning 
    if isItEven == true  # This part is for sorting only (not for partitioning)
        # a Single Middle: m1 
        #Right: m1 (with b )
        m1, b = remap(m1, b) #deep #TODO #either m1, b [remap] or m1,b-1 [remap2]
        return m1, b
    elseif isItEven == false
        # a twinMiddles: m1, m2
        #Right: m2 (with b )
        m2, b = remap(m2, b) 
        return m2, b
    end
end

#-------------

function getIsWhole(arr::Array{Int64,1})
    isWhole = firstindex(arr) + lastindex(arr) % 2 == 0
    return isWhole
end

function getIsWhole(_view::SubArray)
    isWhole = firstindex(_view) + lastindex(_view) % 2 == 0
    return isWhole
end

#----
#sort()
#-compare(a,b,view)

3 - 1 + 1
intervalLength(1, 4) # same as +(1,4)

# Compare 
""" a universal compare: compares & sorts contents according to the structure of a given interval, (a,b)"""
#unimplemented: no such function with niput arguments specified 

function Compare(a, b, arr::Array{Int64,1}) # should 
    #implicit docompare() function 
    m1, m2, isWhole = middle(a, b)
    _length = copy(intervalLength(a, b))
    try
        if _length  #took the easy way, what if view is large? only way is from a,b 
            compareTriad(a, m1, b, arr) #a, m1, b # m1 is vital 

        elseif _length
            compareQuartet(a, m1, m2, b, arr)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end

function Compare(a, b, _view::SubArray) #  
    #implicit docompare() function 
    m1, m2, isWhole = middle(a, b)
    _length = copy(intervalLength(a, b))
    try
        if _length #length(_view == 3) #took the easy way, what if view is large? only way is from a,b 
            compareTriad(a, m1, b, _view) #a, m1, b # m1 is vital 

        elseif _length #length(_view == 4)
            compareQuartet(a, m1, m2, b, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end
#new ; the under a new light 

function Compare(pts, arr::Array{Int64,1}, i) # should be sanity checked #< --------
    #implicit docompare() function 
    #  m1, m2, isWhole = kernel(a, b, arr)
    vals = mapPts(pts, arr, i)             #<-------- sanity check 
    _length = copy(length(vals))
    try
        if length == 2
            return doCompare(vals[1], vals[2], arr)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from a,b 
            a = vals[1]
            m1 = vals[2]
            b = vals[3]
            return compareTriad(a, m1, b, arr) #a, m1, b # m1 is vital 

        elseif _length == 4 #length(_view == 4)
            a = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            b = vals[4]
            return compareQuartet(a, m1, m2, b, arr)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end

#kernel has not enough utility 
function Compare(pts, _view::SubArray, i) # should be sanity checked #< --------

    #implicit docompare() function 
    # m1, m2, isWhole = kernel(a, b, _view)
    vals = mapPts(pts, _view, i)             #<-------- sanity check 
    _length = copy(length(vals))
    try
        if length == 2
            return doCompare(vals[1], vals[2], _view)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from a,b 
            a = vals[1]
            m1 = vals[2]
            b = vals[3]
            return compareTriad(a, m1, b, _view) #a, m1, b # m1 is vital 

        elseif _length == 4 #length(_view == 4)
            a = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            b = vals[4]
            return compareQuartet(a, m1, m2, b, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end
Compare([1, 3], arr, 1)
#=
 function Compare(pts, _view::SubArray,kernel,i) # should be sanity checked #< --------
    #implicit docompare() function 
    m1, m2, isWhole = kernel(a, b,_view)
    vals = mapPts(pts,_view,i)             #<-------- sanity check 
    _length = copy(length(vals))
    try
        if length == 2
          return   doCompare(vals[1], vals[2], _view)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from a,b 
            a = vals[1]
            m1 = vals[2]
            b = vals[3]
            return compareTriad(a, m1, b, _view) #a, m1, b # m1 is vital 

        elseif _length == 4 #length(_view == 4)
            a = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            b = vals[4]
            return compareQuartet(a, m1, m2, b, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end

function Compare(pts, arr::Array{Int64,1}, kernel, i) # should be sanity checked #< --------
    #implicit docompare() function 
    m1, m2, isWhole = kernel(a, b, arr)
    vals = mapPts(pts, arr, i)             #<-------- sanity check 
    _length = copy(length(vals))
    try
        if length == 2
            return doCompare(vals[1], vals[2], arr)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from a,b 
            a = vals[1]
            m1 = vals[2]
            b = vals[3]
            return compareTriad(a, m1, b, arr) #a, m1, b # m1 is vital 

        elseif _length == 4 #length(_view == 4)
            a = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            b = vals[4]
            return compareQuartet(a, m1, m2, b, arr)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end

function Compare(a, b, _view::SubArray,kernel) # should 
    #implicit docompare() function 
    m1, m2, isWhole = kernel(a, b,_view)
    _length = copy(intervalLength(a, b))
    try
        if _length #length(_view == 3) #took the easy way, what if view is large? only way is from a,b 
            compareTriad(a, m1, b, _view) #a, m1, b # m1 is vital 

        elseif _length #length(_view == 4)
            compareQuartet(a, m1, m2, b, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end
=#
#2. sort()

""" Compares & sorts points based on the structure of the view, whether a triad or quartet of points """
function CompareSort(a, b, arr::Array{Int64,1})

    #implicit docompare() function 
    m1, m2, isWhole = middle(a, b) # callMiddle!(a,b,_view)

    try
        if length(arr) == 3
            compareTriad(a, m1, b, arr)

        elseif length(arr) == 4
            compareQuartet(a, m1, m2, b, arr)

        else
            throw(error("Unexpected Error Occured"))
        end
        println(arr)
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end

function CompareSort(a, b, _view::SubArray)

    #implicit docompare() function 
    m1, m2, isWhole = middle(a, b) # callMiddle!(a,b,_view)

    try
        if length(_view) == 3
            compareTriad(a, m1, b, _view)

        elseif length(_view) == 4
            compareQuartet(a, m1, m2, b, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
        println(_view)
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, back_trace())
    end

end

#test: _stack
#_stack = []
length(_stack)
_item = pop(_stack) # [1,3]

#---------

pts = [2, 3, 1]

b = pts[length(pts)-1] #before the  last (b)
a = pts[length(pts)-1-1] #before the  last (a)
#------
function getlastB(_stack)

    lastB = _stack[length(_stack)-1][2]
    return lastB
end
#
last
lastB = 1
interval = [2, 3]

#interval [1:3]
#--- 
#error 
lastB
pts[lastB] #to be removed # serves no purpose 
interval[1]
interval[2]


#newView = view([lastB, interval[2], lastB:interval[2]) 
#newView = view(lastB:interval[2], lastB, interval[2])
#newView = view([lastB, interval[1], interval[2]], lastB, interval[2])

#view definition  howTo

newView = view(makeVector((lastB:interval[2])), lastB:interval[2]) #works by adding the colon to th

#newView = view(makeVector((lastB, interval[2])), makeVector((lastB:interval[2]))) # view(pts[lastB], interval[1]: interval[2])

#---- #view run 
v = @view [1, 4, 8][1:2]

#index to content 
#elementOf(index::Int64)
first([1, 4, 8], 2)[2] #return the first n elements i.e. 2: [1:4] , [1:4][2] = 4

#helpers of Util file:



"""returns the element, at a specific index"""
function elementOf(arr, n::Int64)

    return first(arr, n)[n] #return the first n elements i.e. 2nd: [1:4] , [1:4][2] = 4

end

""" searches the Content in the vector, returning its index(cies)"""
function indexOf(arr, aContent::Int64)

    res = findall((x -> x == aContent), arr)  #indexOf(aContent, arr)
    return res
end

makeView([1, 4, 8], 1:2)


firstindex([1, 4, 8], 9) # erroneous function (reson: always returning 1)

#indexOf(aContent::Int64)

aContent = 4
a = findall((x -> x == aContent), [1, 4, 8])  #indexOf(aContent, arr)


#a = a[1]firstindex(a)

#first([1,4,8],1)

v
#v1 = view([1, 4, 8],1:firstindex([1,4,8],4)) #)
#v2 = view([1, 4, 8], 4 :lastindex([1, 4, 8])) #,8)
#view([1, 4, 8], firstindex([1, 4, 8], 1)) #correct 
#v = makeVector((firstindex([1, 4, 8], lowerbound), firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3] # [1,1]
#view([1, 4, 8], firstindex([1, 4, 8], 8)) #1
#newRow = view(arr, mappedIndex:newBound) # want to access sth larger than the () itself
#newRow = view(arr, 2-1:2) # this works  #[4 8]

#----
#mappedIndex not defined 

#makeView(arr, mappedIndex:newBound)

#view(arr, mappedIndex:newBound)
v = makeVector((lastB:interval[2]))

_newView = makeView(v, firstindex(v):length(v)) # interval[2]) #works # [1,2,3]

#newView = view(makeVector((lastB: interval[2])), lastB,interval[2]) #old # view(pts[lastB], interval[1]: interval[2])

#suviewing : (view of a view )
view(_newView, lastB:interval[1]) #subviewing the view 


makeView(_newView, lastB:interval[1]) #works #[1,2] #subview works as well 

view([lastB, interval[1], interval[2]], lastB:interval[2]) # [1,2,3]

v = [lastB, interval[1], interval[2]]
_view = view(v, firstindex(v):length(v)) #the most Accurate view description 5

# lastA
#why does it start enumerating from 0 ???? - lastA [issue was : calculating from lastB-1 & lastB=1]

lastB # 1 
inds = [lastB, interval[1], interval[2], interval[2] + 1] #[lastA, lastB, interval[1], interval[2]]
inds2 = [lastB, interval[1], interval[2]] # [1,2,3]

#best view # checked 
v = makeVector((lastB:interval[2]))
_view = makeView(v, firstindex(v):length(v))

#v = makeVector((lastB:interval[2]))
#newView = makeView(v, firstindex(v):length(v))
v = [lastB, interval[1], interval[2]] # [1,2,3] 3 element vector 
inds # [1,2,3,4]
_view = view(v, inds[1:3]) #the most Accurate view description 5
v = [lastB, interval[1], interval[2]]
inds2
inds2
popat!(inds, 1)
inds
#Idea: Automation: for i 1:length(inds) 
#1.collect 2. Union Set 3. return final Union Set 
A = collect(inds[1]:inds[2])
B = collect(inds[2]:inds[3])
_unionSet = union!(A, B)
# ,typeof(inds)

"""returns a set of non-redundant indicies """
function unionIndicies(inds::Array{Int64,1})

    A = nothing
    B = nothing
    _unionSet = nothing
    _length = length(inds)
    for i in 2:_length
        #even 
        if isEven == true  # A  i = 2, 4, 6
            A = collect(inds[i-1], inds[i])
        elseif isEven == false  # B i = 3,5,7 
            B = collect(inds[i-1], inds[i])
            _unionSet = union!(A, B)

        end

    end

    return _unionSet
end
#------------------
#length(inds)

inds2
popat!(inds2, 1)
v
view(v, firstindex(v):lastindex(v))
#TODO: recursive popat!()

#----
#When building a view, there must be an exact match between items & their indices

#=
unlocks hidden property
vector[a,a+1,a+2], inds=[]
(if a=0 i.e. vector is a 0th index)
=#
#--------- would be great to be considered, next 
#test: experimental idea only 
global lastA = 0
global lastB = 0
pts = []
group = 0
#lastB = 0

pts = []
group = 0
_stack = [[1, 3], [4, 7], [8, 9]]
#loop: begin 
group += 1 # group = 2 
#group+= 1 #redundant 
#1st pop 
interval = popfirst!(_stack) #stack of ranges (between 2 points)
print(interval)
#memory-less operation 
lastA = interval[1]
lastB = interval[2]
#store points 
#pushfirst!(pts, lastA)
#pushfirst!(pts, lastB)
#

#lastindex(pts,2)

#(un)necessary move 
push!(pts, lastA)
push!(pts, lastB)
pts

firstindex(pts)
lastindex(pts)
pts[firstindex(pts)]
pts[lastindex(pts)]

firstIdx = pts[firstindex(pts)] #copy(indexOf(pts, 1)) #1 # 2 = 1
lastIdx = pts[lastindex(pts)] # copy(indexOf(pts, 3)) #2 #1 # = 3

println("pts[1] = lastA= ", pts[1])
println("pts[2] = lastB= ", pts[2])  # pts[3])

#=
if length(firstIdx) == 1
    println( pts[firstIdx])
    pushfirst!(pts, lastA)
end 
lastIdx = copy(indexOf(pts, 3))
if  length(lastIdx) ==1 
    println( pts[lastIdx])
    pushfirst!(pts, lastB)
end 
=#
#-----
#group = 0
group += 1 # group = 2 
#group+= 1 #redundant 
_stack
#TODO: add the first interval ( manually)
# somehow it's already done 
interval = popfirst!(_stack) #stack of ranges (between 2 points)# popfirst!()
#memory-less operation 
lastA = interval[1]
lastB = interval[2]
#store points 
push!(pts, lastA)
push!(pts, lastB)
println("pts[1] = lastA= ", pts[1]) #a 
println("pts[2] = lastB= ", pts[2]) #b
#-----
interval = nothing # afterwards, has a value 
if group == 2
    compareBounds(pts[1], pts[2], pts[3], pts[4], arr)
    group = 0
    #empty pts 
end
group += 1 # group = 2 
#group+= 1 #redundant 
interval = pop!(_stack) #stack of ranges (between 2 points)
#memory-less operation 
lastA = interval[1]
lastB = interval[2]
#store points 
push!(pts, lastA)
push!(pts, lastB)
println("pts[1] = lastA= ", pts[1]) #a 
println("pts[2] = lastB= ", pts[2]) #b
#generalization 
#while true #Todo: add a condition
if length(_stack) > 1 # count the stack 
    if group == 2
        compareBounds(pts[1], pts[2], pts[3], pts[4], arr)
        pts.popat(1)
        pts.popat(1) # pts.popat(2)
        pts.popat(1) # pts.popat(3)
        pts.popat(1) #pts.poptat(4)
        group = 0
    end
    group += 1 # group = 2 
    # group+= 1 #redundant 
    interval = pop!(_stack) #stack of ranges (between 2 points)
    #memory-less operation 
    lastA = interval[1]
    lastB = interval[2]
    #store points 
    push!(pts, lastA) # pts[1]
    push!(pts, lastB) # pts[2]
    println("pts[1] = lastA= ", pts[1]) #a 
    println("pts[2] = lastB= ", pts[2]) #b
elseif length(_stack) == 1 # last one get lst (ndv )

    #=
    if group == 1 # only 1 per item 
        #complete Triad : [lastB, interval[1], interval[2]

        #GET Last b = currentA #pop!
        interval = pop!(_stack)
        #form a view from lastB, & interal (midpoint newInterval[1] becomes implicit)
        #view(lastB,interval[2])
        _view = view(lastB:interval[2], [lastB, interval[1], interval[2]])

        #create view with points of lastb, lastrange 
        # Compare(a, b, _view) #
        #sort
        CompareSort(lastB, interval[2], _view)
        # group = 0
    elseif group == 2
        #Calls compare Quartet
        #sth useful
        #TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

        _view = view(lastA:interval[2], [lastA,lastB, interval[1], interval[2]])  

    end
    # <-----------------
    group = 0 # reset group  
    =#

    #=
    elseif group == 2
        # do sth useful 
        compareBounds(pts[1], pts[2], pts[3], pts[4])
        group = 0

    end
    =#
    if group == 1
        lastB = getlastB(_stack)
        v = makeVector((lastB:interval[2]))
        _view = makeView(arr, lastB:intereval[2])

        compareTriad(lastB, interval[1], interval[2], _view)
        println("sth: to be taken care of ")
        pts.popat(1)
        pts.popat(1)
    end
    #=
    elseif group ==2
        compareQuartet(pts[1],pts[2],pts[3], pts[4],_view) #l
        pts.popat(1)
        pts.popat(1)
        pts.popat(1)
        pts.popat(1)

    end
    =#
end  #done 
arr


## pts handling: a,b points (joined with an original arr )
#goal: to evaluate (some) kernel function with inputs a,b, arr 
#i.e. kernel:trivialPartitionFunction(a,b ) 
#   middle(a,b) #TODO call middle from in : a,b to all ranges 1st, last
#so: no More #iterative function 

#cause meeded to be called, on the next interval (iteratively )
#cause!() that does all: calls itself to proceed, further , into the next interval,
# where you record it's return (next a,b
#in general : there ain't no right or left, only 1 function (2 subsequent effects
# 1.1 1 for tje rigth -> calls cause right [m1, b, OR m2,b ]) 
#1.2.  another left ->calls cause left pts (a,m1 always )


#TODO:
#=
    if group == 1 # only 1 per item 
        #complete Triad : [lastB, interval[1], interval[2]

        #GET Last b = currentA #pop!
        interval = pop!(_stack)
        #form a view from lastB, & interal (midpoint newInterval[1] becomes implicit)
        #view(lastB,interval[2])
        _view = view(lastB:interval[2], [lastB, interval[1], interval[2]])

        #create view with points of lastb, lastrange 
        # Compare(a, b, _view) #
        #sort
        CompareSort(lastB, interval[2], _view)
        # group = 0
    elseif group == 2
        #Calls compare Quartet
        #sth useful
        #TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

        _view = view(lastA:interval[2], [lastA,lastB, interval[1], interval[2]])  

    end
    # <-----------------
    group = 0 # reset group  
    =#
println("sth: to be taken care of ")
#end
v = makeVector((1:3))
compareTriad(1, 2, 3, arr)
#compare 
#=
if group ==1 # only 1 per item 
    #complete Triad 

    # getLastB()
    #
elseif group == 2
#Calls compare Quartet

end  =#
#==#
#TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

lastb = pts[length(pts)-1] #moved out of if scope
lasta = pts[length(pts)-1-1] #optional 
#----
# Work around
lastB
interval[2]
if lastB != interval[2]
    v = makeVector(lastB:interval[2]) # (arr, lastB:interval[2])
    _view = makeView(v, lastB:interval[2])

else # lastB !== interval[2]
    # v = makeVector(lastB) # (arr, lastB:interval[2])
    #  _view = makeView(v, firstindex(v))
    return lastB #,_view[lastB]
end
#finally subtitute lastB plugging it into original arr :
# it does nothing of useful utility 
arr[lastB]

#v
v = makeVector(lastB) # (arr, lastB:interval[2])
_view = makeView(v, firstindex(v):length(v))

#_view = view([lastB, interval[1], interval[2]], [lastB, interval[1], interval[2]])# acceptable? 
#v = makeVector((lastB:interval[2]))
#newView = makeView(v, firstindex(v):length(v))

#-------

# newView = makeView(makeVector((lastB:interval[2])), lastB:interval[2]) #works # [1,2,3]
v = collect(lastB:interval[2])
_newView = view(v, firstindex(v)) # $:length(v))
length(_newView)
interval[2]#
lastB
#compareBounds(lastB, interval[2],newView)
#CompareSort(lastB, interval[2], newView)

if group == 1 # only 1 per item 
    #complete Triad : [lastB, interval[1], interval[2]

    #GET Last b = currentA #pop!
    interval = pop!(_stack)
    #form a view from lastB, & interal (midpoint newInterval[1] becomes implicit)
    #view(lastB,interval[2]))
    #lastb = pts[length(pts)-1 #erroneous part
    # _view = view(pts[length(pts)-1]:interval[2], [lastb, interval[1] , interval[2]] )
    #  _view = view([lastB, interval[1], interval[2]], [lastB, interval[1], interval[2]])# acceptable? 
    # _view = makeView(makeVector((lastB:interval[2])), lastB:interval[2]) #works # [1,2,3]
    v = collect(lastB:interval[2])
    _view = makeView(v, firstindex(v):length(v)) # view correctly created 
    ####TODO: DO RemappinG: lastB: interval[2]

    #create view with points of lastb, lastrange 
    # Compare(a, b, _view) #
    #sort
    CompareSort(lastB, interval[2], _view) #compareTriad
# group = 0
elseif group == 2
    #Calls compare Quartet
    #sth useful
    #TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

    #  _view = view(lastA:interval[2], [lastA,lastB, interval[1], interval[2]])
    _view = view(pts[length(pts)-1-1]:interval[2], [pts[length(pts)-1-1],
        pts[length(pts)-1], interval[1], interval[2]])

end
# <-----------------
group = 0 # reset group # crucial
#end    
# gtee hb

#end 

#---------
#idea adding single point to the top of an interval 
pts = [2, 3, 1]
#there might be subtle prolem with it, if already saved new intervsl of 2 points: best length(newIntervsl)
length(pts) - 1 > 0 ? b = pts[length(pts)-1] : -1 #before the  last (b)
length(pts) - 1 - 1 > 0 ? a = pts[length(pts)-1-1] : -1 #before the  last (a)

#Appendfirst(lastB)
lastB = 1
interval = [2, 3]
pushfirst!(interval, lastB) #interval=[1,2,3]
#------------
#indexOf (pts[length(pts)])
#=
3 7  false 


=#
comparePts(pts, arr) # great alternative 
#CompareSort(index(pts[1]), index(pts[length(pts)]))

# AppendFirst!
#vital # useful

"appends a scalar value  at the first of a vector "
function appendFirst!(lastB::Int64, interval::Array{Int64,1})

    #lastB = 1
    #interval = [2, 3]
    pushfirst!(interval, lastB) #interval=[1,2,3]
    return interval
end

#append!(interval, lastB)

### Note: no need for appendLast, append!(interval,lastB) takes care of it 

#-----
#TODO: remove makeVector 
#pushvif
v = collect(interval[1], interval[2])
(v[1]:last(v)) #unitRange 
v1 = collect(interval[1]:interval[2])

first(v)
last(v)

#uncommentMe if needed 
#makeView(v, first(v):last(v))
#_view = makeView(interval, (interval[1]:last(interval)))

#view(v, (v[1]:last(v)))  # missing view 

v = makeVector(first(v):last(v)) #lastB:interval[2])
a = first(v)
b = last(v)
#v[1],v[2] =  #remap(v[1],v[2]) # 4" 7 -> 1:4 #no remap 
v = makeVector(a:b) #first(v):last(v)) #(v[1]: v[2]))
#remap  1: 4
lo = 0;
hi = 0;
# lo, hi = remap(lo, hi)

_view = makeView(v, firstindex(v):lastindex(v)) #lo:hi) # done ! #4:7

#view(lastB:interval[2], [lastB, interval[1], interval[2]])
#experimental #comment it please 
[lastB, v]# not working as expected 

#append!(lastB, v) unimplemented 
pushfirst!(v, lastB) # 1,2,3 # does the trick
popfirst!(v) #1  
v
eltype(v)
typeof(v)
@assert eltype(v) != typeof(v)

#_view = view([lastB, interval[1], interval[2]], [lastB, interval[1], interval[2]])
lastB

v
_view = makeView(v, lo:hi) #lastB:last(v))
#done 

#failed attempted to capture what is already dome 
#=
function checkX(groupnum, lastB,_view::view)
    Compare(a,b,_view)
end
=#
#now partition is over 

# abstraction: hungry, nonhungry

# goals Determines what you see
#since you see what you want 
pts
# 
if length(pts) == 4

    compareBounds(pts[1], pts[2], pts[3], pts[4])

elseif length(pts) == 3
    compareBounds(pts[1], pts[2], pts[3])

elseif length(pts) == 2
    #compareBounds()
    v = collect(pts1[1],pts[2])
    _view = collect(v,firstindex(v):lastindex(v))
    compareBounds(pts[1], pts[2], _view)
end

## comparePts

function comparePts(pts, arr::Array{Int64,1})

    if length(pts) == 4
        compareBounds(pts[1], pts[2], pts[3], pts[4], arr)

    elseif length(pts) == 3
        compareBounds(pts[1], pts[2], pts[3], arr)

    elseif length(pts) == 2
        #compareBounds()
        compareBounds(pts[1], pts[2], arr)
    end
end

function comparePts(pts, _view::SubArray)
    if length(pts) == 4
        compareBounds(pts[1], pts[2], pts[3], pts[4], _view)

    elseif length(pts) == 3
        compareBounds(pts[1], pts[2], pts[3], _view)

    elseif length(pts) == 2
        #compareBounds()
        compareBounds(pts[1], pts[2], _view)
    end
end

#Automatically compare pts , based on its length 

lastb = pts[length(pts)-1] #moved out of if scope

#----------------------
#advanced: define a _stack of inputs
group = 1 # given group
#= # TODO pass (or define) a `_stack` [for recursion operator ]
if group == 1 # only 1 per item 
    #complete Triad : [lastB, interval[1], interval[2]

    #GET Last b = currentA #pop!
    interval = pop!(_stack)
    #form a view from lastB, & interal (midpoint newInterval[1] becomes implicit)
        #view(lastB,interval[2]))
    #lastb = pts[length(pts)-1 #erroneous part
    # _view = view(pts[length(pts)-1]:interval[2], [lastb, interval[1] , interval[2]] )
    _view = view([lastb, interval[1], interval[2]], [lastb, interval[1], interval[2]])# acceptable? 

        #create view with points of lastb, lastrange 
        # Compare(a, b, _view) #
        #sort
    CompareSort(lastb, interval[2], _view) #compareTriad
    # group = 0
elseif group == 2
     #Calls compare Quartet
     #sth useful
     #TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

     #  _view = view(lastA:interval[2], [lastA,lastB, interval[1], interval[2]])
    _view =  makeView([pts[length(pts)-1-1], pts[length(pts)-1], interval[1], interval[2]],
    pts[length(pts)-1-1]:interval[2] )
     # _view = view(pts[length(pts)-1-1]:interval[2], [pts[length(pts)-1-1],  pts[length(pts)-1], interval[1], interval[2]])

end    
=#
[1 2 3 4] # was typical input 
[1 2], [3, 4] # stack input 
#-------------
#=
    define middle 
    define left (of middle)
    define right (of middle)
    #------
    stack element
   interval[i] = [a,b]
    interval[i][1] # a 
    interval[i][2] # b 


=#
__int = [[4, 7]]
midId = 1
#__int[1][1]
__int[midId][1]# 4
__int[midId][2] # 7 

v = collect( __int[midId][1]:__int[midId][2]) #4:7 
#makeView(__int, interval[id][a]:interval[id][b])

  
_view = view(v, firstindex(v):lastindex(v))  #__int[1][1]:__int[1][2])  # 4:7

v = collect(__int[1][1]:__int[1][2]) #works  #, __int[1][1]:__int[1][2]) # [4,5,6,7] vector  # 4:7 (wait don;t siklvealready)
makeView(v, firstindex(v):length(v))   #__int[1][1]:__int[1][2])  # [4,5,6,7] view 

#indexOf(v,v[1])
firstindex(v)
length(v)

#v = 4,5,6,7 
#make a view , with a valid datastructure: vector, with valid mapping (index-1)

function callCause(id, a, b, interval) #, arr) #correct mapping 

    v = collect(interval[id][1]:interval[id][2]) #works  #, __int[1][1]:__int[1][2]) # [4,5,6,7] vector 
    _view = makeView(v, first(v):length(v))   #__int[1][1]:__int[1][2])  # [4,5,6,7] view 

    return cause(a, b, _view)
end

function callCause(a, b) #, arr) #correct mapping 

    v = collect(a:b)#works  #, __int[1][1]:__int[1][2]) # [4,5,6,7] vector 
    _view = makeView(v, first(v):last(v))   #__int[1][1]:__int[1][2])  # [4,5,6,7] view 
    #newView(a, b)
    return cause(a, b, _view)
end



_stack[interval[1][a],interval[1][b]]
collect(interval[1][a],interval[1][n])
 _view= view(_stack, firstindex(v):length(v))  #interval[1][a]:interval[i][b])
makeView(v, first(v):length(v))   #__int[1][1]:__int[1][2])  # 

#-------
#Vital 
function traverse(a, b, _view) #, i)

    #length(_stack) > 1
    # length(_view) !== 
    if euclidDistDifference(a, b) >= 1  # that cindition is too classical 
        #the only plac wher we can check the euclid distance 
        effect(a, b, _view)

    end
end

#uses isStoppingCondition
function traverse!(a, b, _view, currentValue=nothing)  # , i)

    currentValue = copy(isStoppingCondition(a, b, currentValue))
    currentValue = calcVerteciesLeft!(_view, currentValue)
    #calcUnexplored
    ## return handleCurrentValue(currentValue)

    cond = handleCurrentValue(currentValue)
    if cond == false
        effect(a, b, _view)
    elseif cond == true
        return

    end
    #length(_stack) > 1
    # length(_view) !== 
    #if euclidDistDifference(a, b) >= 1
    #the only place for checking the euclid distance 


end

function traverse(_stack, a, b) # traverse , a,b  #warning a,b not used #TODO

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
    #do cause 
    #        callCause(a, b, interval) #, _stack)

    elseif l == 2 #works best with 2 
        interval = pop!(_stack) # [a,b]

        #       callCause(a, b, interval)#, _stack)

    end
end

_stack = [[1, 3], [8, 9]]

id = 1
interval = pop!(_stack)
interval #[1,3]

interval[2]

function traverse2!(_stack, kernel)

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
        a = indexOf(interval, interval[1])
        b = indexOf(interval, interval[2])
        #do cause 
        #kernelfunction call 
        kernel(a, b, interval) #, _stack) #TODO: complete: q. what is its  return( should be inner _stack) - with new points 

    #cause(interval[id][1], interval[id][b], makeView(_stack, interval[id][1]:interval[id][b]))
    #end endAlgorithmSafely

    else # >= 2 (i.e. 3, 4, or more )
        #odd/even: divisibility by 2 
        isItEven = nothing
        isEven(l) ? isItEven = true : isItEven = false

        # traverse()
        if isItEven == true  # divide by 2 (always )- as it's an Even integer 
            n = l // 2 # returns an integer #- turnsout to be the middle # A trivial step (from checking even ) 
            #idea: generalize to a partition function 
            #(based on a partition criteria)
            #---- n + n = 2n #-------------
            # _stack[0] # first 
            #_stack[n] #middle  # ---- pop this

            ## Fetch from the _stack list, at that new, particular index 
            res = popat!(_stack, n) # after pop = 2*n -1 = odd 
            res[1] # a 
            res[2] # b
            #call kernet 
            # a,b, at their index location 
            kernel(1, res, middle) #TODO: How to finish it (place a finish condition ) - _stack == [] otherwise redo that 
        # fetches a newer, smaller _stack of rest of the points 
        #if index = idx then res[offset], 

        #todo: what to do with value (call special kernel function )
        #_stack[2n] # last 
        # _stack[length(_stack)]
        # traverse(0, length(_stack), _stack)
        #done on a higher level:

        #for i in 1:length(_stack)
        #    traverse!(i, _stack)
        # end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is a middle
            #TODO: traverse middle 
        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm 

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has a symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals), & 1 interval  
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right() 
        #or can we call directly cause (a la toute suite)

    end

end

#experimen tal 
function traverse2!(_stack)

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
        a = indexOf(interval, interval[1])
        b = indexOf(interval, interval[2])
        #do cause 
        #kernelfunction call 
        #  callCause(a, b, interval) #, _stack) #TODO:

        #cause(interval[id][1], interval[id][b], makeView(_stack, interval[id][1]:interval[id][b]))
        #end endAlgorithmSafely

    else # >= 2 (i.e. 3, 4, or more )
        #oddity 
        isItEven = nothing
        isEven(l) ? isItEven = true : isItEven = false

        # traverse()
        if isItEven == true  # divide by 2 (always )
            n = l // 2 # returns an integer #- turnsout to be the middle 
            #---- n + n = 2n #-------------
            # _stack[0] # first 
            #_stack[n] #middle  # ---- pop this
            res = popat!(_stack, n) # after pop = 2*n -1 = odd 
            res[1] # a 
            res[2] # b
            # a,b, at their index location 
            kernel(1, res, middle)
            #if index = idx then res[offset], 

            #todo: what to do with value (call special kernel function )
            #_stack[2n] # last 
            # _stack[length(_stack)]
            # traverse(0, length(_stack), _stack)
            #done on a higher level:

            #for i in 1:length(_stack)
            #    traverse!(i, _stack)
            # end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is a middle
            #TODO: traverse middle 
        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm 

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has a symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals), & 1 interval  
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right() 
        #or can we call directly cause (a la toute suite)

    end

end

cause(a, b, arr, middle!, currentValue)

function traverse!(_stack)

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
        a = indexOf(interval, interval[1])
        b = indexOf(interval, interval[2])
        #do cause 
        #callCause(a, b, interval) #, _stack)
        currentValue = nothing
        cause(a, b, arr, middle!, currentValue)
        #cause(interval[id][1], interval[id][b], makeView(_stack, interval[id][1]:interval[id][b]))
        #end endAlgorithmSafely

    elseif l == 2 ##exactly 2 #works best with 2  # popat ,offf;e
        interval = pop!(_stack) # [a,b]
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])

        #   goleft!(a, b, interval)  # check first in on left 

        interval = pop!(_stack)
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])

        #   goright!(interval) #check last is on right 
        #
        # goleft!(a, b, interval)  # check first in on left 

        #endAlgorithmSafely
        #------

    else # > 2 (i.e. 3, 4, or more )
        #oddity 
        isItEven = nothing
        isEven(l) ? isItEven = true : isItEven = false

        # traverse()
        if isItEven == true  # divide by 2 (always )
            n = l // 2 # returns an integer #- turnsout to be the middle 
            #---- n + n = 2n #-------------
            # _stack[0] # first 
            #_stack[n] #middle  # ---- pop this
            res = popat!(_stack, n) # after pop = 2*n -1 = odd 
            res[1] # a 
            res[2] # b
            # a,b, at their index location 
            kernel(1, res, middle)
            #if index = idx then res[offset], 

            #todo: what to do with value (call special kernel function )
            #_stack[2n] # last 
            # _stack[length(_stack)]
            # traverse(0, length(_stack), _stack)
            #done on a higher level:

            #for i in 1:length(_stack)
            #    traverse!(i, _stack)
            # end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is a middle
            #TODO: traverse middle 
        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm 

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has a symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals), & 1 interval  
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right() 
        #or can we call directly cause (a la toute suite)

    end
end

function traverse(id, _stack)

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])
        #do cause 
        callCause(id, a, b, interval) #, _stack)

    #cause(interval[id][1], interval[id][b], makeView(_stack, interval[id][1]:interval[id][b]))
    #end endAlgorithmSafely

    elseif l == 2 ##exactly 2 #works best with 2  # popat ,offf;e
        interval = pop!(_stack) # [a,b]
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])

        #goleft!(a, b, interval)  # check first in on left 

        interval = pop!(_stack)
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])

        #    goright!(interval) #check last is on right 
        #
        #   goleft!(a, b, interval)  # check first in on left 

        #endAlgorithmSafely
        #------

    else # > 2 (i.e. 3, 4, or more )
        #oddity 
        isItEven = nothing
        isEven(l) ? isItEven = true : isItEven = false

        # traverse()
        if isItEven == true  # divide by 2 (always )
            n = l // 2 # returns an integer #- turnsout to be the middle 
            #---- n + n = 2n #-------------
            # _stack[0] # first 
            #_stack[n] #middle  # ---- pop this
            res = popat!(_stack, n) # after pop = 2*n -1 = odd 
            res[n][1] # a 
            res[n][2] # b
            # a,b, at their index location 
            kernel(1, n, res, middle)
            #if index = idx then res[offset], 

            #todo: what to do with value (call special kernel function )
            #_stack[2n] # last 
            # _stack[length(_stack)]
            # traverse(0, length(_stack), _stack)
            for i in 1:length(_stack)
                traverse(i, _stack)
            end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is a middle

        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm 

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has a symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals), & 1 interval  
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right() 
        #or can we call directly cause (a la toute suite)

    end

end

#vital 
"""Event-Driven traversal function """
function traverse(id, _stack, kernel=middle!)

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])
        #do cause 
        callCause(id, a, b, interval) #, _stack)

    #cause(interval[id][1], interval[id][b], makeView(_stack, interval[id][1]:interval[id][b]))
    #end endAlgorithmSafely

    elseif l == 2 ##exactly 2 #works best with 2  # popat ,offf;e
        interval = pop!(_stack) # [a,b]
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])
        effect!(a, b, _stack)
        # goleft!(a, b, interval)  # check first in on left 

        interval = pop!(_stack)
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])
        effect!(a, b, _stack)
        # goright!(interval) #check last is on right 

        #
        #=
        interval = pop!(_stack)
        a = indexOf(interval, interval[id][1])
        b = indexOf(interval, interval[id][2])
        effect!(a, b, _stack)
        =#

        #  goleft!(a, b, interval)  # check first in on left 

        #endAlgorithmSafely
        #------

    else # > 2 (i.e. 3, 4, or more )
        #oddity 
        isItEven = nothing
        isEven(l) ? isItEven = true : isItEven = false

        # traverse()
        if isItEven == true  # divide by 2 (always )
            n = l // 2 # returns an integer #- turnsout to be the middle 
            #---- n + n = 2n #-------------
            # _stack[0] # first 
            #_stack[n] #middle  # ---- pop this
            res = popat!(_stack, n) # after pop = 2*n -1 = odd 
            res[n][1] # a 
            res[n][2] # b
            # a,b, at their index location 
            kernel(1, n, res, middle)
            #if index = idx then res[offset], 

            #todo: what to do with value (call special kernel function )
            #_stack[2n] # last 
            # _stack[length(_stack)]
            # traverse(0, length(_stack), _stack)
            for i in 1:length(_stack)
                traverse(i, _stack)
            end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is a middle

        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm 

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has a symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals), & 1 interval  
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right() 
        #or can we call directly cause (a la toute suite)

    end

end

#another whole idea : discard left, right lingo , keep it cause-effect 
#starting range is a cause of potential 2 more effects ( unless length = 1 , )
#Idea(9):
#lcm(9) #9
#gcd(9) #9

#--------
_int = [[1, 3], [4, 7], [8, 9]] # IF ODD : we only care to get the middle (at the median)
#if length(_int) %2 == 0 # length isEven 
idMid = Integer(ceil(length(_int) / 2)) # 2 [casted correctly to 2]
a = _int[idMid][1]#4
b = _int[idMid][2]#7

#kernelFunction(a,b, arr)
# id a,b, interval 

currentVal = nothing

isStoppingCondition(arr, currentVal)  #<--- bottleneck 
#callCause(idMid, 4, 7, _int) # 4:7
arr = makeVector((a:b))
callCause(idMid, a, b, _int) # view error # correct # loop infinity 

#-------
_int = [[1, 3], [8, 9]]
pts = []
idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2}

a = _int[idMid][1] #1 
b = _int[idMid][2] #3
#kernelFunction #1 

a = _int[idMid+idMid][1] # 8 
b = _int[idMid+idMid][2] # 9 


#Ranges
##[1, 2, 3]
##[3, 4, 5, 6, 7, 8]
#----------


#kernelFunction #2
_stack = []
#from points to interval indices , getting the `buns` 
for i in 1:length(_int)
    idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2}

    a = _int[i][1] #1 
    b = _int[i][2] #2
    println("a = ", a, " b = ", b)
    push!(_stack, makeVector((a:b)))

end
#---------
_stack

A = []
#from stack  to point vectors 
for i in 1:length(_stack)

    #idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2}

    println("i = ", i)
    a = _stack[i][1] # first(i)
    b = last(_stack[i]) #last(_stack[i])[2]
    #the goal: get a,b
    #a =  _int[i][1] #1 
    #b = _int[i][2] #2

    println("a = ", a, " b = ", b)
    push!(A, makeVector((a, b)))


end
_stack
A

for i in 1:length(_int)
    # push 
    a = _int[i][1]
    b = _int[i][2]
    push!(pts, a) # every odd has an a value 
    push!(pts, b) # every even has a b value 
end
#------
pts = [] # excellent 

ranges = []
ranges = copy(_stack) # stack has to have at least 2 items for proceeding functions to work 
typeof(_stack)
#-----
#lastB #clue 
a = ranges[1][1]
b = ranges[1][length(ranges[1])] #[2]
_int[1+1][2]
#-------
function rangesToPts(ranges) #checked

    pts = []
    for i in 1:length(_int)
        # push
        a = ranges[i][1]
        b = ranges[i][length(ranges[i])] #[2]
        _int[idMid+idMid][2] #<----------
        println("a = ", a)
        println("b = ", b)
        push!(pts, a) # every odd has an a value 
        push!(pts, b) # every even has a b value 
    end
    return pts
end
arr = makeVector((1:9))
pts = rangesToPts(ranges)

#----- pts manipulation 
_view = nothing # val

# mapPts()
_length = length(pts)
if _length == 2
    _view = makeView(makeVector((pts[1]:pts[2])), pts[1]:pts[2])
    doCompare(pts[1], pts[2], _view)
end

ranges = copy(_stack)
ranges[1]
ranges[2]

a = ranges[1][1]
b = ranges[1][length(ranges[1])]

a2 = ranges[2][1]
b2 = ranges[2][length(ranges[2])]

#=
#pts to range 
for i in 1:Int(length(pts) // 2)
    # push 
    a = pts[i]#[1]
    b = pts[i+1]#[2]
    v = makeVector((a:b))
    push!(ranges, v)
end=#

function ptsToRanges(pts)

    #pts to range 
    ranges = []
    _length = copy(Int(length(pts) // 2))
    for i in 1:_length
        #was 
        #a = pts[i]#[1]
        #b = pts[i+1]#[2]  
        a = pts[i] + 1
        b = pts[i+1] - 1

        v = makeVector((a:b))
        push!(ranges, v)

    end
    return ranges
end
#------
a1 = pts[1]#[1]
b1 = pts[1+1]#[2] #correct was a coincidence #3 

a2 = pts[2]#[1]
b2 = pts[2+1]#[2]

#pts[2+1] - 1

#=plan: pts[2] = 3  #the first point makes a domino effect for the rest of points 

#next range (as of result of  point: pts[2])
aNext = pts[2] + 1 = 4

bNext = pts[2+1] -1 = 7

in general ( )
aNext = pts[i] + 1 

bNext = pts[i+1] -1

#unless last point 
#until 

pts[2+1]  # 8

8 - 1 = 7 
pts[2+1] -1 #7

=#
""" maps indicies to a Array values """
function mapPts(pts, arr::Array{Int64,1})

    vals = []
    _length = length(pts)
    for i in 1:2:_length
        idx = pts[i]
        append!(vals, arr[idx])
        idx = pts[i+1]
        append!(vals, arr[idx])
    end
    return vals
end

"""Event-Driven"""
function mapPts(pts, arr::Array{Int64,1}, i::Int64)

    vals = []
    _length = length(pts)
    # for i in 1:2:_length
    if i <= _length
        idx = pts[i]
        append!(vals, arr[idx])
        idx = pts[i+1]
        append!(vals, arr[idx])
        i = i + 2
    end
    return vals
end


""" maps indicies to a SubArray values """
function mapPts(pts, _view::SubArray)

    vals = []

    for i in 1:length(pts) # _length
        idx = pts[i]

        append!(vals, _view[idx])
    end
    return vals
end

#=
"""Event-Driven"""
function mapPts(pts, _view::SubArray,i)
    vals = []
    _length = copy(length(_view))
   #for i in 1:_length  #length(pts) # _length
    if i<=_length #  i in 1:_length  # if i in 1:_length  if works, instead of for 
        idx = pts[i]

        append!(vals, _view[idx])
        i = i + 1
    end
    return vals , i
end
i=1
vals ,i = mapPts([1,3], [1,2,3,4,5],2)
i=#

#note: _view is related to  _stack (item off it )

# i = length(_stack) # last item 
#=
function f1(_stack)
    _length = length(_stack)
   for i in _stack 

    if length(_stack) > 1
        interval = popat!(stack, i) #interval, each has 2 bounds 
        a = interval[1]
        b = interval[2]
        #make view 
        v = collect(a:b)

        _view = view(v, firstindex(v), lastindex(v)) #new:pass new info 
        #TODO: return false, _view [new information ]

        return false, _view
    elseif length(_stack) == 1
        return true, nothing
    end
end =#
"""Event-Driven """ 
function f1(_stack,i )
_length = length(_stack)

#for i in _stack 
if length(_stack) > 1
    interval = popat!(stack, i) #interval, each has 2 bounds 
    a = interval[1]
    b = interval[2]
    #make view 
    v = collect(a:b)

    _view = view(v, firstindex(v),lastindex(v)) #new:pass new info 
    #TODO: return false, _view [new information ]

    return false , _view
elseif length(_stack) == 1
    return true, nothing
end

"""Event-driven to sort the next element """
function nextSort(a, b, _view::SubArray, i) #a,b, inputs not used #TODO 

    vals = []
    i = euclidDistDifference(a, b)
    #for i in 1:length(pts) # _length
    if i > 1
        # traverve #TODO: 
        #idx = popat!(pts, i) #pts[i]
        append!(vals, _view[idx]) # accumulates 
        i -= 1
    end
    return vals
end

#new #TODO: check 
function mapPts!(pts, arr::Array{Int64,1}, i) # todo sanity check : use of i 

    vals = []

    #for i in 1:length(pts) # _length
    if i > 1
        idx = popat!(pts, i) #pts[i]
        append!(vals, arr[idx]) # accumulates 
        i -= 1
    end
    return vals
end

function mapPts!(pts, _view::SubArray, i) # todo sanity check : use of i 

    vals = []

    #for i in 1:length(pts) # _length
    if i > 1
        idx = popat!(pts, i) #pts[i]
        append!(vals, _view[idx]) # accumulates 
        i -= 1
    end
    return vals
end

(1:2)[1]
view(collect(1:2), 1:2)

function ptToView(singlePt)
    try
        a = -1
        b = -1
        _newView = nothing
        if length(singlePt) == 2
            a = singlePt[1]
            b = singlePt[2]
            # v = makeVector(v,(a:b))
            v = collect(a:b)
            _newView = makeView(a, b)

        else
            throw(error(msg))
        end

        return _newView
    catch UnexpectedError
        @error msg exception = (UnexpectedError, catch_backtrace())
    end

    # fabricate view from points only 
    v = makeVector((1:9))
    v = collect(1:9)
    makeView(v, 1:9)

end

ptToView(1:2)
euclidDistDifference(1, 2)
if euclidDistDifference(1, 2) == 1
    return true
else
    #TODO: View correct Form 
    doCompare(1, 2, makeView(1, 2)) #return false 
end

function ptsToViews(pts) # fixed 

    _views = []
    #iterating on pts 
    #TODO: a way to concatenate first 2 
    _length = copy(Int(length(pts) // 2))
    #_length = length(pts)

    for i in 1:_length
        if euclidDistDifference(pts[i], pts[i+1]) > 1
            a = pts[i]#[1]
            b = pts[i+1]#[2] #<--------
            println("a = ", a)
            println("b = ", b)

            interval = a:b

            # v = makeVector((interval))
            print("v = ", v)
            # _view = makeView(v, v[1]:length(v))

            _view = ptToView(interval)
            println("_view", _view)
            push!(_views, _view)

        elseif euclidDistDifference(pts[i], pts[i+1]) == 1
            _view = makeView(pts[i], pts[i+1])
            doCompare(pts[i], pts[i+1], _view)
        end
    end
    return _views
end

""" transforms points to views,  on a particular view """
#WARNING: does not uses input Arg: _view  #TODO:Fix  
function ptsToViews(pts, _view) # for a particular view #Warning : not uses _view #TODO 

    _views = []
    #iterating on pts 
    _length = copy(Int(length(pts) // 2))
    #_length = length(pts)
    for i in 1:_length
    
        a = pts[i]#[1]
        b = pts[i+1]#[2] #<--------
        println("a = ", a)
        println("b = ", b)
    
        interval = a:b
    
        v = collect(Interval)
        print("v = ", v)
        # _view = makeView(v, _view)
        _view = view(v, _view) #firstindex(v),lastindex(v))  #interval)
    
        _view = ptToView(interval)
    
        println("_view", _view)
    
        push!(_views, _view)
    end
    return _views
end

_view = view(collect(interval), interval)
#depreciate 
function ptsToViews(pts, arr)

    _views = []
    #iterating on pts 
    _length = copy(Int(length(pts) // 2))
    #_length = length(pts)
    for i in 1:_length
        if euclidDistDifference(pts[i], pts[i+1]) > 1
            a = pts[i]#[1]
            b = pts[i+1]#[2] #<--------
            println("a = ", a)
            println("b = ", b)

            interval = a:b
            v = makeVector((interval))
            print("v = ", v)

            _view = makeView(v, arr)
            println("_view", _view)
            push!(_views, _view)
        elseif euclidDistDifference(pts[i], pts[i+1]) == 1
            # TODO: View true form  @
            doCompare(pts[i], pts[i+1], view(collect(pts[i]:pts[i+1]), firstindex(pts[i], lastindex[pts[i+1]])))
        end

    end
    return _views
end

#intact  
function viewsToPts(_views::Vector{Vector{Int64}})#::Vector{Vector{Int64}})

    pts = []
    _length = length(_views) # Int(ceil(length(_views) // 2))
    # _length = copy(Int(length(_views) // 2))
    println("_length = ", _length)
    a = -1
    b = -1
    for i in 1:_length
        #if i + 1 < _length
        a = _views[i][1]#[1]
        b = _views[i][length(_views[i])]#[2]
        println("a = ", a)
        println("b = ", b)
        # end
        #a = _views[i][1]
        #b = length(_views[i])

        push!(pts, a)
        push!(pts, b)
    end

    return pts
end

function viewsToPts(arr)#::Vector{Vector{Int64}})

    pts = []
    _length = length(arr) # Int(ceil(length(_views) // 2))
    # _length = copy(Int(length(_views) // 2))
    println("_length = ", _length)
    a = -1
    b = -1
    for i in 1:_length
        #if i + 1 < _length
        a = arr[i][1]#[1]
        b = arr[i][length(arr[i])]#[2]
        println("a = ", a)
        println("b = ", b)
        # end
        #a = _views[i][1]
        #b = length(_views[i])

        push!(pts, a)
        push!(pts, b)
    end

    return pts
end
#-----------
_int = [[1, 3], [8, 9]]
#typeof(_int)
pts = rangesToPts(_int)# correct order 1389
#Hint: this opens the door for fine point manipulation 
#---pts testing
a1 = pts[1]#[1]
b1 = pts[1+1]#[2] #correct was a coincidence #3 

a2 = pts[2]#[1]
b2 = pts[2+1]#[2]

#----
_views = ptsToViews(pts)#correct order 
length(_views)
#eltype(_views) # Any 
typeof(_views[1])
_views[1][1]#1
length(_views[1])#3 # wrong approach

_view = copy(_views[1]) # unhandeled till now 
copy(_views[2]) # [5 6 7 8]
_view = [_view] # warning : this Must be implemeneted as a singleton 
typeof(_view)
length(_view) # this solution is correct 
#1 2 3
_view = []

ptsNew = viewsToPts(_views) #done  # Erroneous order: 1358 (not 1389) #Logic Problem with V's 2nd range 

#_length = length(_views)

_views[1][1]

_views[2]
_views[2][1]
_views[2][length(_views[2])]
arr
vals = mapPts(pts, arr, 1)

ranges = ptsToRanges(pts)


#-----------
doCompare(2, 4, [1, 2, 3, 4])

if [1, 2, 3, 4][1] > [1, 2, 3, 4][2]
    m1, b, _isSwapped = doCompare(1, 2, [1, 2, 3, 4])
    println("twinMiddles [m1, m2]= ", m1, " ", b, " swapped ")
end
m1

doCompare(1, 4, [1, 2, 3, 4]) # 1 4

if [1, 2, 3, 4][a] > [1, 2, 3, 4][b]
    #a, b, _isSwapped = 
    doCompare(a, b, [1, 2, 3, 4])
    println(" [a, b]= ", a, " ", b, " swapped ")
else
    println("processing failed ")
end

doCompare(1, 2, [1, 2, 3, 4])# 1 2 

if [1, 2, 3, 4][a] > [1, 2, 3, 4][m1]
    a, m1, _isSwapped = doCompare(a, m1, [1, 2, 3, 4])
    println(" [a, m1]= ", a, " ", m1, " swapped ")
end


#println("a, m2, b = ", a, m2, b)

doCompare(3, 4, [1, 2, 3, 4])

if arr[m2] > arr[b]
    m2, b = doCompare(m2, b, [1, 2, 3, 4])
end

arr = [1, 2, 3, 4]
a, b, _isSwapped = doCompare(1, 4, arr)
a, m1, _isSwapped = doCompare(1, 2, arr)
m1, b, _isSwapped = doCompare(2, 4, arr)
m2, b, _isSwapped = doCompare(3, 4, arr)
arr
#----------
lastB = nothing
arr = collect(1:9)
_stack = [[1, 3], [4, 7], [8, 9]]
group = 0
#_length = length(_stack)
interval = nothing
oldInterval = nothing
#for _ in 1:length(_stack)  #_view) 
i = nothing
_length = nothing
#---- start here : 
if _length === nothing # previous value is retained 
    _length = copy(length(_stack))
end
#------ init done 
_length # 3,2 

# i iteration works 
if i === nothing
    i = 1
elseif i !== nothing
    i += 1 # bump its value, by 1 
end

i
group = 1
#increment group 
group += 1 # idea: store retrieve group # vital 
group
#do 
interval

#== nothing by default 
#interval === nothing
#ismissing(interval)

_unionSet = collect((interval[1]:interval[2]))
#UnionAll(oldInterval[2],_unionSet)
totalSet = union(oldInterval[2], _unionSet)
v = makeVector((totalSet[1], totalSet[length(totalSet)]))
#makeView(v,(1,length(v)))
view(v, (1:length(v)))
#union!((oldInterval[2]: _unionSet))

if (interval === nothing) == false #ismissing(interval) ==false #i.e. has a value  #interval !== nothing # on the 2nd, 4th , every even Run # if it has a value (from previous run) # interva==nothing
    oldInterval = interval # store value 
end
interval
oldInterval

#(oldInterval[1], interval[2])
#oldInterval === nothing
#interval === nothing
#interval == oldInterval
#pop first value (load onto interval)
#pop()

interval = popfirst!(_stack) # sequential pop of a stack  # popped value is lost #  decreases _stack by 1 
interval == oldInterval
oldInterval # 1, 3 # 4 7 
interval# 4,7 # 8 9 
oldInterval[2], interval[1], interval[2]
_unionSet = collect(oldInterval[2]:interval[1])
totalSet = union(_unionSet, interval[2])
v = 1:length(totalSet)
view(collect(v), v)
view(collect(v), 1:length(v))
group # should be 1 

#group += 1 

#_view = NewView(oldInterval[1], interval[2])

v = makeVector((oldInterval[1]:interval[2]))# 1 7
_view = makeView(v, (oldInterval[1]:interval[2]))
a, b, m1, m2 = compareBounds(oldInterval, interval, _view) #correct # 1 7 3 4
=#

if group == 2

    # if so compare contents then, reset group 
    #TODO: define _newView (from)

    #    v = makeVector((oldInterval[2], interval[1], interval[2])) #(oldInterval[1]:interval[2]))# 1 7
    #    _view = makeView(collect((oldInterval[2]:interval[1]:interval[2])), (oldInterval[2], interval[1], interval[2]))

    # view(collect(v), v)

    v = 1:length(totalSet)
    _view = view(collect(v), 1:length(v))
    a, b, m1, m2 = compareBounds(oldInterval[2], interval[1], interval[2], _view) # compare interval bounds 
    println("a = ", a, " b = ", b, " m1 = ", m1, " m2 = ", m2)
    group = 0 # reset group 
end

#arr = collect(1:9) #1:9
group
_length # 3
#decrement _length # end of current loop 
_length -= 1 # decrement length (_stack ) at end (or on each time measure _stack , no
#continue applying this logic, becuase there's a logical check up ahead about current length ) - more practical 
#end
#at the end i.e. _length == 0 
_length#2
v = makeVector((lastB, interval[2]))
#v = makeVector((lastB:interval[2]))
#lastB #7 # 1 3 
#interval[2]#3
interval #1 3
oldInterval
lastB = interval[2]

#v
#_view = makeView(v, (lastB:interval[2]))
#_view = makeView(v, lastB:interval[2])
#_view = makeView( lastB:interval[2],v) # wong 
#makeView(lastB, interval[2])

v = collect((lastB:interval[2]))
#if length(v ) == 1 #TODO: if scalar Then return 

_view = view(v, firstindex(v), lastindex(v)) 



_view = view(v,firstindex(v):lastindex(v))  #view(v,firstindex(v),lastindex(v))

_view # 7 8 9 #TODOD: it should be 7 8 9 (Got only 5 !)

#v[1], v[2], [v3] # indices : 1 2 3 
#a, b, m1 = compareTriad(v[1], v[2], v[3], _view)

a = indexOf(v, v[1])
m1 = indexOf(v, v[2])
b = indexOf(v, v[3])
a, b, m1 = compareTriad(a[1], m1[1], b[1], _view)
oldInterval
interval

#TODO: report back new information ( _view ) to its function 
if group == 1 && _length == 0 #i == _length - 1 # && reached the end i.e.  #<------

    #issue: previous value (of _stack)
    #lastB = getlastB(_stack)
    lastB = oldInterval[2]

    # lastB iwth interval[2]
    #compareTriad(lastB,interval[1], interval[2]) #TODO: store return 
#points : lastB, interval[2]
    #compare() # compareTriad  : lastB , interval[1], interval[2]
    #generate _view : from lastB to interval[2]
    #makeView()
    #makeView()
    #make a view 
#correctly compile 
     v = collect(lastB:interval[2]) # 1 7 # 7 8 9
    #   _view = makeView(v, (lastB:interval[2]))

    #    _newView = newView(lastB, interval[2])
    v1, v2 = remap(lastB, interval[2]) #TODO: check its usefulness 
    v = collect(v1:v2)
    _view = view(v, firstindex(v):lastindex(v))

    a, b, m1 = compareTriad(lastB, interval[1], interval[2], _view) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
    group = 0
    return a, b, m1
end

#----------
## Comparing two intervals of a stack 

function compareIntervals(_stack, _newView::SubArray, interval, oldInterval, group=0) # _view)#misspecification error  # TODO: 

    # group = 0
    #interval = nothing
    #oldInterval = nothing

    if _length === nothing

        _length = copy(length(_stack))
    end
    if i === nothing
        i = 1
    end

    for _ in 1:length(_stack)  #_view) 
        group += 1
        #do 
        if (interval === nothing) == false #ismissing(interval) ==false #i.e. has a value  #interval !== nothing # on the 2nd, 4th , every even Run # if it has a value (from previous run) # interva==nothing
            oldInterval = interval # store value 
        end

        interval = pop!(_stack) # sequential pop of a stack  
        #-----
        group += 1
        # _view = NewView(oldInterval[1], interval[2])
        v = makeVector((oldInterval[1]:interval[2]))# 1 7
        _view = makeView(v, (oldInterval[1]:interval[2]))
        a, b, m1, m2 = compareBounds(oldInterval, interval, _view)
        #------
        if group == 2
            # if so compare contents then, reset group 

            #TODO: define _newView (from)

            a, b, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
        end

    end
    _length -= 1 #decrement by 1 
    #finally last check if group = 1
    if group == 1 && _length == 0 #i==_length-1 # && reached the end i.e. 

        lastB = getlastB(_stack)

        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]
        #makeView()
        #makeView()
        _newView = newView(lastB, interval[2])

        #Compare() # compareTriad 

        #-----
        #make a view (with a proper remapping )

        a = indexOf(v, v[1])
        m1 = indexOf(v, v[2])
        b = indexOf(v, v[3])
        a, b, m1 = compareTriad(a[1], m1[1], b[1], _view)

        #-----
        group = 0
        return a, b, m1
    end
end

function compareIntervals(_stack, _newView::SubArray, interval=nothing, oldInterval=nothing, group=0, i=0) # _view)#Misspecification error  # TODO: 

    #= group = 0
    # interval = nothing
    # oldInterval = nothing
    #if _length === nothing =#

    _length = copy(length(_stack))
    #end
    if i === nothing
        i = 1
    end
    #for _ in 1: _length #length(_stack)  #_view) 
    if i <= _length - 1
        group += 1
        #do 
        if interval !== nothing # on the 2nd, 4th , every even Run # if it has a value (from previous run)
            oldInterval = interval # store value 

        end
        interval = pop!(_stack) # sequential pop of a stack  

        if group == 2
            # if so compare contents then, reset group 

            #TODO: define _newView (from)

            a, b, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
        end

    end

    #finally last check if group = 1
    _newView = NewView(1, _length - 1) #<--------------
    compareIntervals(_stack, _newView)
    if group == 1

        lastB = getlastB(_stack)

        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]
        #makeView()
        #makeView()
        _newView = view(lastB:interval[2], (lastB, interval[2]))

        #Compare() # compareTriad 
        a, b, m1 = compareTriad(lastB, interval[1], interval[2], _newView) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
        group = 0
        return a, b, m1
    end
end
#### _newView = view(collect(lastB[:]:interval[2]), (lastB[:], interval[2]))
v = makeVector((1:9))
#collect(lastB[1:length(lastB)],interval[2])
collect((lastB[1], lastB[2], interval[2])) #fixes it 
lastB
#ISSUE: lastB is a vector , not a scalar 


view(v, (1:9))
#view(v, (1,9))
#view(v, (1, 9))
compareIntervals(_stack, _newView::SubArray, interval=nothing, oldInterval=nothing, group=0, i=0) #TDOD: check correctness 

compareIntervals(_stack, arr, nothing, nothing, 0)
arr

#--------------
#check inputs 
_stack
interval = nothing
compareIntervals(_stack, _View, interval, oldInterval, group, _length)
compareIntervals(_stack, arr, 1) # compile error 

function compareIntervals(_stack, arr::Array{Int64,1}) #vital 
    group = 0
    interval = nothing
    oldInterval = nothing
    a = -1
    b = -1
    m1 = -1
    m2 = -1
    #for _ in 1:length(_stack)
    _length = copy(length(arr))
    i = 1
    if i <= _length - 1
        group += 1
        #do 
        if interval !== nothing
            oldInterval = interval
        end
        interval = pop!(_stack)

        if group == 2
            # if so  then, reset group 
            a, b, m1, m2 = compareBounds(oldInterval, interval, arr) #<-----
            group = 0
            return a, b, m1, m2
        end

    end
    #finally last check if group = 1
    if group == 1 # done 

        lastB = getlastB(_stack) # TODO: 
        #interval 
        a, b, m1 = arr[lastB] > arr[interval[2]] ? compareBounds(lastB, interval[1], interval[2], arr) : return #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr 
        group = 0 # reset group 
        return a, b, m1
    end
    _newView = NewView(1, i)
    compareIntervals(_stack, _newView)
end
_stack
length(_stack)

function compareIntervals(_stack, arr::Array{Int64,1}, i::Int64) #vital #compiles 
    group = 0
    interval = nothing
    oldInterval = nothing
    a = -1
    b = -1
    m1 = -1
    m2 = -1
    _length = copy(length(_stack))

    #  i += 1  #1 #TODO: increment 
    if i == length(_stack) #- 1
        return
    else

        # for _ in 1:length(_stack)
        group += 1
        #do 
        if interval !== nothing
            oldInterval = interval
        end
        interval = pop!(_stack)

        if group == 2
            # if so  then, reset group 
            a, b, m1, m2 = compareBounds(oldInterval, interval, arr)
            group = 0
            return a, b, m1, m2
        end

    end
    #  _newView = view(1, _length)
    newView
    print(_length)
    v = collect((1:_length))  #makeVector((1:_length))
    _newView = makeView(v, i)
    #return compareIntervals(_stack,_newView)
    #finally last check if group = 1
    if group == 1 # done 

        lastB = getlastB(_stack)
        #interval 
        a, b, m1 = compareBounds(lastB, interval[1], interval[2], arr) #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr 
        group = 0 # reset group 
        return a, b, m1
    end
    i = i + 1
    return compareIntervals(_stack, _newView)
end
function compareIntervals(_stack, arr::Array{Int64,1}, oldInterval=nothing, interval=nothing, group=0, i=0::Int64) #vital #compiles 
    # group = 0
    # interval = nothing
    # oldInterval = nothing
    a = -1
    b = -1
    m1 = -1
    m2 = -1
    _length = copy(length(_stack))

    #  i += 1  #1 #TODO: increment 
    if i == 1 #length(_stack) #- 1
        return
    else
        # for _ in 1:length(_stack)
        group += 1
        #do 
        if interval !== nothing
            oldInterval = interval
        end
        interval = pop!(_stack)

        if group == 2
            # if so  then, reset group 
            a, b, m1, m2 = compareBounds(oldInterval, interval, arr)
            group = 0
            return a, b, m1, m2
        end
        #finally call next  , subarrayy


    end
    #  _newView = view(1, _length)
    length(arr)
    newView
    print(_length)
    # v = collect((1:_length))  #makeVector((1:_length))
    # _newView = makeView(v, i)
    #return compareIntervals(_stack,_newView)
    #finally last check if group = 1
    if group == 1 # done 

        lastB = getlastB(_stack)
        #interval 
        a, b, m1 = compareBounds(lastB, interval[1], interval[2], arr) #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr 
        group = 0 # reset group 
        return a, b, m1
    end
    i = i + 1
    v = collect((1:_length-1))  #makeVector((1:_length))
    #_newView = makeView(v, i)
    _newView = view(v, (1:_length-1)) #length(arr - 1))
    return compareIntervals(_stack, _newView)
end
_stack

compareIntervals([[1, 3], [4, 7], [8, 9]], arr, 1)
arr
#view(v,(1, 3))


A = compareIntervals(_stack, arr)
_stack = [[1, 3], [4, 7], [8, 9]]
#---------
group = 0
interval = nothing
oldInterval = nothing
a = -1;
b = -1;
m1 = -1;
m2 = -1;
#for _ in 1:length(_stack)
_length = copy(length(arr))
i = 1
if i <= _length - 1
    group += 1
    #do 
    if interval !== nothing
        oldInterval = interval
    end
    interval = popfirst!(_stack)

    if group == 2
        # if so  then, reset group 
        a, b, m1, m2 = compareBounds(oldInterval, interval, arr) #<-----
        group = 0
        return a, b, m1, m2
    end

end
#finally last check if group = 1
if group == 1 # done 

    lastB = oldInterval[2] #getlastB(_stack) # TODO: 
    #interval 
    make
    a, b, m1 = compareBounds(lastB, interval[1], interval[2], arr) #arr[lastB] > arr[interval[2]] ?  : return #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr 
    group = 0 # reset group 
    return a, b, m1
end
v = makeVector((lastB, interval[1], interval[2]))
_view = makeView(1, v[length(v)])
interval# 4 7 
oldInterval#1 3
#---------
A
_stack = [[1, 3], [4, 7], [8, 9]]
res
res = compareIntervals(_stack, arr)
res
_stack = [[1, 3], [4, 7], [8, 9]]
arr
res = compareIntervals(_stack, arr)# 7, 9, 8, 4  a,b ,m1, m2 ; should've been 1, 9,  
res
arr
_stack #stack should be nothing
print(res)
# missionAccomplished  - for 

#--------------------
_stack
length(_stack)
#Requires _stack 
length(_stack)
#_stack[length(_stack) -1]

#### _[]
length(_stack) - 1 # if == 0  -isa-> terminal condition return 
length(_stack)
_stack[1]# [8,9]

_stack[1][1]
_stack[1][2]

_stack[2][1]
_stack[2][2]


_stack[length(_stack)-1][2] # before last 

#TODO: how to get b of previous interval


#---------------

#extremely experimental functions  # vital
"""Event-Driven: compares a bounds in ranges of a Vector arr """
function boundComparisonCondition(ranges, _view, i)
    try
        # for i in 1:length(ranges)
        _last = copy(length(ranges))
        a = max(ranges[i-1][_last])
        b = min(ranges[i][1])
        contentSwapped = nothing
        if i >= 1 && a < b # max(lastRange) # if i>=1

            a, b, contentSwapped = doCompare(a, b, _view)
            #return a, b, contentSwapped
        else
            throw(error(msg))
        end
        return a, b, contentSwapped
        #end
    catch UnexpectedError
        @error msg exception = (UnexpectedError, catch_backtrace())
    end
end

max(ranges[i-1][2])
b = min(ranges[i][1])

_last = copy(length(ranges) - 1)

"""Recursive function : compares a bounds in ranges of a Vector arr """
function boundComparisonCondition(ranges, arr) # promising 
    try
        # for i in 1:length(ranges)
        _length = legnth(arr)
        i = _length
        if i == 1
            return
        end
        _last = copy(length(ranges) - 1)

        a = max(ranges[i-1][_last])
        b = min(ranges[i][1])
        contentSwapped = nothing
        if i >= 2 && a < b # max(lastRange) # if i>=1
            a, b, contentSwapped = doCompare(a, b, arr) # <-----------
        #  return a, b, contentSwapped

        else
            throw(error(msg))
        end
        _view = view(collect(1:_length-1), 1:_length-1)
        return boundComparisonCondition(ranges, _view) #a, b, contentSwapped
    catch UnexpectedError
        @error msg exception = (UnexpectedError, catch_backtrace())
    end

end

"""Recursive function : compares a bounds in ranges of a Vector _view """

function boundComparisonCondition(ranges, _view) # promising 

    try
        # for i in 1:length(ranges)
        _length = legnth(_view)
        i = _length
        if _length == 1
            return
        end
        _last = copy(length(ranges) - 1)

        a = nothing
        b = nothing
        contentSwapped = nothing
        if i >= 2 && a < b # max(lastRange) # if i>=1
            a = max(ranges[i-1][_last])
            b = min(ranges[i][1])
            a, b, contentSwapped = doCompare(a, b, _view) # <-----------
        #  return a, b, contentSwapped

        else
            throw(error(msg))
        end
        _view = view(collect(1:_length-1), 1:_length-1)
        return boundComparisonCondition(ranges, _view) #a, b, contentSwapped
    catch UnexpectedError
        @error msg exception = (UnexpectedError, catch_backtrace())
    end

end
ranges
boundComparisonCondition(ranges, view(collect(1:9-1), 1:9-1))
popfirst!(ranges)
#ranges[i] #3 # [8 9]
#ranges[i-1] #2 [ 4 7]
#ranges[1]  # [ 1 3]

#### ran
ranges = [[1, 3], [4, 7], [8, 9]]
popfirst!(ranges)

ranges[1][1]
ranges[1][2]
boundComparisonCondition([[1, 3], [4, 7], [8, 9]], [1:9], 2)# start from 2 at least 

#highly experimental 
function f(_sets, arr) # O = length(_sets)

    for i in 1:length(_sets)   # O = length(_sets)


        # ptsToRanges() # requires pts # TODO: 

        # compare every set's bounds 
        #finally , compare contents  at ranges 
        boundComparisonCondition(ranges, arr, i)

    end

end


function minimax(_sortedInterval1, _sortedInterval2, _unsortedInterval, arr)

    a = _unsortedInterval[1]
    b = _unsortedInterval[2]
    #1. sort a,b , locally , so that a : local min, b: local max 
    a, b, contentSwapped = doCompare(a, b, _unsortedInterval)

    # locally sort _unsortedInterval elemts pairwise with their sorted counterparts 
    a, _sortedInterval1[2], _sortedInterval2[2] = compareTriad(a, _sortedInterval1[2], _sortedInterval2[2], arr)

    b, _sortedInterval1[1], _sortedInterval2[1] = compareTriad(b, _sortedInterval1[1], _sortedInterval2[1], arr)



end 

"""combines 2 different locally sorted, intervals, with an unsorted Interal """ 
function minimax(_sortedInterval1, _sortedInterval2, _unsortedInterval, arr)

    # unsorted component underquested
    #1. locally sort the unsorted Interval  
    a = _unsortedInterval[1] #aContent  (min of first interval )
    b = _unsortedInterval[2]# bContent  (max of 2nd interval )
    #1. sort a,b , locally , so that a : local min, b: local max 
    a, b, contentSwapped = doCompare(a, b, _unsortedInterval)

    #2. builds custom _arr dynamically (from the limited infor about sorted Intervals) 
    _arr = collect(_sortedInterval1:_sortedInterval2) #try collect 
    if _arr == []  # if for some reason content hasn't been collected (due to non-ordered items)
        _arr = collect(_sortedInterval2:_sortedInterval1) # collect,in  the other direction 
    end
    _arr # array of indiciees (not yet loaded with values)
    #TODO: to continue load all elements _arr with value from _sorter
    # locally sort _unsortedInterval elemts pairwise with their sorted counterparts 

    #first crossroad 
    #1. either calculate the foloowing 2  (hoping the rest goes well)
    a, _sortedInterval1[2], _sortedInterval2[2] = compareTriad(a, _sortedInterval1[2], _sortedInterval2[2], _arr)

    b, _sortedInterval1[1], _sortedInterval2[1] = compareTriad(b, _sortedInterval1[1], _sortedInterval2[1], _arr)

    # P.s: compareTriad: returns an index

    # or, as an online learning of location, we can , logiclly infer location,correctly
    #how: by inferring 
    lower = _sortedInterval1[1] # lowerContent 
    upper = _sortedInterval2[2]# upperContent 
    a = _arr[a]
    inferLocation(lower, upper, a) # compare contents 
    b = _arr[b]
    inferLocation(lower, upper, b)


end 

#=
either we compare the 3 contents on their on, once & for all [classic]
or, we can online learn x's location from already mde predicates [dynamic]
=#

## Infer location of three point 

""" quantitatively, compare values , returns a qualitative value """
function inferLocation(a, b, x) #TODO: 
    
    try # the classical approach (compare all 3 at same time )
      #  newLocation 
        if x > a && x > b #x is max
        return a,b,x 
        elseif x > a && x < b #x is in between 
            return a,x,b
        elseif x < a && x < b # x is the min 
            return x,a,b
        elseif x == a || x == b
            throw(error("Different Bounds are equal "))
        end
        #or, 2nd possibility  #TODO: Complete 
    #=
        if x<a # if x is less than the Min -> min = x 
        elseif x >b # if x is larger than Max -> max = x 
        else #it should be in between
        if 
    =#
    catch BoundsEqualError
        @error "BoundsEqualError :Different Bounds are equal " (BoundsEqualError, catch_backtrace())
    end

end 


function inferLocation(a, b, x, arr ) #TODO: use arr content 
    
    try
       # newLocation
        if x > a && x > b #x is max
            return a, b, x
        elseif x > a && x < b #x is in between 
            return a, x, b
        elseif x < a && x < b # x is the min 
            return x, a, b
        elseif x == a || x == b
            throw(error("Different Bounds are equal "))
        end
    catch BoundsEqualError
        @error "BoundsEqualError :Different Bounds are equal " (BoundsEqualError, catch_backtrace())
    end

end 
# we don't knowif a , b are the actual bounds 
# what we know for sure: a,b are sorted and in the right order 
#=
each item has to be replaced: a b c 

each move transition from oldIndexlocation, to a new onr 

given that we already inferred 

new location is rithre 

a b x 

a x b 

x a b 
=#

#requires: indexOf 
function updateLocation(a, b, x, newlocation, arr) #sophisticated 
    aIndex = indexOf(arr, a)[1] # arr[indexOf(arr, a)[1]] # == a
    bIndex = indexOf(arr, b)[1] #arr[indexOf(arr, b)[1]]
    #logically: 
    aIndex < bIndex && arr[aIndex] < arr[bIndex] == true #always

    newXIndex = IndexOf(newlocation, x)[1] # give the only clue for location 
    _XContent = newlocation[newXIndex]
    oldXindex = indexOf(arr, _XContent) #Warning if you pop; locations wll be misused  #TODO: check


    if newXIndex == 1 # it's min, should be are the start 
        insert!(arr, aIndex, _XContent)
    elseif  newXIndex == 2 # in the middle 
         insert!(arr, aIndex+1, _XContent)

    elseif newXIndex == 3 # the max # add at the end 
        insert!(arr, bIndex, _XContent)
    end
        #newXContent = newlocation[IndexOf(arr, x)[1]] # can be 1 , 2, or 3 
    # oldxIndex = arr[indexOf(arr, x)[1]]
    #indexOf(arr, a)
end 

arr
#[1 7 ] = [a b ]
# 

updateLocation(1,7, ) #TODO: complete

collect(4:1)# []
collect(1:4)

#==#



# Divide Conquer Strategy 

_stack
function fRecurse(_stack, kernel)

    _length = copy(length(_stack)) #check if _stack is defined # rf n
    a = nothing
    b = nothing
    count = 0
    popped = -1

    if _stack == []
        return
    elseif _length > 0

        count += 1  #increment count 
        popped = popfirst!(_stack)

        a = firstindex(popped)
        b = popped[length(popped)]

        # _view = view(collect(a:b), a:b) #main _view  #generatef 
        m1, m2, isWhole = kernel(a, b)#, _view)
        # conquer(m1,m2,isWhole,_view)
        conquer(popped, kernel) # partitions & sorts 
        fRecurse(_stack, kernel)

    else
        throw(error(msg))
    end

end
#------

function conquer(interval, kernel=middle)

    #  count = 0
    a = firstindex(interval)
    b = interval[length(interval)]

    #_view = view(collect(a:b), a:b)

    # count += 1 
    m1, m2, contentSwapped = kernel(a, b) #, _view)
    # handle: m1,m2 
    #-------

    #---------
    res = doCompare(m1, m2, ptsToView(m1, m2))
    if res === nothing
        return
    end
    #handle a m1 
    if euclidDistDifference(a, m1) > 0 #1 #? 
        kernel(a, m1) #, view(collect(a:m1), a:m1)) #: return 
    end
    leftDist = euclidDistDifference(a + 1, m1 - 1)
    if leftDist > 1
        2 # ? 
        conquer(collect(a+1:m1-1), kernel) # : return 0

    elseif leftDist == 1
        compareQuartet(a, a + 1, m1 - 1, m1, view(collect(a:m1), a:m1))

    elseif leftDist == 0 # scalar # pick any one of two indicies 
        compareTriad(a, a + 1, a + 2, view(collect(a:a+2), a:a+2)) # compare its Nearest neighborhood 

    end
    #this part exactly 
    if euclidDist(m1, m2) == 1
        compareQuartet(m1 - 1, m1, m2, m2 + 1, view(collect(m1-1:m2+1), m1-1:m2+1))
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
    end
    rightDist = euclidDist(m2, b)
    if rightDist > 1 #? 
        kernel(m2, b) #, view(collect(m2:b), m2:b)) #: return 
    end

    if euclidDist(m2 + 1, b - 1) > 2 #? 
        conquer(collect(m2+1:b-1), kernel) #: return 
    elseif euclidDist(m2 + 1, b - 1) == 1
        compareQuartet(m2, m2 + 1, b - 1, b, collect(m2:b))
    else
        throws(error(msg))
        #
    end

end

euclidDistDifference(2, 3)


v = collect((2:3))
res = remap(v[1], v[length(v)])

view(v, res[1]:res[length(res)])

#TODO: check where it's implemeneted, & p[gdut then f]
view(v, firstindex(res[1]):firstindex(res[length(res)])) #compiles no bugs


function ptsToView(a, b)

    _length = euclidDistDifference(a, b)

    if _length == 0 # a == b (return either element)
        return a #getLastElement(a, b) 
    elseif _length == 1 #|| _length == 0
        v = collect(a:b)
    
        _view = view(v, firstindex(v): lastindex(v))
        #v1, v2 = remap(v[1], v[length(v)])
        doCompare(a, b, _view) #view(v[1], v[length(v)]))
    else
        v = collect(a:b)
        return view(v, firstindex(v): lastindex(v)) # remap(a,b) #TODO: check usefulness 
    end

end
#-----

#------
#_view = view(collect(2:3), 2:3)
#_view = view([2, 3], 2:3)

_view = collect((2, 3))

compareBounds(2, 3, _view)
#=
    if euclidDist(m2 + 1, b - 1) > 2 #? 
        conquer(collect(m2+1:b-1), kernel) #: return 
    elseif euclidDist(m2 + 1, b - 1) == 1
        compareQuartet(m2, m2 + 1, b - 1, b, collect(m2:b))
    else
        throws(error(msg))
        #og
    end
=#

fRecurse([[1, 3], [4, 7], [8, 9]], middle)
#=
a,b =1 3
sum = 4
iseven  = true
mid( sum / 2) = 2.0

=#
length([1, 2])
[1, 2][length([1, 2])]

p = popfirst!([[1, 3], [4, 7], [8, 9]])
p[1]
#creating a view 
v = collect(2:3)

#True fundemental issue : 
#ERROR: ArgumentError: invalid index: (1, 2) of type Tuple{Int64, Int64}
#bug when euclidDist(2,3) == 1 

#since 2:3, only  2 is correct i.e.e  
#correct form 

v = collect(2:3)
view(v, v[1])



view(collect((2:3)), 2) # view is correct 

#
#view(collect((2:3)), 3) # non existent 

#view(collect((2:3)), remap(2,3)) # view is correct 

doCompare(2, 3, [2, 3]) #<-----------
#-----
#  count = 0
interval = (1, 5)
a = firstindex(interval)
b = interval[length(interval)]

#_view = view(collect(a:b), a:b)
m1
m2
ptsToView(m1, m2)
ptsToView(m1, m1)#nothing # it should be single 1 element view 
# count += 1 
m1, m2, contentSwapped = middle(a, b) #, _view)
# handle: m1,m2 
collect(m1:m2)
doCompare(m1, m2, ptsToView(m1, m2))
#handle a m1 
a
m1
euclidDist(1, 3)

#TODO: Reflect changes in a corresponding function 
if euclidDistDifference(a, m1) > 1 #? 
    middle(a, m1) #, view(collect(a:m1), a:m1)) #: return 
end
leftDist = euclidDistDifference(a + 1, m1 - 1) # 0 : scalar 
if leftDist > 2 # ? 
    conquer(collect(a+1:m1-1), kernel) # : return 0

elseif leftDist == 1
    compareQuartet(a, a + 1, m1 - 1, m1, view(collect(a:m1), a:m1))

elseif leftDist == 0 # scalar #pick any one of two indicies 

    doCompare(a, a + 1, ptsToView(a, a + 1))
    # compareTriad(a, a + 1, a + 2, view(collect(a:a+2), a:a+2)) # compare its Nearest neighborhood 

end
#this part exactly 
m1
m2
euclidDist(m1, m2)
euclidDistDifference

#---------------
#compiles 

euclidDistDifference
#added compareBounds
function isUnitDistanceReached(a, b)

    if euclidDistDifference(a, b) == 1  #TODO: chage inside the function 
        return true
    else
        v = collect(a:b)
        #_view = view(v, firstindex(v):lastindex(v))
        m1, m2, _contentSwapped = middle(a, b) #a - 1, a, b, b + 1, _view)
        compareBounds(m1, m2, v)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end


end
function isUnitDistanceReached(a, b, kernel)

    if euclidDistDifference(a, b) == 1  #TODO: chage inside the function 
        return true
    else
        v = collect(a:b)
        _view = view(v, firstindex(v):lastindex(v))
        #check the bounds' sanity check #TODO:
        kernel(a - 1, a, b, b + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end


end

function isEndReached(a, b, kernel)

    if euclidDistDifference(a, b) == 0 #1  #TODO: chage inside the function 
        return true
    else
        v = collect(a:b)
        _view = view(v, firstindex(v):lastindex(v))
        kernel(a - 1, a, b, b + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end


end

function isEndReached(a, b)

    if euclidDistDifference(a, b) == 0 #1 #TODO: chage inside the function 
        return true
    else
        v = collect(a:b)
        _view = view(v, firstindex(v):lastindex(v))
        compareQuartet(a - 1, a, b, b + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end


end

#---------------

if isEndReached(1, 3) == false
    return false
end
isEndReached(1, 1)

#----------------

if euclidDistDifference(m1, m2) == 1 #TODO: chage inside the function 
    return true
else
    compareQuartet(m1 - 1, m1, m2, m2 + 1, view(collect(m1-1:m2+1), m1-1:m2+1))
    # kernel(m1, m2, view(collect(m1:m2), m1:m2))
end

m2
b

firstindex(v)
lastindex(v)
v
v = collect(m2:b)
_view = view(v, firstindex(v):lastindex(v))
#------
#TODO: Apply in a function 
rightDist = euclidDistDifference(m2, b)

if rightDist > 1 #? 
    middle(m2, b) #, view(collect(m2:b), m2:b)) #: return 

elseif rightDist == 1
    v = collect(m2:b)
    _view = view(v, firstindex(v):lastindex(v))

    doCompare(m2, b, _view)

end

#3 #TODO: try out  #Error 

n, m = nothing  #MethodError: no method matching iterate(::Nothing)#thrown when 2 (or more) vars has recieved null return -nothing 
n
m

m2
m2 + 1
b - 1
b
#Note: m2 == b-1 ==4 ; m2+1 ==b ==5  then its only 2 points m2, m2+1

v = collect(m2:m2+1)
_view = view(v, firstindex(v): lastindex(v)) # BoundsError: attempt to access 2-element Vector{Int64} at index [1, 2] #lesson learned [x1 x2]
m2 == b - 1 && m2 + 1 == b ? doCompare(m2, m2 + 1, _view) : compareQuartet(m2, m2 + 1, b - 1, b, _view)

#---- 
a = m2 + 1, b = b - 1
#-----
# orphaned Code Block compiles inputArguments()
if euclidDistDifference(m2 + 1, b - 1) > 2 #? 

    conquer(collect(m2+1:b-1), kernel) #: return 
elseif isUnitDistanceReached(m2 + 1, b - 1) == true #1  # euclidDistDifference(m2 + 1, b - 1) == 1

    v = collect(m2:b)
    _view = view(v, firstindex(v):lastindex(v))
    # compareQuartet(m2, m2 + 1, b - 1, b, _view) # <------------------ indexed_iterate(I::Nothing, i::Int64)
    v1 = collect(m2:m2+1)
    _view1 = view(v1, firstindex(v1):lastindex(v1)) # BoundsError: attempt to access 2-element Vector{Int64} at index [1, 2] #lesson learned [x1 x2]
    m2 == b - 1 && m2 + 1 == b ? doCompare(m2, m2 + 1, _view1) : compareQuartet(m2, m2 + 1, b - 1, b, _view)
    #infer information : a = m2+1 , b = b-1

elseif isEndReached(1, 1) #euclidDistDifference(m2 + 1, b - 1) == 0 # scalar 
    return true #isEndReached(m2, b)
else
    throws(error(msg))
end

# using isEndReached

if euclidDistDifference(a, b) == 1 #(m2, b) == true


else

end
isEndReached(1, 1)

isUnitDistanceReached(1, 2)
