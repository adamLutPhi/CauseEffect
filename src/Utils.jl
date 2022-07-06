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

#
## Issue: with makeVector (reason: v's output is interesting, but erroneous )
## idea: checkCond is calling them 

### the thing : no direct relationship with index 
### solution: look for a higher order function that is calling them 

#= 
Use only a generic _stack , with you pop the next arbitrary interval, 
and redo the same thing on , call kernel function, partition & Sort 

# Correct-Form of view:

view(v, firstindex(v[1]):lastindex(v[length(v)]))

#check all views 

update: euclidDist( bug 
# check all euclidDist values 
#lesson learned :always check: length(_view)  === Nothing return -1 first-thing


=#
#TODO: compareIntervals, recursively 

import Base: @propagate_inbounds
global msg = "Unexpected Error"

#--------

euclidDist(a::Int64, b::Int64) = 0 <= a && 0 <= b ? abs(max(a, b) - min(a, b)) + 1 : 0 #+ 1 : 0 #-1 #both a,b > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset
#euclidDistDifference(a::Int64, b::Int64) = 0 <= a && 0 <= b ? abs(max(a, b) - min(a, b)) : 0 #+ 1 : 0 #-1 #both a,b > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset
euclidDistDifference(a::Int64, b::Int64) = 0 < a && 0 < b ? abs(max(a, b) - min(a, b)) : 0 #+ 1 : 0 #-1 #both a,b > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset

#euclidDist(3, 1)

euclidDist(3, 1) #+ 1 # 1 2 3  #valid value 

#euclidDist(3, 1)

function intervalLength(a, b)

    return a + b - 1
end

"""Another variation of intervalLength (): this intervalLength is vaid , under context of sum """
function intervalLength2(a, b)

    return a + b  #- 1
end

#intervalLength(3,1)



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

# isEven 

"""checks the Evenity of a numuber , via modular arithmetic """
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

#---------
# sumInterval
#scaffolding function 
"""calculates the Sum of Indicies""" #scaffold
sumInterval(a::Int64, b::Int64) = a > 0 && b > 0 ? abs(b) + abs(a) : 0


#----

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


intervalLength(1, 3) #sumInterval(1,3)
#intervalLength2(1,3) Wrong, remove it,Please 

intervalLength(1, 10)

1:2
(1:2)[1]
(1:2)[length(1:2)]

(1:2)[1]:(1:2)[length(1:2)]
collect(1:2)

euclidDist(1, 3) #3 # for remap  #TODO: use it for any remap 
euclidDistDifference(1, 3) # for remap2 #euclidDistDifference(1, 3) #TODO: 2 # use it for any remap2  # its context is to subtract 
#i.e. TODO: to be replaced by -(1,3)

#-------

#Done 

#Hint: Question the Need for a remap:

# checkNextView 

## next View, from a view, alont 
"""main:  checks from from only a view """
function checkNextView(_view)
    if length(_view) === Nothing
        return -1
        #but a view can be at least 3(makes senselength  3->1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) >= 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed))
        a = firstindex(_view)
        b = lastindex(_view)

        println("firstindex(x)+1:lastindex(x)-1", firstindex(x)+1:lastindex(x)-1)
        x = collect(a:b)
        return view(x, firstindex(x)+1:lastindex(x)-1)
    end
end

""" specific: for a given bounds a, b, calculates the next view """
function checkNextView(_view, a, b)
    if length(_view) === Nothing
        return -1
        #but a view can be at least 3(makes senselength  3->1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) >= 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed))
        println("firstindex(x)+1:lastindex(x)-1", firstindex(x)+1:lastindex(x)-1)
        x = collect(a:b)

        return view(x, firstindex(x)+1:lastindex(x)-1)
    end
end
#-------
#-----------
# doCompare

## doCompare: compare two indicies, on a vector Array 
#index, value space  [vital]
#requires: oldSchoolSwap
## BoundsError: attempt to access 2-element view(::Vector{Int64}, 1:2) with eltype Int64 at index [3]
@inline function doCompare(a, b, arr::Array{Int64,1}) #works 

    #[1...8] length = 8+1 -1 = 8 

    _length = copy(length(arr))

    if a < _length && b < _length && a >= 0 && b >= 0 # && b >= m2 # if a <= _length && b <= _length 
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
        return   #getLastElement2(a, b)

    end
end
## doCompare: compare two indicies, on a view 
#--------------

#index, value space  [vital]
@inline function doCompare(a, b, _view::SubArray) # 9-8
    _length = copy(length(_view)) #ok 
    if a == b # scalar 
        # v = collect(a:b)
        # _view = view(v, firstindex(v):lastindex(v))
    
        return a, a, nothing
    elseif a < _length && b < _length && a >= 0 && b >= 0
        # aContent = _view[a] #view(_view, a) #arr[a]
        #   bContent = _view[b] #view(_view, b) #arr[b]
    
        contentSwapped = nothing
    
        #  if aContent > bContent # arr[a] > arr[b]
        v = collect(a:b) # collect(a, b)# collect(a, b + 1) # # content 
        _view = view(v, firstindex(v):lastindex(v)) # correct  # indecies
        println("a = ", a, " b = ", b)
    
        println("Index = findall((x -> x == _view[a]), _view))(a) = ", findall((x -> x == _view[a]), _view)(a))
        println("Index = firstindex(findall((x -> x == _view[b]), _view))(b) = ", firstindex(findall((x -> x == _view[b]), _view))(b))
    
    
        a, b, contentSwapped = oldSchoolSwap(firstindex(findall((x -> x == _view[a]), _view))(a), firstindex(findall((x -> x == _view[b]), _view))(b), _view) #<-- 
        # swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap 
    
        #a, b = oldSchoolSwap(a, b, _view) 
        # contentSwapped = true   #arr[a], arr[b]
    
        #  elseif aContent > bContent
        #do nothing 
        #  contentSwapped = false
        #  end
        return a, b, contentSwapped
    elseif isUnitDistanceReached(a, b) == true # 3, 4 ,d = 1 
        _view = collect(a:b)
        _view = view(_view, firstindex(_view):lastindex(_view))
        a, b, contentSwapped = oldSchoolSwap(a, b, _view) # # swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap #<-
        return a, b, contentSwapped
        # elseif a == a == _length-1 || b == _length-1 
        #     return isUnitDistanceReached(a,b) #1, 2)
    elseif a == _length || b == _length # last step  #scalar 
        # isUnitDistanceReached(a,b)
        # return getLastElement2(a, b)
        # return end 
        # return isUnitDistanceReached(a,b) #1, 2)
        return a,b, nothing  #isEndReached(a, b) #1, 1)
    
    end
end
#-------
#TODO: finish the recursive checkNextView(_view)
""" checks the next view, of type `naive`, via a function call, recursively 

```input:
_view: current, selected view 
a: current Lower Bound 
b: current Upper Bound 
```

```output: 
if 

```
"""
function checkNextView!(_view, a, b) # warning: a,b unused 
    if length(_view) === Nothing
        return #-1
    elseif length(_view) == 1
        #TODO: Contemplate the usefulness of including a different dataType ( i.e. scalar typeof _view[1] )
        return _view[1]  #scalar: either a, or b

    elseif length(_view) == 2
        #only return the current _view  
        #return 
        v = collect(a:b) #|> 
        _view = view(_view, firstindex(v):lastindex(v))
        #TODO: comparebounds 
        a, b, isSwapped = doCompare(a, b, _view)# compare & sort 

        return _view
        #but a view can be at least 3(makes senselength  3->1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) == 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed)) # can be 3 (3->1 )
        #1 do something useful with new input fetch input 
        v = collect(a:b) # |> 

        _view = view(v, firstindex(v):lastindex(v))
        #TODO: compareTriad 

        println("firstindex(x)+1:lastindex(x)-1", firstindex(_view)+1:lastindex(_view)-1)
        #2 calculate the next output : using a naive Algorithm
        a = first(_view)
        b = last(_view)

        #x = collect(a:b)
        if a + 1 <= b - 1 #  boundcheck is required 
            #return view(x, firstindex(x)+1:lastindex(x)-1)
            return checkNextView!(_view, a + 1, b - 1)
        end
    elseif length(_view) == 2 * 2 # 
        a = first(_view)
        b = last(_view)
        m1 = _view[firstindex(_view)+1]
        m2 = _view[lastindex(_view)-1]

        compareQuartet(a, m1, m2, b, _view)

    elseif length(_view) > 4
        #Subdivide further  
    end

end

function checkNextView!(_view)
    if length(_view) === Nothing
        return #-1
    elseif length(_view) == 1
        #TODO: Contemplate the usefulness of including a different dataType ( i.e. scalar typeof _view[1] )
        return _view[1]  #scalar: either a, or b

    elseif length(_view) == 2
        #only return the current _view 
        a = firstindex(_view)
        b = lastindex(_view)
        return _view = collect(a:b) |> _view -> _view -> view(_view, a:b)
        #but a view can be at least 3(makes sense; length  3->1) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) >= 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed)) # can be 3 (3->1 )
        #1 do something useful with new input fetch input 
        a = firstindex(_view)
        b = lastindex(_view)
        _view = collect(a:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        println("firstindex(x)+1:lastindex(x)-1", firstindex(_view)+1:lastindex(_view)-1) #<-------
        #2 calculate the next output : using a naive Algorithm
        a = firstindex(_view)
        b = lastindex(_view)

        #x = collect(a:b)
        if a + 1 <= b - 1 # m1(/m2)  boundcheck is required 
            #return view(x, firstindex(x)+1:lastindex(x)-1)
            return checkNextView!(_view, a + 1, b - 1)
        end
    end
end

#checkNextView()
# in divide conquer: while dividing 
#3 5 becomes 
a = 3;
b = 5;
#try fix remap : Try view
#TODO: CheckNextView: check this Implementation: #note: needcheckNextView to to recursive i.e.
_view = nothing # TODO: replace with checkNextView!
_view = collect(3:5) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #input
checkNextView!(_view) #<----------
#_view = collect(a:b) |> a = a + 1;b = b + 1 |> a + 1 <= b - 1 ? _view -> view(x, firstindex(a + 1):lastindex(b - 1)) : return  #Note: collect(a:b) is rendered unused 

_view = _view = collect(3:5) |> _view -> view(_view, firstindex(_view)+1:lastindex(_view)-1):return  #firstindex(_view)+1:lastindex(_view)-1) : return # # (fills) switches to the Next available _view (from Nothing to _view object)
#_view = a = a + 1 && b =  b + 1 <= b - 1 ? _view -> view(_view, firstindex(_view)+1:lastindex(_view) -1) : return  #firstindex(_view)+1:lastindex(_view)-1) : return # # (fills) switches to the Next available _view (from Nothing to _view object)
_view = _view -> checkNextView(_view) #TODO: Complete CheckNextView()  # checks CheckNextView (returns the nextView )
println(_view)
println(typeof(_view))

#remappedInterval = remap(3, 5)# 1 , 3  # depreciated

#euclidDist(remappedInterval[1], remappedInterval[2]) # 3
#-(remappedInterval[2],remappedInterval[1]) # 2 

#Solution:
_view = collect(3:5) |> _view -> view(_view, firstindex(_view):lastindex(_view))


v = collect(1:9)
# res = view(v,firstindex(v): lastindex(v))
# typeof(res)

#------

a = 1
b = 9

#fabricate view from points only 
v = collect(1:9)

#_view = length(_view)> 2 ?_view -> view(_view,firstindex(_view),lastindex(_view)) : return 
if length(_view) > 2
    _view -> view(_view, firstindex(_view):lastindex(_view))
else
    return
end

#-----

view(v, 1:9)

## from points to vector 
v = collect(1:3)
_view = view(v, firstindex(v):lastindex(v)) #view(v, firstindex(v): length(v)) #v, firstindex(v):length(v)) 
#currentVal = checkCurrentValue!(_view, currentVal)
#currentVal = checkCurrentValue!(_view, currentVal) # currentValue = 1 # correct #<------



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

# Sort & Swap 

## swapContent on a vector array 
function swapContent(aContent, bContent, arr)#; offset=1) #new! # a,b,indicies in arr  

    contentSwapped = nothing
    #a = findall(_view -> _view == aContent, arr)
    #a = a[offset]

    #b = findall(_view -> _view == bContent, arr)
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

## swapContent on a view 
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
# oldSchoolSwap 

## oldSchoolSwap on a vector array 
""" 
Swaps two items in a vector 


Indices, has to be correctly sorted, as expected 
Additional condition : first input must be lower tham 2nd one 

Note: 
if the first input argument (for the lower bound a) is larger than b 
then swapping indicies has to happen, to ensure the process consistency of this function 


"""
function oldSchoolSwap(a, b, arr::Array{Int64,1}) #a,b,indicies in arr  

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

## oldSchoolSwap on a View 
""" 
Swaps two items in a view 

indices, has to be correctly sorted, as expected 
Additional condition : first input must be lower tham 2nd one 

Note: 
if the first input argument (for the lower bound a) is larger than b 
then swapping indicies has to happen, to ensure the process consistency of this function 

"""
# oldSchoolSwap on a view 
function oldSchoolSwap(a, b, _view::SubArray) #a,b,indicies in arr  

    #check left-most bound is lower than right most bound, if not, replace indicies 
    if a > b
        a, b = b, a
        contentSwampped = true 
    end
    contentSwapped = nothing

#its view[aId] = a 
    aContent = a #_view[a] #<----- Rational mid(index)= 8
    bContent = b #_view[b-1] # issue was here 
    #_first = nothing
    #_last = nothing

    #comparing contents 
    if aContent > bContent
        #_view[a], _view[b] = _view[b], _view[a] #swap
        aContent,bContent = bContent, aContent
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(aContent, " ", bContent,contentSwapped) #_view[b], contentSwapped)
    
    elseif aContent <= bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing 
        contentSwapped = false
        println(aContent, " ", bContent, " contentSwapped = ", contentSwapped)  #_view[b], contentSwapped)
    
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
println("_view = ", typeof(_view)) # SubArray{Int64, 1, Vector{Int64}, Tuple{UnitRange{Int64}}, true}

v = collect(first(_view):last(_view))
println("v = ", v)

_view[lastindex(_view)] # <---
euclidDist(a, b) #1
b
euclidDist(a, b)
v = collect(a:b)
#remap 
#return 
view([1, 2, 3, 4, 5], 1:5)
view(v, firstindex(v):lastindex(v)) #Correct-Form # ==view(v, remap(a, b)) 
# view(v, remap(a, b)) #v[length(v)])
# _view = collect(a:b) |> view(v, firstindex(v):lastindex(v))
_view = collect(a:b) |> v -> view(v, firstindex(v):lastindex(v))
#end
euclidDistDifference(1, 1)
euclidDistDifference(a, b)
a
b
# (m2 + 1, b - 1)

#---------
# Middle 

## Middle of Two Points 

@propagate_inbounds function middle(a::Int64, b::Int64) # b  + a -1  # Acceptable #review#2 ; offset = 1 #rule-found: offset only used in an array (at its start)

    try
        _sum = sumInterval(a, b)  #    b + a - 1  # distance between them  <---- Error 
        println("a , b =", a, " ", b) # a , b =1 9
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
#-------
#doCompare 

#-----------
function isUnitDistanceReached(a, b)

    if euclidDistDifference(a, b) <= 1  || euclidDistDifference(a, b) == 0 #TODO: chage inside the function 
        return true
    else
       # v = collect(a:b)
       # _view = view(v, firstindex(v):lastindex(v))
        m1, m2, isWhole = middle(a, b) #a - 1, a, b, b + 1, _view) #<-----sumInterval not defined 
        v = collect(m1:m2) # collect(first(m1): last(m2) ) 
        # compareBounds
        a, b, contentSwapped = doCompare(m1, m2, view(v,firstindex(v):lastindex(v)))  #v) # <-----
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end


end

function isUnitDistanceReached(a, b,kernel)

    if euclidDistDifference(a, b) <= 1 || euclidDistDifference(a, b) == 0 #TODO: chage inside the function 
        return true
    else
        # v = collect(a:b)
        # _view = view(v, firstindex(v):lastindex(v))
        m1, m2, _flag = kernel(a, b) #a - 1, a, b, b + 1, _view) #<-----sumInterval not defined 
        # lower = 4 , upper = 5
        v = collect(m1:m2)
        # compareBounds
        _view = view(v, firstindex(v):lastindex(v))
        a, b, contentSwapped = doCompare(firstindex(m1, _view), firstindex(m2, _view), _view)  #v) # <-----
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        #TODO: a,b, contentSwapped  (record, stats relation)
        return false
    end


end

#---------------------

middle(1, 3)

m1, m2, _isSWapped = middle(1,9)
#next take 

#a newM1 #m1, m2  # m2, b 
_m1,_m2, _isSwapped = middle(1,m1-1)
isUnitDistanceReached(1, m1 - 1)
#isEndReached(1,m1-1)

_m1,_m2, _isSwapped = middle(m1,m2)
isUnitDistanceReached(m1, m2) #  - 1)
#isEndReached(m1,m2)

_m1,_m2, _isSwapped = middle(m2+1,b)
isUnitDistanceReached(m2+1, b)
#isEndReached(m2 + 1, b)

#---------

### getLastElement2 
""" a patch for only euclidDistDifference """

function getLastElement2(a, b) #
    if euclidDistDifference(a, b) == 0 #1 #0

        return -1, -1, nothing
    elseif euclidDistDifference(a, b) == 1
        #return the index of either a, or b: 
        return a, a, view([a], firstindex([a]):lastindex([a]))  #nothing
    else
        v = collect(a:b) #+1)

        return view(v, firstindex(v):lastindex(v))
    end
end


#-------------
## passing two indicies points 
euclidDistDifference(3,4)

function isEndReached(a, b) # compiles 

    if euclidDistDifference(a, b) == 1#0 #1 #TODO: chage inside the function 
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

## passing a custom kernel 

function isEndReached(a, b, kernel)

    if euclidDistDifference(a, b) == 1#0 #1  #TODO: chage inside the function 
        return true
    else
        v = collect(a:b)
        _view = view(v, firstindex(v):lastindex(v))
        kernel(a - 1, a, b, b + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end


end

_length = copy(length(_view)) #ok 
if a == b # scalar 
    # v = collect(a:b)
    # _view = view(v, firstindex(v):lastindex(v))

    return a, a, nothing
elseif a < _length && b < _length && a >= 0 && b >= 0
    # aContent = _view[a] #view(_view, a) #arr[a]
    #   bContent = _view[b] #view(_view, b) #arr[b]

    contentSwapped = nothing

    #  if aContent > bContent # arr[a] > arr[b]
    v = collect(a:b) # collect(a, b)# collect(a, b + 1) #

    _view = view(v, firstindex(v):lastindex(v)) # correct 
    a, b, contentSwapped = oldSchoolSwap(a, b, _view) #<-- 
    # swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap 

    #a, b = oldSchoolSwap(a, b, _view) 
    # contentSwapped = true   #arr[a], arr[b]

    #  elseif aContent > bContent
    #do nothing 
    #  contentSwapped = false
    #  end
    return a, b, contentSwapped
elseif isUnitDistanceReached(a, b) == true # 3, 4 ,d = 1 
    _view = collect(a:b)
    _view = view(_view, firstindex(_view):lastindex(_view))
    a, b, contentSwapped = oldSchoolSwap(a, b, _view) # # swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap #<-
    return a, b, contentSwapped
    # elseif a == a == _length-1 || b == _length-1 
    #     return isUnitDistanceReached(a,b) #1, 2)
elseif a == _length || b == _length # last step  #scalar 
    # return getLastElement2(a, b)
    # return end 
    # return isUnitDistanceReached(a,b) #1, 2)
    return a,a,nothing #isUnitDistanceReached(a, b) #isEndReached(a, b) #1, 1)

end
#------
a = 1;
b = 2;
v = collect(1:2)
_view = view(v, firstindex(v):lastindex(v)) # BoundsError: firstindex(v), lastindex(v) ; correct

_length = copy(length(_view)) #ok # a,b =  2 
#if a < _length && b < _length && a >= 0 && b >= 0
# aContent = _view[a] #view(_view, a) #arr[a]
#   bContent = _view[b] #view(_view, b) #arr[b]

contentSwapped = nothing

#  if aContent > bContent # arr[a] > arr[b]
v = collect(a:b) # collect(a, b)# collect(a, b + 1) #

_view = view(v, firstindex(v):lastindex(v)) #<------------------
a, b, contentSwapped = oldSchoolSwap(a, b, _view) # 
# swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap 

#a, b = oldSchoolSwap(a, b, _view) 
# contentSwapped = true   #arr[a], arr[b]

#  elseif aContent > bContent
#do nothing 
#  contentSwapped = false
#  end
return a, b, contentSwapped

#---------
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
    interval = collect(interval)
    return compareTriad(pt, interval[1], interval[2], arr)
end

""" compares  a point & an interval of indices , which are subsets of a _view """
function compareBounds(pt, interval, _view::SubArray)
    interval = collect(interval)
    return compareTriad(pt, interval[1], interval[2], _view)
end
""" compares two intervals of indices , which are subsets of  arr """
function compareBounds(interval1, interval2, arr::Array{Int64,1})
    # return compareQuartet(arr[interval1[1]], arr[interval1[2]], arr[interval2[1]], arr[interval2[2]], arr)
    interval1 = collect(interval1)
    interval2 = collect(interval2)
    return compareQuartet(interval1[1], interval1[2], interval2[1], interval2[2], arr)
end
""" compares two intervals of indices , which are subsets of  _view """
function compareBounds(interval1, interval2, _view::SubArray)
    interval = collect(interval)
    return compareQuartet(interval1[1], interval1[2], interval2[1], interval2[2], _view)# hugely experimental #TODO: apply union
end

function compareBounds(pt, interval1, _view::SubArray)
    interval = collect(interval)
    return compareTriad(pt, interval1[1], interval1[2], _view)
end



#doCompare 
arr = collect(1:7)
_length = copy(length(arr))
a = firstindex(arr);
b = lastindex(arr);
if a < _length && b < _length && a >= 0 && b >= 0 # && b >= m2 # if a <= _length && b <= _length 
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

#=
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
=#
#rule for isUnitDistanceReached
# d(1,2) <= 1 

isUnitDistanceReached(1, 3) # <----
isUnitDistanceReached(1, 1) # <----
isUnitDistanceReached(1,2) # d(1,2) =1
isUnitDistanceReached(1,3)

#------
# doCompare Function 

## Patch for doCompare

### getLastElement 
""" a patch for euclidDistDifference """
function getLastElement(a, b)

    if euclidDistDifference(a, b) == 0 #1 #0
        return
    else

        #remap TODO: remap true form 
        #return view(v, remap(a, b)) #v[length(v)])

        v = collect(a:b) #+1)
        return view(v, firstindex(v):lastindex(v)) #not view(v, firstindex(v): lastindex(v))#_view = collect(a:b) |> v-> view(v, firstindex(v):lastindex(v))
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

#---------
# Compareing Three Numbers, as a  Triad (compareTriad)
#=
## compareTriad for a vector array 
function compareTriad(a, m1, b, arr::Array{Int64,1})

    try
        if a !== Nothing && m1 !== Nothing && b !== Nothing
            _isSwapped = nothing

            a, b, _isSwapped = doCompare(a, b, arr)
            println("twinMiddles [a, b]= ", a, " ", b, " checked ")

            a, m1, _isSwapped = doCompare(a, m1, arr)
            println(" [a, m1]= ", a, " ", m1, " checked ")

            m1, b, _isSwapped = doCompare(m1, b, arr)
            println(" [a, m1]= ", m1, " ", b, " checked ")

            if a === nothing || b === nothing || m1 === nothing
                return nothing
            else
                return a, b, m1
            end

            #else throw(error(""))
        end

    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

    #catch 

end
=#
#=
## compareTriad for any 3 indices
function compareTriad(a, m1, b) #Used 

    try
        _isSwapped = nothing
        if a < b
            isInReverse = false
        elseif a > b
            isInReverse = true
        end
        v = nothing
        first = nothing
        second = nothing


        isInReverse == false ? v = collect(a:m1) : v = collect(m1:a)  #ok 
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = a
            second = m1
        else
            first = m1
            second = a
        end
        first, second, _isSwapped = doCompare(first, second, _view)
        println(" [a, m1]= ", a, " ", m1, " checked ")


        isInReverse == false ? v = collect(m1:b) : v = collect(b:m1) #ok 
        _view = collect(m1:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m1
            second = b
        else
            first = b
            second = m1
        end
        first, second, _isSwapped = doCompare(first, second, _view)
        println("twinMiddles [m1, b]= ", m1, " ", b, " checked ")

        isInReverse == false ? v = collect(a:b) : v = collect(b:a) #ok 
        _view = collect(a:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = a, second = b
        else
            first = b, second = a
        end
        a, b, _isSwapped = doCompare(a, b, _view)
        println(" [a, b]= ", a, " ", b, " checked ")

        println("a, m1, b = ", a, m1, b)
        if a === nothing || b === nothing || m1 === nothing
            return nothing
        else
            return a, b, m1
        end
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end
=#

## compareTriad: on a arr  # done 
function compareTriad(a, m1, b, arr::Array{Int64,1}) # erroneous function [ there is no context , i.e. arr ]

    try
        #    if a !== Nothing && m1 !== Nothing && b !== Nothing && arr !== Nothing

        if a !== Nothing && m1 !== Nothing && b !== Nothing && arr !== Nothing

            _isSwapped = nothing

            #_view = collect(a:m1)
            #suggest: use a,b as bounds of the current _view 
            #  a != b ? _view = view(_view, firstindex(a):lastindex(b)) : return "a ==b scalar: a = ", a, " b = ", b

            #it boils down to lowerbound & upperBound
            # a, m1,  or m1+1 , b

            lowerBound = m1 - 1

            if a != lowerBound  #(a != m1 - 1 )# fail-safe mechanism 

            #v = collect(a:lowerBound)
            #length(v)

                a, lowerBound, _isSwapped = doCompare(a, lowerBound, arr) # [a, m1]= 1 2 checked
            
            #if a === Nothing && lowerBound === Nothing && _isSwapped == Nothing # retry: #lowerBound = m1  #TODO: check doCompare returns nothing, nothing,nothing when a==b 
            else
            #lowerBound = m1
            #    a, lowerBound, _isSwapped = doCompare(a, lowerBound, arr)
                throw(error("boundsEqualError"))
            
            end
           #= =#
            #decide: do you continue the 

            elseif a == lowerBound #m1 # fallback  
                # a, m1, _isSwapped = 1, 1, nothing
                a, lowerBound, _isSwapped = a, a, nothing
                #TODO: can we retry here, with a different lowerBound, as well? 

            end


            #decide the upperBound (from lowerBound) w
            #if lowerBound == m-1 ||  lowerBound == m

            upperBound == lowerBound + 1
            println(" upperBound = ", upperBound)

            # a, m1, _isSwapped = doCompare(a, m1, _view) # [a, m1]= 1 2 checked  # <-----
            #println(" [a, m1]= ", a, " ", m1, " checked ")

            # mid = m1 + 1 # or (m1) , b 
            #rule: once lowerBound is determined, so do the upperBound, as well 
            #--------
            if upperBound != b

                #if mid != b 
                #  if upperBound != b # fine 

                upperBound, b, _isSwapped = doCompare(upperBound, b, arr) # [a, m1]= 1 2 checked
                #  else # fallback  # Activated #where it fails   if view == 0 # throw error 

                #should throw(error())
                println(" upperBound , b] checked ", upperBound, " _isSwapped = ", _isSwapped)

            else
                upperBound == b # or length () throw error 
                #m == b # does not exist 
                println("upperBound == b upperBound = ", upperBound, " b = ", b)
                #   p upperBound , " ", b, " checked ")
            end

            #UncommentMe (or not ? )

       # elseif  a === Nothing && m1 === Nothing && b !== Nothing && arr !== Nothing # should be throw(error...)
            #return
        #    throw(error("Unexpected Error Reason : "))
       # end
   #end # My Bad 
        #==#
        if a != b
            a, b, _isSwapped = doCompare(a, b, arr)
        elseif a == b # fallback 
            a, b, _isSwapped = a, a, nothing

        end
        println(" [a, b]= ", a, " ", b, " checked ")
        println("a, m1, b = ", a, m1, b)
        #  if a === nothing || b === nothing || m1 === nothing
        #      return nothing, nothing, nothing
        # else
        #==#
        return a, b, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]
    #  end
    # else 
    #     return nothing, nothing, nothing
    #end
    # end

    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace()) # <---- #attempt to access 0-element Vector{Any} at index [1]
    end
end

# rule : compareTriad should not have isEven comparison ( as it is trivial we are dealing with only a triad: a m1 ,b)
#left is a question of interval set-up: a,m1 m1+1 , b or a, m1-1, m1 b #depends on situation -deep 

## compareTriad: for a view # applied fail-safe mechanism 
function compareTriad(a, m1, b, _view::SubArray) #corrected 

    try
        upperBound = 0
        lowerBound = 0 #nothing
        if a !== Nothing && m1 !== Nothing && b !== Nothing && _view !== Nothing

            _isSwapped = nothing

            #_view = collect(a:m1) |> 
            #suggest: use a,b as bounds of the current _view 
            #  a != b ? _view = view(_view, firstindex(a):lastindex(b)) : return "a ==b scalar: a = ", a, " b = ", b
            # 1 ,3 + 1 =4//2 =2  m1: 
            #either    
            #boils down to lowerbound & upperBound

            # a , m1-1 ;  m1 b 

            # a, m1,  or m1+1 , b
            lowerBound = m1 - 1

            if a != lowerBound  #(a != m1 - 1 )# fail-safe mechanism 

                v = collect(a:lowerBound)
                length(v)
                a, lowerBound, _isSwapped = doCompare(a, lowerBound, _view) # [a, m1]= 1 2 checked

                if a === Nothing && lowerBound === Nothing && _isSwapped == Nothing # retry: #lowerBound = m1  #TODO: check doCompare returns nothing, nothing,nothing when a==b 
                    lowerBound = m1
                    a, lowerBound, _isSwapped = doCompare(a, lowerBound, _view)


                end

                #decide: do you continue the 
            elseif a == lowerBound #m1 # fallback  
                # a, m1, _isSwapped = 1, 1, nothing
                a, lowerBound, _isSwapped = a, a, nothing
                #TODO: can we retry here, with a different lowerBound, as well? 

            end

            #decide the upperBound (from lowerBound) w
            #if lowerBound == m-1 ||  lowerBound == m
            upperBound == lowerBound + 1
            println(" upperBound = ", upperBound)

            # a, m1, _isSwapped = doCompare(a, m1, _view) # [a, m1]= 1 2 checked  # <-----
            # println(" [a, m1]= ", a, " ", m1, " checked ")

            # mid = m1 + 1 # or (m1) , b 
            #rule: once lowerBound is determined, so do the upperBound, as well 
            #--------
            if upperBound != b
                v = collect(upperBound:b)
                _view = view(_view, firstindex(v):lastindex(v)) #mid):lastindex(b))  # (_view, _view)
                # mid, b, _isSwapped = mid < b && length(_view)>1 ?

                # if upperBound < b && length(_view) > 1 # you can safely pick 1 (either mean the same )
                #   upperBound, b, _isSwapped = doCompare(upperBound, b, _view) #: return  #doCompare(m1, b, _view) #<-------

                #if mid != b 
                #  if upperBound != b # fine 
                upperBound, b, _isSwapped = doCompare(upperBound!, b, _view) # [a, m1]= 1 2 checked
                #  else # fallback  # Activated #where it fails   if view == 0 # throw error 
                #  mid, b, _isSwapped = 1, 1, nothing
                #should throw(error())
                #println(" [upperBound b] checked ", upperBound)
                println(" upperBound , b] checked ", upperBound, " _isSwapped = ", _isSwapped)
            else
                upperBound == b # or length () throw error 
                #m == b # does not exist 
                println("upperBound == b upperBound = ", upperBound, " b = ", b)
                # println("upperBound == b upperBound = ",upperBound, " b = ", b )
                #   p upperBound , " ", b, " checked ")
            end

        else # should be throw(error...)
            #return
            throw(error("Unexpected Error Reason : "))
        end

        v = collect(a:b)
        _view = view(v, firstindex(v):lastindex(v))

        if a != b
            a, b, _isSwapped = doCompare(a, b, _view)
        elseif a == b # fallback 
            a, b, _isSwapped = a, a, nothing

        end

        println(" [a, b]= ", a, " ", b, " checked ")
        println("a, m1, b = ", a, m1, b)
        #  if a === nothing || b === nothing || m1 === nothing
        #      return nothing, nothing, nothing
        # else
        return a, b, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]
    #  end
    # else 
    #     return nothing, nothing, nothing
    #end
    # end

    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace()) # <---- #attempt to access 0-element Vector{Any} at index [1]
    end
end

#---------

# compareQuartet

## compareQuartet: on a vector array
##in a vector, as a Quartet 

""" Comparing 4 numbers: a,b & middles: m1,m2 , input vector array , applys view  on each Interval """
function compareQuartet(a, m1, m2, b, arr::Array{Int64,1}) #<-------- input expecting indicies 

    try
        twinMiddles = nothing

        #1
        a, m1, isSwapped = doCompare(a, m1, arr)
        println("twinMiddles [a, m1]= ", m1, " ", m2, " swapped ")

        #2
        m1, m2, isSwapped = doCompare(m1, m2, arr)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")
        #3
        a, m2, isSwapped = doCompare(a, m2, arr)
        println("twinMiddles [a, m2]= ", a, " ", m2, " swapped ")

        #4
        m1, b, _isSwapped = doCompare(m1, b, arr)
        println("twinMiddles [m1, b]= ", m1, " ", b, " swapped ")

        #5
        m2, b, _isSwapped = doCompare(m2, b, arr)
        println("twinMiddles [m2, b]= ", m2, " ", b, " swapped ")

        #6
        a, b, _isSwapped = doCompare(a, b, arr)
        println(" [a, b]= ", a, " ", b, " swapped ")

        twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", m1, " ", m2)
        # push!(Middles, twinMiddles) #TODO: push each _isSwapped to swapped[] vector, as well 
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ? #no this is much practical
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end

## compareQuartet: in General 
#=
"""# compareQuartet with no input argument view , returns  a dynamic view for each pair of points """
function compareQuartet(a, m1, m2, b)

    try

        println("entering compareQuartet")
        _view = nothing
        isInReverse = nothing

        if a < b
            isInReverse = false
        elseif a > b
            isInReverse = true
        end
        v = nothing
        first = nothing
        second = nothing

        #1
        isInReverse == false ? v = collect(a:m1) : v = collect(m1:a)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))

        if isInReverse == false
            first = a
            second = m1
        else
            first = m1
            second = a
        end
        first, second, isSwapped = doCompare(first, second, _view)
        println("twinMiddles [a, m1]= ", m1, " ", m2, " swapped ")

        #2
        isInReverse == false ? v = collect(m1:m2) : v = collect(m2:m1)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m1
            second = m2
        else
            first = m2
            second = m1
        end
        first, second, isSwapped = doCompare(first, second, _view)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")
        #3
        isInReverse == false ? v = collect(a:m2) : v = collect(m2:a)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = a
            second = m2
        else
            first = m2
            second = a
        end
        first, second, isSwapped = doCompare(first, second, _view)
        println("twinMiddles [a, m2]= ", a, " ", m2, " swapped ")

        #4
        isInReverse == false ? v = collect(m1:b) : v = collect(b:m1)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m1
            second = b
        else
            first = b
            second = m1
        end
        first, second, _isSwapped = doCompare(first, second, _view)
        println("twinMiddles [m1, b]= ", m1, " ", b, " swapped ")

        #5
        isInReverse == false ? v = collect(m2:b) : v = collect(b:m2)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m2
            second = b #<-----
        else
            first = b
            second = m2
        end

        first, second, _isSwapped = doCompare(first, second, _view)
        println("twinMiddles [m2, b]= ", m2, " ", b, " swapped ")

        #6
        isInReverse == false ? v = collect(a:b) : v = collect(b:a)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = a, second = b
        else
            first = b, second = a
        end
        first, second, _isSwapped = doCompare(first, second, _view)
        println(" [a, b]= ", a, " ", b, " swapped ")

        println("twinMiddles [m1, m2]= ", [m1, m2])

        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles (this is Practical)
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end
=#
#mynote: its a bit easier : there is a clear distinction between m1 & m2 
# compareQuartet 
#1.applied input parameter check for Nothing  condition 
function compareQuartet(a, m1, m2, b, arr:: Array) #Warning 

    try

        println("entering compareQuartet")

        if a !== Nothing && m1 !== Nothing && m2 != Nothing && b !== Nothing && arr !== Nothing
            _isSwapped = nothing
        
            _isEven = copy(isEven(a, b))
        
            if _isEven == true # a m1 m1+1  b 
        
                lowerBound = m1
                upperBound = m1 + 1
        
                #1
                a, lowerBound, isSwapped = doCompare(a, lowerBound, _view) #<------
                println("twinMiddles [a, m1]= ", a, " ", lowerBound, " swapped =", isSwapped)
            elseif _isEven == false # a m1 m2 b 
                lowerBound = m1
                upperBound = m2 # which is always equal to m + 1
        
            end
        
            #1
        
            a, lowerBound, _isSwapped = doCompare(a, lowerBound, arr) #<------
            println("twinMiddles [a, lowerBound]= ", a, " ", lowerBound, " _isSwapped ", _isSwapped)
            #2
            lowerBound, upperBound, _isSwapped = doCompare(lowerBound, upperBound, arr)
            println("twinMiddles [lowerBound, m2]= ", lowerBound, " ", m2, " swapped ", _isSwapped)
            #3
            a, upperBound, _isSwapped = doCompare(a, upperBound, arr)
            println("twinMiddles [a, m2]= ", a, " ", upperBound, " swapped ", _isSwapped)
        
            #4
            lowerBound, b, _isSwapped = doCompare(lowerBound, b, arr)
            println("twinMiddles [lowerBound, b]= ", lowerBound, " ", b, " _isSwapped =  ", _isSwapped)
        
            #5
            upperBound, b, _isSwapped = doCompare(upperBound, b, arr)
            println("twinMiddles [m2=upperBound , b]= ", upperBound, " ", b, " _isSwapped =", _isSwapped)
        
            #6
            a, b, _isSwapped = doCompare(a, b, arr)
            println(" [a, b]= ", a, " ", b, " _isSwapped = ", _isSwapped)
        
        
            #twinMiddles = [m1, m2] # vector (Array{Int64, 1})
            println("twinMiddles [m1, upperBound]= ", [lowerBound, upperBound])
            #        push!(Middles, twinMiddles)
        
        elseif a == Nothing || b == Nothing || m1 == Nothing || m2 == Nothing 
            # should be throw(error...)
            #return
            throw(error("Unexpected Null Error Reason :  a or b or m1 or m2 = Nothing+-'[l0] "))
        #end
    end
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ?
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end

## compareQuartet: on a view 
""" input vector array , applied on a view  (on each Interval) """
function compareQuartet(a, m1, m2, b, _view::SubArray)

    try

        println("entering compareQuartet")

        #1
        a, m1, isSwapped = doCompare(a, m1, _view) #<------
        println("twinMiddles [a, m1]= ", m1, " ", m2, " swapped ")
        #2
        m1, m2, isSwapped = doCompare(m1, m2, _view)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")
        #3
        a, m2, isSwapped = doCompare(a, m2, _view)
        println("twinMiddles [a, m2]= ", a, " ", m2, " swapped ")

        #4
        m1, b, _isSwapped = doCompare(m1, b, _view)
        println("twinMiddles [m1, b]= ", m1, " ", b, " swapped ")
        #5
        m2, b, _isSwapped = doCompare(m2, b, _view)
        println("twinMiddles [m2, b]= ", m2, " ", b, " swapped ")
        #6
        a, b, _isSwapped = doCompare(a, b, _view)
        println(" [a, b]= ", a, " ", b, " swapped ")


        #twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", [m1, m2])
        #        push!(Middles, twinMiddles)
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ?
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end





#kernel #is passed 
#isStoppingCondition #is passed (either stop, or continue)


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
        _view = collect(m1:b) |> v-> view(v, firstindex(v):lastindex(v))

        # view2 = view(_view, m1:b) #issue: building proper view - subarray of an array #was m1,b
        # goright!(view(_view, m1:b)) # middle om am Interval 

    elseif isWhole == false
        compareQuartet(a, m1, m2, b, _view) #compare arr values at 4 index points: a,m1,m2,b  #ok
        #view1 = view(arr, a:m1) #correct result 
        #Index changes: need for Remapping: m2, b 
        #b- m2 #difference 
        #the fix for the following view: 
        m2, b = remap(m2, b) #done

        _view = collect(m2:b) |> v-> view(v, firstindex(v):lastindex(v))
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #b -= 1
        # b = euclidDistDifference(m2, b) #+1 
        # m2 = 1
        view2 = view(_view, m2:b)
        _view = collect(m2:b) |> v-> view(v, firstindex(v):lastindex(v))

        goleft!(view(_view, a:m1)) #go left iteratively #
        # goright!(view2) ##go left iteratively # 

        goright!(view2, remap(m2, b))
    end
end


#---------


# custom Kernel functions

## kernel: of Two Point
function kernel(a, b, consumedFunction)

    return consumedFunction(a, b)
end


## kernel: of a Vector Array 
function kernel(a, b, arr::Array{Int64,1}, consumedFunction)

    return consumedFunction(a, b, arr)
end

## kernel: of a View
function kernel(a, b, _view::SubArray, consumedFunction)

    return consumedFunction(a, b, _view)
end

view(v, v)
kernel(a, b, view(v, v), middle!)
#kernel(a, b, arr, middle!)

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
#calcVerteciesLeft!(ar1[1], ar1[2], currentValue) # 1 
numMiddles = currentValue # 1 #FYI 

#stopFlag = isStoppingCondition(a, b, currentValue) #correct 
#stopFlag = isStoppingCondition(a, b, 2) #when currentValue>1 should be false 
#callMiddle!
#m1, m2, isWhole = middle(ar1[1], ar1[2]) # callMiddle!(firstindex(ar1): lastindex(ar1), ar1) #should be true #true  # odd members have an actual middle 
#isWhole = getIsWhole(ar1[1],ar1[2])
#stopFlag = isStoppingCondition(a, b, ar1) #<------- KNOWN ISSUE (checkVerticiesLeft) # logic Discrepency either ar1, nothing or a,b,nothing (not both)
#subtle discripence : check both flows 
#stopFlag = isStoppingCondition(a, b, nothing)
#stopFlag = isStoppingCondition(ar1, nothing) # we're only concerned with the given interval 

#update currentValue 


#todo: remapping function from indicies to values 
#checkCond(1, m1, m2, 3, isWhole, [1, 2, 3]) #deprecate




### new Idea : use of kernel as input 
#a m1-1 m1+1 b 

#a m1-1 m2+1 b 

# CompareBounds  
#

=#

arr = collect(1:7)
pts = [1, 3, 4, 7]
#pts[1] # proxy for a lower bound 
#compareBounds(pts[1], pts[2], arr) #input # solved #requires pts #Bounds Error 
#---------
compareQuartet(1, 2, 3, 4, [1, 2, 3, 4])  # 1 4 2 3  # <-----
compareBounds([1, 2], [3, 4], [1, 2, 3, 4]) # 1 4 2 3 # corrected  

compareBounds([1, 2], [3, 4], [1, 2, 3, 4]) #compareQuartet: doCompare

function checkCondition(a::Int64, m1::Int64, m2::Int64, b::Int64, arr::Array{Int64,1}) #error #subtle  

    lowerbound = m1 - 1 #m1-1
    upperbound = nothing #m2+1
    if cond == true  #2 twin middles m1,m2: next check bounds a,m1 m1, b
        upperbound = m1 + 1
        # doCompare(a,m1)
        doCompare(a, m2, arr) #uses arr
        #doCompare(a,b)
        #docompare(m1,m2)
        compareQuartet(a, m1, m2, b, arr)

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


    elseif cond == false  #isEven(a,b) == #one middle m1 (with a,b) 
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

#TODO: check usability 
#=
function makeView(_a, _b)
    v = collect(_a:_b)

    return view(v, firstindex(v):lastindex(v))
    # return view(v, (res1:res2)) #view(v, (1:length(res))) #view(v, res1, res2) #res[1]:res[length(res)])#perfect 
end

view(v, 1: 9)#done
=#
v = collect(1:9)
res = view(v, firstindex(v):lastindex(v))

typeof(res)
v
view(v, v)

#TODO: Check use of NewView 
function NewView(_a, _b)
    v = collect(_a:_b)
    _view = view(v, firstindex(v):lastindex(v))
    #  _view = view(v,firstindex(v): lastindex(v)) #(res[1]:res[length(res)]))

    return v, _view
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

# ow, you have a triad of Points (1,2,3) , which can compare & sort

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
#
#at least 1 partition function 
""" gets _stack of ranges """
function partition(a::Int64, b::Int64, currentValue, kernel=middle)

    m1, m2, isItEven = kernel(a, b) # here, we dunno if it's singleMiddle or twinMiddles 

    # currentValue = calcVerteciesLeft!(a, b, currentValue) # valuable utility # errorneous# Unused
    #Infered Rule 1: left side is always a, m1 

    # Inferred rule 2    right side b is always last

    #Right-side Processing  #partitioning 
    #depreciate 
    # processRightSide(isItEven, m1, m2, b)

    #finally, 

    ##Left-side Processing
    _view1 = collect(a:m1) |> _view -> view(_view, firstindex(_view):lastindex(_view))


    compareBounds(a, m1, _view)
    #traverse middle (if isItEven==false)
    if isItEven == false
        #m1,m2 
        #TODO: call cause 
        _view2 = collect(m1:m2) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        #kernel function 
        # callCause(m1, m2)
        doCompare(m1, m2, _view)
        #cause
    end
    ##traverse left
    traverseLeft(a, m1 - 1)
    #singleMiddle: m1 
    if isItEven == true
        #nextInterval remapping: m1, b
        # m1, b = remap(m1, b) # why remap here 
        _view = collect(m1:b) |> v -> view(v, firstindex(v):lastindex(v))
        #Todo: call 
        lowerbound = 0
        upperbound = 0
        pts = []
        if a < m1 - 1 # 2 # a, m1-1 
            lowerbound = a
            upperbound = m1 - 1
            traverseRight(lowerbound, upperbound)
            push!(pts, lowerbound)
            push!(pts, upperbound)

        elseif a == m1 - 1 # 1  # a 
            lowerbound = a
            upperbound = a
            push!(pts, lowerbound)
            #b is possible uncompared #TOOO: add a  bool flag 
        end
        _view1 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        compareBounds(lowerbound, upperbound, _view1)
        # compare a, m1-1 
        if m1 < b # +2 : m1, b 
            lowerbound = m1
            upperbound = b
            push!(pts, lowerbound)
            push!(pts, lowerbound)
        elseif m1 == b # m1 == b  # + 1  : b 
            lowerbound = b
            upperbound = b
            #b is uncompared #TOOO: add bool flag 
        end # m1 , b 
        _view2 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        compareBounds(lowerbound, upperbound, _view1)
        #TODO: finalize : check if there is a a true bool value i.e. there exists some uncompared bool flag 
        # if ther is , then the sole point has got to be compared with with the other interval
        # 
        #twinMiddle: m1 , m2 
    elseif isItEven == false

        lowerbound = 0
        upperbound = 0
        if a < m1 - 1
            lowerbound = a
            upperbound = m1 - 1
            traverseRight(lowerbound, upperbound)
        else
            lowerbound = a
            upperbound = a

        end
        _view1 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        compareBounds(lowerbound, upperbound, _view1)
        if m1 < m2
            lowerbound = m1
            upperbound = m2
            traverseRight(lowerbound, upperbound)
            # _view2 = collect(lowerbound:upperbound) |> _view -> view(x, firstindex(x): lastindex(x))
        else
            lowerbound = m1
            upperbound = m1
        end
        _view2 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))

        if m2 + 1 < b
            lowerbound = m2 + 1
            upperbound = b
            traverseRight(lowerbound, upperbound)
            #  _view3 = collect(lowerbound:upperbound) |> x -> view(x, firstindex(x): lastindex(x))
        else
            lowerbound = b
            upperbound = b
        end
        _view3 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        #TODO: use _view3 
    else
        throw(error(msg))
    end

end

_stack = [[1, 3], [4, 7]]
typeof(_stack)

#-------
function rangesToPts(ranges) #checked

    _length = copy(length(ranges))
    idMid = Integer(ceil(_length / 2)) # 1 # dof = {1,2} 0 #missing #TODO: complete 
    pts = []
    for i in 1:length(ranges)
        # push
        a = ranges[i][1]
        b = ranges[i][length(ranges[i])] #[2]
        ranges[idMid+idMid][2] #<----------  ranges do exist
        println("a = ", a)
        println("b = ", b)
        push!(pts, a) # every odd has an a value 
        push!(pts, b) # every even has a b value 
    end
    return pts
end


pts = rangesToPts(_stack)

#compareBounds() #TODO: Check 
pts


_view = collect(5:6) |> _view -> view(_view, firstindex(_view):lastindex(_view))

#callCause(5, 6, _view) # depreciate 
#cause(5, 6, _view)

currentValue = nothing


interval = copy(1:3)

_view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))
#-----------


#------------


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

# 3 - 1 + 1
intervalLength(1, 4) # same as +(1,4)

# Compare 
""" a universal compare: compares & sorts contents according to the structure of a given interval, (a,b)"""
function Compare(a, b, arr::Array{Int64,1}) # should #unimplemented: no such function with niput arguments specified 
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
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
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
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end
#----
# Map Points 
## Map on an array
""" maps indicies to a Array values """
function mapPts(pts, arr::Array{Int64,1}) #ok

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

## Map on a View
""" maps indicies to a SubArray values """
function mapPts(pts, _view::SubArray) #ok

    vals = []

    for i in 1:length(pts) # _length
        idx = pts[i]

        append!(vals, _view[idx])
    end
    return vals
end

## Event-Driven: map an array 
"""Event-Driven"""
function mapPts(pts, arr::Array{Int64,1}, i::Int64) #ok

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

## Event-Driven: map an array 

"""Event-Driven"""
function mapPts(pts, _view::SubArray, i)
    vals = []
    _length = copy(length(_view))
    #for i in 1:_length  #length(pts) # _length
    if i <= _length #  i in 1:_length  # if i in 1:_length  if works, instead of for 
        idx = pts[i]

        append!(vals, _view[idx])
        i = i + 1
    end
    return vals, i
end


##  map Points  new function  #TODO: check 
#=maps=#

"""Event-Driven function:
maps points on a vector array arr, with respect to index i 
"""
# Map Points (MapPts!) with a vector array 
function mapPts!(pts, arr::Array{Int64,1}, i) # TODO: sanity check : use of i 

    vals = []

    #for i in 1:length(pts) # _length
    if i > 1
        idx = popat!(pts, i) #pts[i]
        append!(vals, arr[idx]) # accumulates 
        i -= 1
    end
    return vals
end

# Map Points (MapPts!) with a view 
function mapPts!(pts, _view::SubArray, i) # TODO: sanity check : use of i 

    vals = []

    #for i in 1:length(pts) # _length
    if i > 1
        idx = popat!(pts, i) #pts[i]
        append!(vals, _view[idx]) # accumulates 
        i -= 1
    end
    return vals
end

mapPts([1, 3], [1, 2, 3], 1)

#------
#TODO: Recheck Compare , the under a new light #requires: mapPts

function Compare(pts, arr::Array{Int64,1}, i) # should be sanity checked #< --------
    #implicit docompare() function 
    #  m1, m2, isWhole = kernel(a, b, arr)
    vals = mapPts(pts, arr, i)       #<-------- sanity check 
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
            return compareQuartet(a, m1, m2, b, arr) #<------

        else
            throw(error("Unexpected Error Occured")) #<------
        end
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end

#TODO: kernel is not utilitzed
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
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end


function Compare(pts, _view::SubArray, kernel, i) # should be sanity checked #< --------
    #implicit docompare() function 
    m1, m2, isWhole = kernel(a, b, _view)
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
        end #<---
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
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
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end

function Compare(a, b, _view::SubArray, kernel) # should 
    #implicit docompare() function 
    m1, m2, isWhole = kernel(a, b, _view)
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
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end
#----

#test: _stack
#_stack = []
length(_stack)
#_item = pop!(_stack) # [1,3]

#2. sort()

""" Compares & sorts points based on the structure of the view, whether a triad or quartet of points """
function CompareSort(a, b, arr::Array{Int64,1})

    #implicit docompare() function 
    m1, m2, isWhole = middle(a, b) # callMiddle!(a,b,_view)
    res = nothing
    _first = copy(firstindex(arr))
    _last = copy(lastindex(arr))
    try
        if length(arr) == 1
            isEndReached(_first, _last)
            return

        elseif length(arr) == 2
            isUnitDistanceReached(_first, _last)
        elseif length(arr) == 3

            res = compareTriad(a, m1, b, arr) # <---

        elseif length(arr) == 4
            res = compareQuartet(a, m1, m2, b, arr)

        else
            throw(error("Unexpected Error Occured"))
        end
        println(arr)
        return res
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end

function CompareSort(a, b, _view::SubArray)

    #implicit docompare() function 
    m1, m2, isWhole = middle(a, b) # callMiddle!(a,b,_view)
    res = nothing
    _first = copy(firstindex(arr))
    _last = copy(lastindex(arr))
    try
        if length(arr) == 1
            isEndReached(_first, _last)

        elseif length(arr) == 2
            isUnitDistanceReached(_first, _last)

        elseif length(_view) == 3
            res = compareTriad(a, m1, b, _view)

        elseif length(_view) == 4
            res = compareQuartet(a, m1, m2, b, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
        println(_view)
        return res
    catch UnexpectedError
        @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end

end

#---------
#Compare([1, 2], [1, 2, 3], 1) #<--------- sanity check 
#Compare(1, 3, [1, 2, 3], 1)
CompareSort(1, 3, [1, 2, 3]) # returns answer (with error )
i = 1 #i.e. for example , let i be equal to 1
vals = mapPts(pts, _view, i)           #compiles 
_length = copy(length(vals))






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

newView = collect(lastB:interval[2]) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #works by adding the colon to th

#newView = view(makeVector((lastB, interval[2])), makeVector((lastB:interval[2]))) # view(pts[lastB], interval[1]: interval[2])

#---- #view run 
v = @view [1, 4, 8][1:2]

#index to content 
#elementOf(index::Int64)
first([1, 4, 8], 2)[2] #return the first n elements i.e. 2: [1:4] , [1:4][2] = 4



""" searches the Content in the vector, returning its index(cies)"""
function indexOf(arr, aContent::Int64)

    res = findall((x -> x == aContent), arr)  #indexOf(aContent, arr)
    return res
end

#collect([1, 4, 8], 1:2)


firstindex([1, 4, 8], 9) # erroneous function (reson: always returning 1)

#indexOf(aContent::Int64)

aContent = 4
a = findall((x -> x == aContent), [1, 4, 8])  #indexOf(aContent, arr)


#a = a[1]firstindex(a)

#first([1,4,8],1)

#v
#v1 = view([1, 4, 8],1:firstindex([1,4,8],4)) #)
#v2 = view([1, 4, 8], 4 :lastindex([1, 4, 8])) #,8)
#view([1, 4, 8], firstindex([1, 4, 8], 1)) #correct 
#v = union(min(firstindex([1, 4, 8], lowerbound),max(firstindex([1, 4, 8], lowerbound)) #, firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3] # [1,1]
#view([1, 4, 8], firstindex([1, 4, 8], 8)) #1
#newRow = view(arr, mappedIndex:newBound) # want to access sth larger than the () itself
#newRow = view(arr, 2-1:2) # this works  #[4 8]

#----
#mappedIndex not defined 

#collect(arr, mappedIndex:newBound)
#view(arr, mappedIndex:newBound)
_newView = collect(lastB:interval[2]) |> _newView -> view(_newView, firstindex(_newView):lastindex(_newView))  #(v, firstindex(v):length(v)) # interval[2]) #works # [1,2,3]
#view-property: Sub-Viewing : (view of a view )
_newView = collect(lastB:interval[2]) |> _newView -> view(_newView, firstindex(_newView):lastindex(_newView)) #subviewing the view 
_newView2 = collect(lastB:interval[1]) |> _newView2 -> view(_newView2, firstindex(_newView2):lastindex(_newView2))
#---------
# Infer Location 

## Infer location of three point 

## of a Three Points 

""" quantitatively, compare values , returns a qualitative value """
function inferLocation(a, b, x)

    try # the classical approach (compare all 3 at same time )
        #  newLocation 

        if x > a && x > b # x is max 
            if a < b #a is min
                return a, b, x
            elseif a > b  # or a is max  
                return b, a, x
            end
        elseif x > a && x < b #x is the middle 
            if a < b # a is min 
                return a, x, b
            elseif a > b # a is max
                return b, x, a
            end
        elseif x < a && x < b # x is the min (how low is a )
            if a < b # a is the min 
                return x, a, b
            elseif a > b # a is the max  
                return x, b, a
            end

        elseif x == a || x == b
            throw(error("Different Bounds are equal "))
        end
    catch EqualBoundsError
        @error "EqualBoundsError : Different Bounds,which should be different, are equal " (EqualBoundsError, catch_backtrace())
    end

end

#Depreciate
#=
function inferLocation(a, b, x)

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
        @error "BoundsEqualError :Different Bounds are equal " exception = (BoundsEqualError, catch_backtrace())
    end

end
=#

#using arr content from location arr

##of 3 points, on a Vector array 
#UncommentMe
# using arr content from location arr

## of 3 points, on a Vector array 
function inferLocation(a, b, x, arr) #compiles  #warning arr is unused 
    # try
    # newLocation
    first = 0
    middle = 0
    last = 0
    locations = copy(inferLocation(a, b, x))
    if locations !== nothing
        #if a === nothing && b === nothing && x === nothing && arr === nothing
        first, middle, last = locations
    else
        first, middle, last = a, b, x #nothing, nothing, nothing
        #TODO: 
        #if locations !== nothing 
        # return [first, middle, last], [arr[first], arr[middle], arr[last]]

    end
    #return locations
    return first, middle, last #], [arr[first], arr[middle], arr[last]]
    #  catch
    # end




end

#---------
lastB
interval[1]
interval[2]
lastB = 1
interval = collect(2:3)

lastB, interval[1], interval[2] = inferLocation(interval[1], interval[2], lastB)# inferlocation application 

v = union(lastB, (interval[1], interval[2]))
#collect(v)
#view(v, firstindex(v):lastindex(v)) # [1,2,3]
_view = collect(v) |> _view -> view(_view, firstindex(_view):lastindex(_view))
#the most Accurate view description 5
#======
# lastA
#why does it start enumerating from 0 ???? - lastA [issue was : calculating from lastB-1 & lastB=1]

lastB # 1 
inds = [lastB, interval[1], interval[2], interval[2] + 1] #[lastA, lastB, interval[1], interval[2]]
inds2 = [lastB, interval[1], interval[2]] # [1,2,3]

#best view # checked 

_view = collect(lastB:interval[2]) |> _view = view(v, firstindex(v):length(v))

v = collect(lastB, interval[1], interval[2]) # [1,2,3] 3 element vector 
inds # [1,2,3,4]
_view = collect(lastB, interval[1], interval[2]) |> v-> view(v, inds[1:3]) #the most Accurate view description 5

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

#Generalization:

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
        #form a view from lastB, & interval (midpoint newInterval[1] becomes implicit)
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
        v = collect(lastB:interval[2])
        _view = view(arr, lastB:intereval[2])

        compareTriad(lastB, interval[1], interval[2], _view) #TODO " 
        # println("sth: to be taken care of ")
        #  pts.popat(1)
        # pts.popat(1)

        popfirst(pts)
        popfirst(pts)

    end
    #=
    elseif group ==2
        compareQuartet(pts[1],pts[2],pts[3], pts[4],_view) #l
       #TODO: infer  pts.popat(1) or popfirst(pts) (are the same? )
        #pts.popat(1)
        #pts.popat(1)
       # pts.popat(1)
       # pts.popat(1)

        popfirst(pts)
        popfirst(pts)
        popfirst(pts)
        popfirst(pts)

    end
    =#
end  #done 
arr


## pts handling: a,b points (joined with an original arr )
#goal: to evaluate (some) kernel function with inputs a,b, arr 
#i.e. kernel:trivialPartitionFunction(a,b ) 
#   middle(a,b) #TODO call middle from in : a,b to all ranges 1st, last


#TODO:
#=
    if group == 1 # only 1 per item 
        #complete Triad : [lastB, interval[1], interval[2]

        #GET Last b = currentA #pop!
        interval = pop!(_stack)
        #form a view from lastB, & interval (midpoint newInterval[1] becomes implicit)
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
v = collect(1:3)
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
    v = collect(lastB:interval[2]) # (arr, lastB:interval[2])
    _view = view(v, lastB:interval[2])

else # lastB !== interval[2]
    # v = collect(lastB) # (arr, lastB:interval[2])
    #  _view = view(v, firstindex(v):lastindex(v))
    return lastB #,_view[lastB]
end
#finally subtitute lastB plugging it into original arr :
# it does nothing of useful utility 
arr[lastB]

#v
v = collect(lastB) # (arr, lastB:interval[2])
_view = view(v, firstindex(v):length(v))

#rule: for 3 pts: 3 comparisons is Required ,
# rule: for 3 pts: there is 9 permutations (with repetition)

#how about : min(lastB interval[2] max() []

#here: we only care about Bounds: the min & the max, only 

unionPts = union(min(lastB, interval[1]),max(lastB,interval[2]) )
# 
v = collect(first(unionPts):last(unionPts))
_view = view(v, firstindex(v):lastindex(v))

# correct 

#-------

length(_newView)
interval[2]#
lastB
print(first(unionPts))
print(last(unionPts))
compareBounds(first(unionPts), last(unionPts), _view)

if group == 1 # only 1 per item 
    #complete Triad : [lastB, interval[1], interval[2]

    #GET Last b = currentA #pop!
    interval = pop!(_stack)
    #form a view from lastB, & interal (midpoint newInterval[1] becomes implicit)
    #view(lastB,interval[2]))
    #lastb = pts[length(pts)-1 #erroneous part
    # _view = view(pts[length(pts)-1]:interval[2], [lastb, interval[1] , interval[2]] )
    #  _view = view([lastB, interval[1], interval[2]], [lastB, interval[1], interval[2]])# acceptable? 
    v = collect(lastB:interval[2])
    # _view = view(v, lastB:interval[2]) #works # [1,2,3]
    v = collect(lastB:interval[2])
    _view = view(v, firstindex(v):length(v)) # view correctly created 
    ####TODO: DO RemappinG: lastB: interval[2]


    #create view with points of lastb, lastrange 
    # Compare(a, b, _view) #
    _view = collect(lastB: interval[2]) |> v -> view(v, firstindex(v):lastindex(v))

    #sort #TODO: refine #recheck 
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
#pushvif
v = collect(interval[1], interval[2])
(v[1]:last(v)) #unitRange 
v1 = collect(interval[1]:interval[2])

first(v)
last(v)

#uncommentMe if needed 
#view(v, first(v):last(v))
#_view = view(interval, (interval[1]:last(interval)))

#view(v, (v[1]:last(v)))  # missing view 

v = collect(first(v):last(v)) #lastB:interval[2])
a = first(v)
b = last(v)
#v[1],v[2] =  #remap(v[1],v[2]) # 4" 7 -> 1:4 #no remap 
# v = collect(a:b) #first(v):last(v)) #(v[1]: v[2]))
_view = collect(a:b) |> v -> view(v, firstindex(v):lastindex(v))

#remap  1: 4
lo = 0;
hi = 0;
# lo, hi = remap(lo, hi)

_view = view(v, firstindex(v):lastindex(v)) #lo:hi) # done ! #4:7

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

v ; lo = firstindex(v); # , 
_view = view(v, lo:hi) #lastB:last(v))
#done 

#failed attempted to capture what is already dome 
#=
function checkX(groupnum, lastB,_view::view)
    Compare(a,b,_view)
end
=#

#Thus, partition is over 

#------------
# example Abstraction: hungry, nonhungry

# Goals Determines what you see


pts
# 
if length(pts) == 4

    compareBounds(pts[1], pts[2], pts[3], pts[4])

elseif length(pts) == 3
    compareBounds(pts[1], pts[2], pts[3])

elseif length(pts) == 2
    #compareBounds()
    v = collect(pts1[1], pts[2])
    _view = collect(v, firstindex(v):lastindex(v))
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


#----------------------

=#
lastB = 1
interval = [2, 3]
println(interval)
a = interval[1]
b = interval[2]
m = lastB
println("a, m, b", a, m, b)
a, m, b = inferLocation(lastB, interval[1], interval[2])
println("a, m, b", a, m, b)

interval = union(a, m, b)

# lastb = pts[length(pts)-1] #moved out of if scope

_stack = [[1, 3], [4, 7]]

compareTriad(1, 2, 3, [1, 2, 3])


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
midId = length(__int) // 2
midId = 1
#__int[1][1]
__int[midId][1]# 4
__int[midId][2] # 7 

v = collect(__int[midId][1]:__int[midId][2]) #4:7 
#view(__int, interval[id][a]:interval[id][b])


_view = view(v, firstindex(v):lastindex(v))  #__int[1][1]:__int[1][2])  # 4:7

v = collect(__int[1][1]:__int[1][2]) #works  #, __int[1][1]:__int[1][2]) # [4,5,6,7] vector  # 4:7 (wait don;t siklvealready)
view(v, firstindex(v):lastindex(v))   #__int[1][1]:__int[1][2])  # [4,5,6,7] view 

#indexOf(v,v[1])
firstindex(v)
length(v)

#v = 4,5,6,7 
#make a view , with a valid datastructure: vector, with valid mapping (index-1)

n = 1
#_stack[interval[1][a], interval[1][b]]
collect(interval[1][a]:interval[1][n])
_stack
#_view = view(_stack, firstindex(v):length(v))  #interval[1][a]:interval[i][b])
#_view(v, firstindex(v):lastindex(v))   #__int[1][1]:__int[1][2])  # 
_view = collect(_stack) |> _view -> view(_view, firstindex(_view):lastindex(_view))

#-------
#Vital #contains effect: Depreciate 
function traverse(a, b, _view) #, i)

    #length(_stack) > 1
    # length(_view) !== 
    if euclidDistDifference(a, b) >= 1  # that cindition is too classical 
        #the only plac wher we can check the euclid distance 
        effect(a, b, _view)

    end
end

#uses isStoppingCondition
function traverse!(a, b, _view, currentValue=nothing)  # , i) #TODO: Depreciate #reason: has oldfunction: effect

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

function traverse(_stack, a, b) # traverse , a,b  #warning a,b not used #TODO:

    l = length(_stack)
    if l == 1 #evaluate interval 
        interval = pop!(_stack) # first Interval [a,b]
    #do cause 
    #        callCause(a, b, interval) #, _stack)

    elseif l == 2 #works best with 2 

        interval = pop!(_stack) # [a,b]
        #TODO: makeView 
        _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view)) |> x -> checkNextView(_view) # TODO check: checkNextView
    #       callCause(a, b, interval)#, _stack)
    else

        #TOOO: compare : a[a1,b1], b,# [a2,b2]
        compareQuartet(a[1], [2], b[1], b[2])
        ##Create a view for each interval Point 
        a = popat!(a, _stack) # [a1,b1]
        _view = collect(a) |> x -> view(_view, firstindex(_view):lastindex(_view))
        b = popat!(b - a, stack) # [a2,b2]
        _view = collect(b) |> x -> view(_view, firstindex(_view):lastindex(_view))

        #Hint: better to function call traverse! accepting a _view for each of a & b 

    end
end



#-------

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
        #do cause , instead call a kernet function 
        #kernelfunction call 
        kernel(a, b, interval) #, _stack) #TODO: complete: q. what is its  return( should be inner _stack) - with new points 

    #cause(interval[id][1], interval[id][b], view(_stack, interval[id][1]:interval[id][b]))
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
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals) , & 1 interval  
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

        #TODO: use a, b 

        #do cause 
        #kernelfunction call 
        #  callCause(a, b, interval) #, _stack) #TODO:

        #cause(interval[id][1], interval[id][b], view(_stack, interval[id][1]:interval[id][b]))
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

#--- 
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
b = _int[idMid][length(_int)-1]#7

#kernelFunction(a,b, arr)
# id a,b, interval 


#---------
#callCause(idMid, 4, 7, _int) # 4:7
#v = collect(a:b)
#_view = view(v, firstindex(v):lastindex(v))
_view = collect(a:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))

#callCause(idMid, a, b, _int) # view error # correct # loop infinity  TODO:

#-------
_int = [[1, 3], [8, 9]]
pts = []
idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2} #1 

a = _int[idMid][1] #1 
b = _int[idMid][length(_int)] #3
#kernelFunction #1 

a = _int[idMid+idMid][1] # 8 
b = _int[idMid+idMid][length(_int)] # 9 

#----
#Ranges
##[1, 2, 3]
##[3, 4, 5, 6, 7, 8]
#----------
## fill up the stack function  

#kernelFunction #2
_stack = []
#from points to interval indices , getting the `buns` 
_length = copy(length(_int))

#=
for i in 1:_length
    idMid = Integer(ceil(_length / 2)) # 1 # dof = {1,2}
    # local a & b 
    a = _int[i][1] #1 
    b = _int[i][2] #2
    println("a = ", a, " b = ", b)
    push!(_stack, collect((a:b)))

end
=#

#---------
_stack

A = []
#from stack  to point vectors 
#=
for i in 1:length(_stack)

    #idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2}

    println("i = ", i)
    a = firstindex(_stack[i])# [1] # first(i)
    b = lastindex(_stack[i]) #last(_stack[i])[2] #
    #the goal: get a,b
    #a =  _int[i][1] #1 
    #b = _int[i][2] #2

    println("a = ", a, " b = ", b)
    push!(A, collect((a, b)))


end
=#

_stack
A
#=
for i in 1:length(_int)
    # push 
    a = _int[i][1] #<------
    b = _int[i][2]
    push!(pts, a) # every odd has an a value 
    push!(pts, b) # every even has a b value 
end
=#
#------
pts = [] # excellent 

ranges = []
ranges = copy(_stack) # stack has to have at least 2 items for proceeding functions to work 
typeof(_stack)
#-----
#lastB #clue 
#=
a = ranges[1][1]
b = ranges[1][length(ranges[1])] #[2]
=#
_int[1+1][2]


ranges
length(ranges)
# ranges[1]
length(ranges)
arr = collect((1:9))
pts = rangesToPts(ranges)
w = 0
pts = []
#=
for i in 1:length(ranges) #1:3 
        w = rangesToPts(ranges[i])
        for j in 1:length(w)
            push(pts, j)
    end
end
=#
#ranges[0]

# ranges[1]# 3-element Vector{Int64}: 1,2,3
# ranges[2] # 4-element Vector{Int64}: #4,5,6,7
#ranges[3] #2-element Vector{Int64}:
8
9
#----- pts manipulation 
_view = nothing # val

# mapPts()
_length = length(pts)
if _length == 2

    _view = collect(pts[1]:pts[2]) |> _view -> view(_view, firstindex(x):lastindex(_view))
    doCompare(pts[1], pts[2], _view)
end

#=
ranges = copy(_stack)
ranges[1]
ranges[2]

a = ranges[1][1]
b = ranges[1][length(ranges[1])]

a2 = ranges[2][1]
b2 = ranges[2][length(ranges[2])]
=#
#=
#pts to range 
for i in 1:Int(length(pts) // 2)
    # push 
    a = pts[i]#[1]
    b = pts[i+1]#[2]
    v = collect(a:b)
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
        a = pts[i] # + 1
        b = pts[i+1] #- 1

        v = collect(a:b)
        push!(ranges, v)

    end
    return ranges #<----
end # <--------

#------
#pts not defined 
pts = [1, 2, 3, 4, 5]
a1 = pts[1]#[1] #<----
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

# Point to View (ptToView)
""" from a point to a View """
function ptToView(singlePt) # ok 
    try
        a = -1
        b = -1
        _newView = nothing
        if length(singlePt) == 2
            a = singlePt[1]
            b = singlePt[2]

            _newView = collect(a:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        else
            throw(error(msg))
        end

        return _newView
    catch UnexpectedError
        @error msg exception = (UnexpectedError, catch_backtrace())
    end

    # fabricate view from points only 


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

            #  # [1]:lastindex(v))
            print("v = ", interval)
            #  
            # _view = ptToView(interval)
            _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))
            println("_view", _view)
            push!(_views, _view)

        elseif euclidDistDifference(pts[i], pts[i+1]) == 1
            _view = collect(pts[i]:pts[i+1]) |> _view -> view(_view, firstindex(_view):lastindex(_view))
            doCompare(pts[i], pts[i+1], _view)
        end
    end
    return _views
end

function ptsToView(a, b)

    _length = euclidDistDifference(a, b)

    if _length == 0 # a == b (return either element)
        return a #getLastElement(a, b) 
    elseif _length == 1 #|| _length == 0
        v = collect(a:b)

        _view = view(v, firstindex(v):lastindex(v))
        #v1, v2 = remap(v[1], v[length(v)])
        doCompare(a, b, _view) #view(v[1], v[length(v)]))
    else
        v = collect(a:b)
        return view(v, firstindex(v):lastindex(v)) # remap(a,b) #TODO: check usefulness 
    end

end

""" transforms points to views,  on a particular view """
function ptsToViews(pts, _view) # for a particular view

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
        # _view = view(v, _view)
        _view = view(v, _view) #firstindex(v):lastindex(v))  #interval)

        _view = ptToView(interval)

        println("_view", _view)

        push!(_views, _view)
    end
    return _views
end
i = 1
vals, i = mapPts([1, 3], [1, 2, 3, 4, 5], 1)

i
#

#note: _view is related to  _stack (item off it )

# i = length(_stack) # last item 
#

# unnamed Function: f1
"""Unnamed function"""

function f1(_stack)

    _length = copy(length(_stack))
    for i in _stack

        if _length > 1
            interval = popat!(stack, i) #interval, each has 2 bounds 
            a = interval[1]
            b = interval[2]

            #TODO: How to check in between the function
            #make view 
            # v = collect(a:b)
            # _view = view(v, firstindex(v: lastindex(v)) 
            _view = collect(a:b) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #new:pass new info 

            return false, _view
        elseif _length == 1
            return true, nothing
        end
    end
end

## Event-Driven: f1
"""Event-Driven function """
function f1(_stack, i) # unknown Unamed funtion (yet ) #TODO: rename into a meaningfulname 
    _length = copy(length(_stack))

    #for i in _stack 
    if _length > 1 && i <= _length
        interval = popat!(stack, i) #interval, each has 2 bounds 
        a = interval[1]
        b = interval[2]
        #make view 
        #v = collect(a:b)
        #_view = view(v, firstindex(v: lastindex(v)) #new:pass new info 
        _view = collect(a:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        #TODO: return false, _view [new information ]

        return false, _view
    elseif _length == 1
        return true, nothing
    end
end


# Next Sort 
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



v = collect(interval)
view(v, firstindex(v):lastindex(v))
#depreciate 
function ptsToViews(pts, arr) #Warning: function doesn't use arr # Depreciate 

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
            _view = collect((interval)) |> _view -> view(_view, firstindex(_view):lastindex(_view))
            println("_view", _view)
            push!(_views, _view)
        elseif euclidDistDifference(pts[i], pts[i+1]) == 1
            # TODO: View true form  @
            doCompare(pts[i], pts[i+1], view(collect(pts[i]:pts[i+1]), firstindex(pts[i]):lastindex([pts[i+1]])))# fixed 
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
#Hint: this opens the door for a fine point manipulation 
#---pts testing
a1 = pts[1]#[1]
b1 = pts[1+1]#[2] #correct (it was a coincidence) #3 

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
vals = mapPts(pts, arr)
vals = mapPts(pts, arr, 1)

ranges = ptsToRanges(pts)


#-----------
doCompare(2, 4, [1, 2, 3, 4])

if [1, 2, 3, 4][1] > [1, 2, 3, 4][2]
    m1, b, _isSwapped = doCompare(1, 2, [1, 2, 3, 4])
    println("twinMiddles [m1, m2]= ", m1, " ", b, " swapped ")
end
#m1

doCompare(1, 4, [1, 2, 3, 4]) # 1 4
a = 1;
b = 1;

if [1, 2, 3, 4][a] > [1, 2, 3, 4][b] #<--------
    #a, b, _isSwapped = 
    doCompare(a, b, [1, 2, 3, 4])
    a += 1
    b += 1
    println(" [a, b]= ", a, " ", b, " swapped ")
else
    println("processing failed ")
end

doCompare(1, 2, [1, 2, 3, 4])# 1 2 

m1 = 2
if [1, 2, 3, 4][a] > [1, 2, 3, 4][m1]
    a, m1, _isSwapped = doCompare(a, m1, [1, 2, 3, 4])
    println(" [a, m1]= ", a, " ", m1, " swapped ")
end


#println("a, m2, b = ", a, m2, b)

doCompare(3, 4, [1, 2, 3, 4])

m2 = 2 + oneunit(2)
if arr[m2] > arr[b]
    m2, b = doCompare(m2, b, [1, 2, 3, 4])
end

arr = [1, 2, 3, 4]
a, b, _isSwapped = doCompare(firstindex(1), lastindex(4), arr)
a, m1, _isSwapped = doCompare(firstindex(1), lastindex(2), arr)
m1, b, _isSwapped = doCompare(firstindex(2), lastindex(4), arr)
m2, b, _isSwapped = doCompare(firstindex(3), lastindex(4), arr) #<------

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
=#
interval = nothing  # == nothing
#ismissing(interval)
# set interval 

oldInterval = collect(1:4)
interval = collect(5:7)
# interval[1] = 1; interval[2]=5

#TODO: fix issue with the union set #UncommentMe
## MethodError: no method matching getindex(::Nothing, ::Int64)

_unionSet = collect(interval[1]:interval[2])
#UnionAll(oldInterval[2],_unionSet)

totalSet = union(oldInterval[2], _unionSet)
interval = firstindex(1):lastindex(totalSet)
_view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))
# (v, (1:length(v)))
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
#--
_first = 1
_second = 2
_third = 3

#create a view 
_view = collect(1:3)
_view = view(_view, firstindex(_view):lastindex(_view))

#pass to function in question 
compareTriad(_first, _second, _third, _view) #<-----

#-----
## An example Experiment: 

interval = popfirst!(_stack) # sequential pop of a stack  # popped value is lost #  decreases _stack by 1 
println("popped stack item: interval ", interval)
println("Typeof = ", typeof(interval))
interval = collect(interval)
println("interval, after collect ", interval)
interval == oldInterval # check intervals equality 
println("popped stack item: interval ", oldInterval)
println("Typeof(oldIndex) = ", typeof(oldInterval))

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
#TODO: Merge oldInteral with interval:
##ERROR: LoadError: BoundsError: attempt to access 1-element UnitRange{Int64} at index [1:3]
#remapping issue 
_unifiedInterval = union(oldInterval, interval) #[1, 2, 3]
println("unified Interval = ", _unifiedInterval)
println("oldInterval = ", oldInterval) #[1])

println("typeof(oldInterval) = ", typeof(oldInterval)) #[1])
println("typeof(oldInterval) = ", typeof(oldInterval)) #[1]) # typeof(oldInterval) = UnitRange{Int64}

# oldInterval = oldInterval

oldInterval1 = collect(oldInterval[1]:oldInterval[2])
println("typeof(oldInterval1) = ", typeof(oldInterval1)) # typeof(oldInterval1) = Vector{Int64}
oldInterval2 = collect(oldInterval)
println("typeof(oldInterval2) = ", typeof(oldInterval2)) # typeof(oldInterval2) = Vector{Int64}

println("oldInterval1 == oldInterval2 ", oldInterval1 == oldInterval2)

println("Interval  = ", interval)  #[1]) # typeof(interval) = Vector{Int64}
println("typeof(interval) = ", typeof(interval))


println("oldInterval[last] = ", oldInterval[lastindex(oldInterval)])
println("interval[last] = ", interval[lastindex(interval)])

#---
v = [3, 4]
_view = (v, firstindex(v):lastindex(v))

isUnitDistanceReached(v[1], v[2])
#original Issue: 
#oldInterval = collect(1:3)
#interval = collect(1:4)
_view = collect(oldInterval[1]:interval[lastindex(interval)])

# compareTriad(oldInterval[2], interval[1], interval[2], _view)

_isSwapped = nothing

#_view = collect(a:m1) |> 
#suggest: use a,b as bounds of the current _view 
_view = view(_view, firstindex(_view):lastindex(_view))

a, m1, _isSwapped = doCompare(a, m1, _view) # <----

println(" [a, m1]= ", a, " ", m1, " checked ")
mid = m1 + 1
v = collect(mid:b)
_view = view(_view, firstindex(v):lastindex(v))  # (_view, _view)
# mid, b, _isSwapped = mid < b && length(_view)>1 ?
if mid < b && length(_view) > 1
    println("mid = ", mid)
    println("b = ", b)
    println("_view = ", _view) # [3, 4] #note : difference  = 4 -3 = 1 # infer: missing functionality for d=1 
    mid, b, _isSwapped = doCompare(mid, b, _view) #: return  #doCompare(m1, b, _view) #<-------
end

#----
#
oldInterval = collect(1:3)
_view1 = view(v, firstindex(v):lastindex(v)) # 1 7 # <---------
#a, b, m1, m2 = compareBounds(oldInterval, interval, _view) #correct # 1 7 3 4  TODO: # UncommentMe
# compareTriad Error 

#try
if a !== Nothing && m1 !== Nothing && b !== Nothing && arr !== Nothing

    _isSwapped = nothing
    #_view = collect(a:m1) |> 
    #suggest: use a,b as bounds of the current _view 
    a != b ? _view = view(_view, firstindex(a):lastindex(b)) : return "a == b scalar: a = ", a, " b = ", b

    # 1,2,3  d(1,3)+1 =4 /2 = 2 IS EVEM a, m1, m2 

    if isEven(a, b) == true #TODO: isEven a, m1, m2 : (a,m1] mid=m1+1

        if a != m1 # fail-safe mechanism 
            a, m1, _isSwapped = doCompare(a, m1, _view) # [a, m1]= 1 2 checked
            println(" [a, m1]= ", a, " ", m1, " checked ")
        elseif a == m1 # fallback 
            a, m1, _isSwapped = a, m1, nothing
        end
        # a, m1, _isSwapped = doCompare(a, m1, _view) # [a, m1]= 1 2 checked  # <-----
        #println(" [a, m1]= ", a, " ", m1, " checked ")

        mid = m1 + 1
        if mid != b  #TODO: needs an end 
            _view = collect(mid:b) # |> 
            _view = view(_view, firstindex(_view):lastindex(_view))  # (_view, _view)
            # mid, b, _isSwapped = mid < b && length(_view)>1 ?

            if mid < b && length(_view) > 1 # this condition should be global
                mid, b, _isSwapped = doCompare(mid, b, _view) #: return  #doCompare(m1, b, _view) #<-------
                if mid != b # where it fails 
                    mid, b, _isSwapped = doCompare(mid, b, _view) # [a, m1]= 1 2 checked
                else # fallback 
                    mid, b, _isSwapped = 1, 1, nothing
                end
            end
        elseif mid == b #a , m1, b 



            #=
                #if isEven() 
                #else
                if a != m1  #m1 == b  # was m ==b : m undefined
                    println(" [a, m1]= ", a, " ", m1, " checked ")
                    v = collect(a:b)
                    _view = view(v, firstindex(v):lastindex(v))

                elseif a == m1
                    println("twinMiddles [m1, b]= ", m1, " ", b, " checked ")
                end
                if m1 != b
                    v = collect(a:b)
                    _view = view(v, firstindex(v):lastindex(v))
                elseif m1 != b
                    println("twinMiddles [m1, b]= ", m1, " ", b, " checked ")
                end
                =#
            #   end
        end
        #  else # should be throw(error...)
        #       return
    end


    #fail_safe mechanism applied : 
    if a != b
        v = collect(a:b)
        _view = view(v, firstindex(v):lastindex(v))  #_view -> view(_view, firstindex(a): lastindex(b))          
        #   if a != b
        a, b, _isSwapped = doCompare(a, b, _view) # < -----
    else # a == b fallback 
        a, b, _isSwapped = a, a, nothing
    end

end

println(" [a, b]= ", a, " ", b, " checked ")
println("a, m1, b = ", a, m1, b)
if a === nothing || b === nothing || m1 === nothing
    return nothing, nothing, nothing
else
    return a, b, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]

end
#TODO: replace with compareTriace for a _view 
#----

group = 2
if group == 2 #,-----

    # if so compare contents then, reset group 
    #TODO: define _newView (from)

    #    v = collect((oldInterval[2], interval[1], interval[2])) #(oldInterval[1]:interval[2]))# 1 7
    #    _view = view(v, firstindex(v):lastindex(v) )

    # view(collect(v), v)

    #v =
    #Check if values are sorted 
    #experiment: 
    println("first = ", oldInterval[2]) # 2
    println("second = ", interval[1]) # 1
    println("third = ", interval[2]) # 3


    # Sort the 3 points: oldInterval[2], interval[1], interval[2] , using inferLocation
    _first, _second, _third = inferLocation(oldInterval[2], interval[1], interval[2]) # sorts a 3 points 
    unifiedPts = union(_first, _second, _third)
    #v = collect(1:length(totalSet))
    v = collect(first(unifiedPts):last(unifiedPts))

    _view = collect(_first:_third)

    _view = view(v, firstindex(v):lastindex(v))
    _view = view(_view, firstindex(_view):lastindex(_view)) #collect(v), 1:length(v))
    # a, b, m1, m2 = compareBounds(_first, collect(_second:_third), _view) # compare interval bounds  # <---
    # a, b, m1, m2 = compareBounds(_first, _second, _third, _view)

    #_first, _second, _third = inferLocation(_first, _second, _third) # valid output 
    #check values: 
    println("first = ", _first)
    println("second = ", _second)
    println("third = ", _third)
    unifiedPts = union(_first, _second, _third)

    v = collect(first(unifiedPts):last(unifiedPts))
    _view = view(v, firstindex(v):lastindex(v))

    a, b, m1, m2 = compareTriad(_first, _second, _third, _view) #<---- handling scalar i.e. 1,1 # still unhadeled 
    println("a = ", a, " b = ", b, " m1 = ", m1, " m2 = ", m2)
    group = 0 # reset group 
end

#---
# if m1 not defined! 
m1 = 1 # when m1 = 1 ( a = 1 = m1 )
#experimental : compareTriad 
_isSwapped = nothing

# fail_safe mechanism 
if a != m1
    v = collect(a:m1)
    _view = view(v, firstindex(v):lastindex(v)) # 0
else #a == m1 scalar situation
    _msg = "a == b scalar situation: a = ", a, " b = ", b
    print(msg)

end

#_view = collect(a:m1) |> 

#suggest: use a,b as bounds of the current _view 
# fail_safe mechanism 
_msg = "a == b scalar situation: a = ", a, " b = ", b
#a != b ? _view = view(_view, firstindex(a):lastindex(b)) : return _msg  # a = 1 , b = 1  #scalar  3
if a != b
    v = collect(a:b)
    _view = view(_view, firstindex(v):lastindex(v)) #firstindex(a):lastindex(b)) # a = 1 , b = 1  #scalar  3 # access 0ement at index 1:1] or no method matching iterate (:Nothing )
else # a == b # fsll
    println(_msg)
    return a, b, nothing
end

#m1 is given by input parameter 
print(a)
#if m1 !== Nothing 
if a != m1 # where it fails 
    a, m1, _isSwapped = doCompare(a, m1, _view) # [a, m1]= 1 2 checked
else # fallback 
    a, m1, _isSwapped = 1, 1, nothing
end
#<----- #scalar has to skip doCompare : 1,1,nothing 
println(" [a, m1]= ", a, " ", m1, " checked ")

mid = m1 + 1
print(b)# 2 # issue: m1: b => 2:3 
_view = collect(mid:b) # |> 
_view -> view(_view, firstindex(mid):lastindex(b))  # (_view, _view)
# mid, b, _isSwapped = mid < b && length(_view)>1 ?
if mid < b && length(_view) > 1
    mid, b, _isSwapped = doCompare(mid, b, _view) #: return  #doCompare(m1, b, _view) #<-------
else
    return

    println("twinMiddles [m1, b]= ", m1, " ", b, " checked ")

    _view = collect(a:b) # |>  
    _view = _view -> view(_view, firstindex(a):lastindex(b))
    a, b, _isSwapped = doCompare(a, b, _view)
    println(" [a, b]= ", a, " ", b, " checked ")

    println("a, m1, b = ", a, m1, b)
    if a === nothing || b === nothing || m1 === nothing
        return nothing
    else
        return a, b, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]
    end
end
# end

#----

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
#_view = collect(v, (lastB:interval[2]))
#_view = collect(v, lastB:interval[2])
#_view = collect( lastB:interval[2],v) # wong 
#collect(lastB, interval[2])

v = collect((lastB:interval[2]))
#if length(v ) == 1 #TODO: if scalar Then return 

# _view = view(v, firstindex(v): lastindex(v))

unifiedPts = union(lastB, interval[1], interval[2])
v = collect(first(unifiedPts):last(unifiedPts))
#_view = collect(lastB:interval[2])  # |> 
# _view=  view(_view, firstindex(_view):lastindex(_view))

_view = view(v, firstindex(v):lastindex(v))  #view(v,firstindex(v):lastindex(v))

print(_view) # 7 8 9 #TODOD: it should be 7 8 9 (Got only 5 !)

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

    #make a view 
    #correctly compiles
    #v = collect(lastB:interval[2]) # 1 7 # 7 8 9
    #   _view = viewe(v, (lastB:interval[2]))

    #    _newView = newView(lastB, interval[2])
    #v1, v2 = remap(lastB, interval[2]) #TODO: check its usefulness 

    #v = collect(v1:v2)
    #Sort Indicies
    _first, _middle, _last = inferLocation(lastB, interval[1], interval[2])
    unifiedPts = union(_first, _middle, _last)

    v = collect(first(unifiedPts):last(unifiedPts))
    _view = view(v, firstindex(v):lastindex(v))

    # _view = collect(min(_first, _last):max(_first, _last)) |> v -> view(v, firstindex(v):lastindex(v))# new info found: _view #TODO: search 

    res = compareTriad(_first, _middle, _last, _view) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
    group = 0
    if res === nothing
        return res
    elseif res !== nothing
        a, b, m1 = res #unzip res 
        return a, b, m1, _view
    end

    #  return a, b, m1
end

#----------
## Comparing two intervals of a stack 

function compareIntervals(_stack, _newView::SubArray, interval, group=0) # _view)#misspecification error  # TODO: 

    # group = 0
    #interval = nothing
    #oldInterval = nothing

    if _length === nothing

        _length = copy(length(_stack))
    end
    if i === nothing
        i = 1 # Set 
    end

    for _ in 1:length(_stack) # i in 1:length(_stack)  #_view) 
        group += 1
        #do 
        if (interval === nothing) == false #ismissing(interval) ==false #i.e. has a value  #interval !== nothing # on the 2nd, 4th , every even Run # if it has a value (from previous run) # interva==nothing
            oldInterval = interval # store value 
        end

        interval = pop!(_stack) # sequential pop of a stack  
        #-----
        group += 1
        # _view = NewView(oldInterval[1], interval[2])

        unifiedPts = union(min(first(oldInterval), first(interval)),
            max(last(oldInterval), last(interval)))

        v = collect(first(unifiedPts):last(unifiedPts)) #oldInterval[1]:interval[2])# 1 7
        _view = view(v, firstindex(v):lastindex(v)) # (oldInterval[1]:interval[2]))

        a, b, m1, m2 = compareBounds(first(unifiedPts), last(unifiedPts), _view)
        return a, b, m1, m2
        #------
        if group == 2
            # if so compare contents then, reset group 

            #TODO: define _newView (from)

            a, b, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
            return a, b, m1, m2
        end

    end
    _length -= 1 #decrement by 1 
    #finally last check if group = 1
    if group == 1 && _length == 0 #i==_length-1 # && reached the end i.e. 

        lastB = getlastB(_stack)

        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]

        # unifiedPts = union(min(first(union_old), first(union_new)), max(last(union_old), last(union_new)))
        unifiedPts = union(lastB, interval[1], interval[2])

        v = collect(first(unifiedPts):last(unifiedPts))
        _newView = view(v, firstindex(v):lastindex(v))

        #_newView = newView(lastB, interval[2])

        #Compare() # compareTriad 

        #-----
        #make a view (with a proper remapping )

        a = indexOf(v, v[1])
        m1 = indexOf(v, v[2])
        b = indexOf(v, v[3])
        a[1], b[1], m1[1] = inferLocation(a[1], m1[1], b[1])
        a, b, m1 = compareTriad(a[1], m1[1], b[1], _view)

        #-----
        group = 0
        return a, b, m1
    end
end

function compareIntervals(_stack, _newView::SubArray, interval=nothing, group=0, i=0) # _view)#Misspecification error  # TODO: 

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
            return a, b, m1, m2
        end

    end

    #finally last check if group = 1
    _newView = NewView(1, _length - 1) #<--------------
    compareIntervals(_stack, _newView)
    if group == 1

        lastB = getlastB(_stack)

        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]
        union_old = union(min(oldInterval[first(oldInterval)]), oldInterval[lastindex(oldInterval)]) #a1,b1 
        union_new = union(min(interval[firstindex(interval)]), interval[lastindex(interval)]) # a2, b2
        unifiedPts = union(min(first(union_old), first(union_new)), max(last(union_old), last(union_new)))

        #golden line:
        v = collect(first(unifiedPts):last(unifiedPts))
        _newView = view(v, firstindex(v), lastindex(v))
        # _newView = view(lastB:interval[2], (lastB, interval[2]))


        #Compare() # compareTriad 
        a, b, m1 = compareTriad(lastB, interval[1], interval[2], _newView) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
        group = 0
        return a, b, m1
    end
end

#vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)
#interval = collect(first(interval):last(interval))


function compareIntervals(_stack, _newView::SubArray, interval, group=0) # _view)#misspecification error  # TODO: utilize _newView 

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

        interval = pop!(_stack) #1. sequential pop of a stack 
        #2. vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)
        interval = collect(first(interval):last(interval))

        v = collect(first(interval):last(interval))
        _newView = view(v, firstindex(v), lastindex(v))

        #-----
        group += 1
        # _view = NewView(oldInterval[1], interval[2])
        v = collect(oldInterval[1]:interval[2])# 1 7
        _view = view(v, firstindex(v):lastindex(v))

        a, b, m1, m2 = compareBounds(oldInterval, interval, _view)
        #------
        if group == 2
            # if so compare contents then, reset group 

            #TODO: define _newView (from combb) # done 
            union_old = union(min(oldInterval[firstindex(oldInterval)]), oldInterval[lastindex(oldInterval)]) #a1,b1 
            union_new = union(min(interval[firstindex(interval)]), interval[lastindex(interval)]) # a2, b2
            unifiedPts = union(min(first(union_old), first(union_new)),
                max(last(union_old), last(union_new)))
            v = collect(first(unifiedPts):last(unifiedPts))
            _newView = view(v, firstindex(v), lastindex(v))
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

        unifiedPts = union(min(lastB:interval[1]), max(lastB:interval[2]))
        v = collect(firstIndex(unifiedPts):lastIndex(unifiedPts))
        _newView = view(v, firstindex(v):lastindex(v))#lastB:interval[2], (lastB, interval[2]))

        #    _newView = newView(lastB, interval[2])

        #Compare() # compareTriad #Erroneous  #TODO:  fix 

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


## compareIntervals, of a `_stack`, a  view `_newView`, an `interval`` , a  `group` & an index `i`

function compareIntervals(_stack, _newView::SubArray, interval=nothing, group=0, i=0) # _view)#Misspecification error  # TODO: 

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
        interval = pop!(_stack) #1. sequential pop of a stack  

        #vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)

        interval = collect(first(interval):last(interval))

        if group == 2
            # if got 2 groups, compare contents then, reset group 

            #TODO: define _newView (from)
            a, b, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
            return a, b, m1, m2
        end

    end

    #finally last check if group = 1
    _newView = NewView(1, _length - 1) #<--------------
    compareIntervals(_stack, _newView)
    if group == 1

        lastB = getlastB(_stack)

        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]
        unifiedPts = union(min(lastB:interval[1]), max(lastB:interval[2]))

        v = collect(first(unifiedPts):last(unifiedPts))

        _newView = view(v, firstindex(v):lastindex(v))#lastB:interval[2], (lastB, interval[2]))

        #Compare() # compareTriad 
        a, b, m1 = compareTriad(lastB, interval[1], interval[2], _newView) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
        group = 0
        return a, b, m1
    end
end
#=  
  #--------------
  #check inputs 
  _stack
  interval = nothing
  compareIntervals(_stack, _View, interval, oldInterval, group, _length)
  compareIntervals(_stack, arr, 1) # compile error 
=#

# compareIntervals 

## compareIntervals, of a `_stack` & vector array `arr`

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
        #vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)

        interval = collect(first(interval):last(interval))
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

## compareIntervals, of a `_stack`, a  vector array `arr`, & an index `i`

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
        #vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)
        interval = collect(first(interval):last(interval))

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
    _newView = collect(1:_length) |> _view -> view(_view, firstindex(_view):lastindex(_view))
    #return compareIntervals(_stack,_newView)
    #finally last check if group = 1
    if group == 1 # done 

        lastB = getlastB(_stack)
        # input handling 
        #                _min = min(lastB, interval[1], interval[2])
        _first, _middle, _last = inferLocation(lastB, interval[1], interval[2])
        res = nothing
        #interval 
        group = 0 # reset group 
        _view = collect(_first:_last) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        #_view = union(min(_first, _middle, _last), max(l_first, _middle, _last)) |> x -> view(x, firstindex(x):lastindex(x))

        res = compareBounds(_first, collect(_middle:_last), _view)
        if res !== nothing #Nothing
            res = compareBounds(_first, _middle, _last, arr) #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr 
            a, b, m1 = res
            #return nothing
            return a, b, m1
        elseif res === nothing
            return

        end
        #a, b, m1 = res
        #group = 0 # reset group 
        # return a, b, m1
    end
    i = i + 1
    return compareIntervals(_stack, _newView, i) #ok 
end

## compareIntervals, of a `_stack`, a  vector array `arr`, a group number `group` , & an index `i`

function compareIntervals(_stack, arr::Array{Int64,1}, interval=nothing, group=0, i=0::Int64) #vital #compiles  ## oldInterval=nothing [removed]
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
            oldInterval = interval # the issue: inside the if  oldInterval cannot be 
        end
        interval = pop!(_stack) # 1. pop the next _stack iterm , get interval bounds 
        #2. vectorize interval (or extern interval to include rationals (indicies) between first & last bound)

        interval = collect(first(interval):last(interval))

        if group == 2
            # if so  then, reset group 
            a, b, m1, m2 = compareBounds(oldInterval, interval, arr)
            group = 0
            return a, b, m1, m2
        end
        #finally call next  , subarray #TODO: 

    end

    #  _newView = view(1, _length)
    length(arr)
    newView
    print(_length)
    # v = collect((1:_length))  #makeVector((1:_length))
    # _newView = view(v, i)
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
    #_newView = view(v, i)
    _newView = view(v, (1:_length-1)) #length(arr - 1))
    return compareIntervals(_stack, _newView)
end

_stack

compareIntervals([[1, 3], [4, 7], [8, 9]], arr, 1)
arr
#view(v,(1, 3))


A = compareIntervals(_stack, arr, i)
#---------
# Experiment 
# say on the stack have the following indicies (output of a custom partition function )
_stack = [[1, 3], [4, 7], [8, 9]]
#---------
#checked(#1)
group = 0 # we got to have some form of group (structure)
interval = nothing
oldInterval = nothing
a = -1
b = -1
m1 = -1
m2 = -1
#for _ in 1:length(_stack)
_length = copy(length(arr))

i = 1 # inialize i to 1 
if i <= _length - 1
    group += 1 # increment group 

    #do 
    if interval !== nothing # if interval has a value 
        # store it to oldInterval 
        oldInterval = interval
    end

    interval = popfirst!(_stack) #next, pop the first  interval item, on _stack
    # build a vectorized version of an interval  

    interval = collect(first(interval):last(interval))

    if group == 2
        # if so  then, reset group 
        # or using compareQuartet 
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
_view = union(min(lastB, interval[1], interval[2]), max(lastB, interval[1], interval[2])) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #TODO: please Check

interval# 4 7 
oldInterval#1 3
#---------
A
_stack = [[1, 3], [4, 7], [8, 9]]
res
res = compareIntervals(_stack, arr, i)
res
_stack = [[1, 3], [4, 7], [8, 9]]
arr
res = compareIntervals(_stack, arr, i + 1)# 7, 9, 8, 4  a,b ,m1, m2 ; should've been 1, 9,  
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

#TODO: how to get b of previous interval? make getB 


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

# ranges on a list 

## ranges on a vector array 
"""Recursive function : compares a bounds in ranges of a Vector arr """
function boundComparisonCondition(ranges, arr) # promising 
    try
        # for i in 1:length(ranges)
        _length = legnth(arr)
        i = _length #  # i is inferred by the length of arr  
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

## ranges on a _view 

"""Recursive function : compares a bounds in ranges of a Vector _view """
function boundComparisonCondition(ranges, _view) # promising 

    try
        # for i in 1:length(ranges)
        _length = legnth(_view)
        i = _length  # i is inferred by the length of a _view 
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

#highly Experimental 

"""f: Unknown function """
function f(_sets, arr) # O = length(_sets)

    for i in 1:length(_sets)   # O = length(_sets)

        # ptsToRanges() # requires pts # TODO: 
        # compare every set's bounds 
        #finally , compare contents  at ranges 
        boundComparisonCondition(ranges, arr, i)

    end

end

# Minimax 
"""Minimax function"""
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
function minimax(_sortedInterval1, _sortedInterval2, _unsortedInterval, arr) #Warning : arr is unused # depreciate 

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

    # or, as an online learner About Location, we can , logically infer location,correctly
    #how: by inferring (invoke: infer location , for any three indices : output returs the sorted )
    lower = _sortedInterval1[1] # lowerContent 
    upper = _sortedInterval2[2]# upperContent 
    a = _arr[a]

    lower, upper, a = inferLocation(lower, upper, a) # compare contents 
    b = _arr[b]
    lower, upper, b = inferLocation(lower, upper, b)

end

#=
either we compare the 3 contents on their on, once & for all [classic]
or, we can online learn x's location from already mde predicates [dynamic]
=#



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

#Note: requires: indexOf 


# handleMultipleIndicies

## handleMultipleIndicies of a vector array 
""" handles multiple Indicies"""
function handleMultipleIndicies(X, arr)

    try
        #matchedIndicies >= 2 
        #if matchedIndicies == 2 
        firstXIndex = firstindex(findall((x -> x == arr[X]), arr)) # [1]
        # newXIndex == findall(( x -> x == arr[X]), arr)[1] #[1] #IndexOf(newlocation[1], x) # given new index the only clue for location 
        #_XContent = arr[X] #newlocation[newXIndex]

        # oldXIndex
        lastXIndex = lastindex(findall((x -> x == arr[X]), arr))
        #  newXIndex = lastIndex(newXIndex)
        ret_Val = nothing

        if firstXIndex == lastXIndex # there is only 1 unique match of arr[d]
            # pick one 
            ret_Val = lastXIndex, nothing, nothing
            # if oldXIndex > newXIndex #
            # else if oldIndex > newIndex 

            #else if firstXIndex > lastXIndex ret_Val # Irrational option (index of array is in Ascending Ordered  )

        elseif firstXIndex < lastXIndex #Rationally Logical 
            #content check

            if arr[firstXIndex] > arr[lastXIndex] # dichotomy (index,content)

                firstXIndex, lastXIndex, IsSwapped = doCompare(oldXIndex, newXIndex, arr)

                ret_Val = firstXIndex, lastXIndex, IsSwapped

            elseif arr[firstXIndex] == arr[lastXIndex] #Equal Content 
                ret_Val = arr[firstXIndex], arr[lastXIndex], nothing

            elseif arr[firstXIndex] < arr[lastXIndex]
                ret_Val = nothing, nothing, nothing
            end

        else
            throw(error("either firstXIndex > lastXIndex or UnexpectedError Occured "))
        end
        return ret_Val
        #end
    catch UnexpectedError
        #return ret_Val 
        @error "either firstXIndex > lastXIndex or UnexpectedError Occured " exception = (UnexpectedError, catch_backtrace())
    end
end

# Update Location 

## Update Location  of a vector array


"""update location, given an Index X """
function updateLocation(a, b, X, arr) #sophisticated #TODO: test 

    #aIndex = indexOf(arr, a)[1] # arr[indexOf(arr, a)[1]] # == a
    aIndex = firstindex(findall((x -> x == arr[a]), arr)) #[1]

    #bIndex = indexOf(arr, b)[1] #arr[indexOf(arr, b)[1]]
    bIndex = lastindex(findall((x -> x == arr[b]), arr)) # [1]
    XIndex = nothing
    X < length(arr) ? XIndex = arr[X] : nothing

    #logically:  a <b & arr is sorted (i.e contentA < contentB )
    aIndex < bIndex && arr[aIndex] < arr[bIndex] && XIndex <= bIndex == true #always

    # x index 
    # xcontent 

    #newXIndex
    oldXIndex = findall((x -> x == arr[X]), arr)[1]
    # newXIndex = = findall(( x -> x == arr[X]), arr)[1] #[1] #IndexOf(newlocation[1], x) # given new index the only clue for location 
    _XContent = arr[X] #newlocation[newXIndex]

    # oldXIndex

    newXIndex = findall((x -> x == arr[X]), arr)
    newXIndex = lastIndex(newXIndex)

    # sometimes 
    # oldXIndex = indexOf(arr, _XContent) #Warning if you pop; locations wll be misused  #TODO: check: old Index == newIndex 

    #compare oldIndex with newIndex #assume cadlag 
    if arr[oldXIndex] > arr[newIndex] # && oldXIndex != newXIndex
        oldXIndex, newXIndex, contentSwapped = doCompare(oldXIndex, newXIndex, arr)
    end
    # 

    if newXIndex == firstindex(arr) #1 # it's min, should be are the start 
        insert!(arr, aIndex, arr[X])
    elseif newXIndex == 2 # in the middle 
        insert!(arr, aIndex + 1, _XContent)

    elseif newXIndex == lastindex(arr) #3 # the max # add at the end 
        insert!(arr, bIndex, _XContent)
    end
    #newXContent = newlocation[IndexOf(arr, x)[1]] # can be 1 , 2, or 3 
    # oldxIndex = arr[indexOf(arr, x)[1]]
    #indexOf(arr, a)
end

"""update location, given an Index X """
function updateLocation(a, b, _XContent, arr) #sophisticated #TODO: test 

    #aIndex = indexOf(arr, a)[1] # arr[indexOf(arr, a)[1]] # == a
    aIndex = findall((x -> x == arr[a]), arr)[1]

    #bIndex = indexOf(arr, b)[1] #arr[indexOf(arr, b)[1]]
    bIndex = findall((x -> x == arr[b]), arr)[1]
    #logically:  a <b & arr is sorted (i.e contentA < contentB )
    aIndex < bIndex && arr[aIndex] < arr[bIndex] && newlocation <= bIndex == true #always

    # x index 
    # xcontent 

    #newXIndex

    oldXIndex = findall((x -> x == _XContent), arr)[1]

    newXIndex = findall((x -> x == _XContent), arr)
    newXIndex = lastIndex(newXIndex)

    # sometimes 
    # oldXIndex = indexOf(arr, _XContent) #Warning if you pop; locations, it wll be misused  #TODO: check: old Index == newIndex 
    #compare oldIndex with newIndex #assume cadlag 

    if arr[oldXIndex] > arr[newIndex] # && oldXIndex != newXIndex
        oldXIndex, newXIndex, contentSwapped = doCompare(oldXIndex, newXIndex, arr)
    end

    if newXIndex == 1 # it's min, should be are the start 
        insert!(arr, aIndex, _XContent)
    elseif newXIndex == 2 # in the middle 
        insert!(arr, aIndex + 1, _XContent)

    elseif newXIndex == 3 # the max # add at the end 
        insert!(arr, bIndex, _XContent)
    end
    #newXContent = newlocation[IndexOf(arr, x)[1]] # can be 1 , 2, or 3 
    # oldxIndex = arr[indexOf(arr, x)[1]]
    #indexOf(arr, a)
end
#arr
#[1 7 ] = [a b ]
#
ar = collect(1:7)
x = 10
updateLocation(1, 7, x, ar)  #5, ar) #TODO: complete & check 

collect(4:1)# []
collect(1:4)

#==#


# Divide Conquer Strategy 

_stack
# Divide function with fRecurse
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
    #TODO: add Catch (for a try statement)

end

#------

# Conquer function with Conquer function 
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

_view = collect(2:3) |> _view -> view(_view, firstindex(_view):lastindex(_view))
#res = remap(v[1], v[length(v)])

#TODO: check where this implemenetation:
_view = collect(res[1]:length[s]) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #compiles no bugs

_view = collect(2:3) |> _view -> view(_view, firstindex(_view):lastindex(_view))
#----


#-----

#------
#
#v = collect(2:3)
#_view = view( v, firstindex(v):lastindex(v))

_view = collect(2:3) |> _view -> view(_view, firstindex(_view):lastindex(_view))

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



view(collect((2:3)), 2:3) # view is correct 

#

##view(collect((2:3)), remap(2,3)) # view is correct 
#_view = collect(2:3) |> _view -> view(_view, firstindex(_view):lastindex(_view))

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
#--------

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

# euclidDistDifference
#added compareBounds




# End Reached function 


#-------

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
m2 = b - 2
b
firstindex(v)
lastindex(v)
v
v = collect(m2:b)
_view = view(v, firstindex(v):lastindex(v))
#------
#TODO: Apply in a function 
#check the Right Side
rightDist = euclidDistDifference(m2, b)

if rightDist > 1 #? 
    middle(m2, b) #, view(collect(m2:b), m2:b)) #: return 

elseif rightDist == 1
    v = collect(m2:b)
    _view = view(v, firstindex(v):lastindex(v))

    doCompare(m2, b, _view)

end

#3 #TODO: try out  #Error 

n, m = nothing, nothing  #MethodError: no method matching iterate(::Nothing)#thrown when 2 (or more) vars has recieved null return -nothing 
n
m

m2
m2 + 1
b - 1
b

#Note: m2 == b-1 ==4 ; m2+1 ==b ==5  then its only 2 points m2, m2+1

# m1, m2 relation 
v = collect(m2:m2+1)
_view = view(v, firstindex(v):lastindex(v)) # BoundsError: attempt to access 2-element Vector{Int64} at index [1, 2] #lesson learned [x1 x2]

# m2,b-1 || 
if m2 == b - 1 && m2 + 1 == b
    doCompare(m2, m2 + 1, _view)
else
    compareQuartet(m2, m2 + 1, b - 1, b, _view)
end

#---- 
a = m2 + 1;
b = b - 1;
#-----
res = nothing

# orphaned Code Block compiles inputArguments() # TODO: create a function, for it 

# m2, b relation (m2+1 , b-1 )
if euclidDistDifference(m2 + 1, b - 1) > 2 #?  #TODO: fix orphaned code  
    conquer(collect(m2+1:b-1), kernel) #: return 

elseif isUnitDistanceReached(m2 + 1, b - 1) == true # , kernel) == true #1  # euclidDistDifference(m2 + 1, b - 1) == 1

    #v = collect(m2:b)
    #_view = view(v, firstindex(v):lastindex(v))
    if m2 == b - 1 || m2 + 1 == b # (instead of 4 points,) [we have unique 2 points]

        # the difference between m2 & m2+ 1 is 1 -> docompare() is the best compare function 
        _view = collect(m2:m2+1) # |> 
        _view -> view(_view, firstindex(_view):lastindex(_view))
        res = doCompare(m2, m2 + 1, _view)

        #check return 
        if res !== nothing
            a, b, contentSwapped = res
            return a, b, contentSwapped
        end
    else # if there are 4 points 

        _view = collect(m2:b) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        res = compareQuartet(m2, m2 + 1, b - 1, b, _view) # <------------------ indexed_iterate(I::Nothing, i::Int64)
        if res !== nothing
            m2, m2 + 1, b - 1, b = res
            return m2, m2 + 1, b - 1, b
        end
    end
    # the difference between m2 & m2+ 1 is 1 -> docompare() is the best compare function 
    # _view = collect(m2:m2+1) |> _view -> view(_view, firstindex(_view):lastindex(_view))

    # m2 == b - 1 && m2 + 1 == b ? doCompare(m2, m2 + 1, _view1) : compareQuartet(m2, m2 + 1, b - 1, b, _view)
    #infer information, locations are equal : a = m2+1 , b = b-1

elseif isEndReached(1, 1) #euclidDistDifference(m2 + 1, b - 1) == 0 # scalar 
#  return true #isEndReached(m2, b)
else
    throws(error(msg))
end
#end

# using isEndReached, at the end 
if euclidDistDifference(a, b) == 1 #(m2, b) == true # compilese 
else
    return false
end

isEndReached(1, 1)

isUnitDistanceReached(1, 2)
isUnitDistanceReached(1, 1)

#----

# CompareSort(1, 3, [1, 2, 3]) = # returns answer (with error ) # TODO: fix )last 

#-----