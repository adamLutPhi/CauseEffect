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
# Novelty: Build lowerBound seperate function 'kernelFunction' takes lowerBound custom function i.e. middle, lowerBound,upperBound, & arr
## [control the customFunction , Bounds, & original arr
### Update: oldSchoolSwap (added condition) [assuming do compare [function above ]]

#=
# Hierarchy of functions, sort():
1. oldSchoolSwap: compares 2 numbers  [checked]
2. doCompare : compares 2 numbers in an object
3. compareTriad , compareQuartet : compares lowerBound set of structures 3-points, 4-points accordingly
4. compareBounds : calls below functions, based on the nature of lowerBound given input "points or intervals"
5. newView : depreciate
6. objBounds(arr)
7. objBounds(_view, arr) #<------------ # some arr has _view
# subView(lowerBound,upperBound,_view) #some _view has subView

=#
### TODO: ensure to convert functions, above, into Event-driven functions
# TODO:convert (from old to the new thinking) [307] [Critical]

### Note: the current call hierarchy suggests:
# the Domino Effect
## the correctness of lowerBound (of) One function may lead to the correctness of the one above
#=However, any Faultiness in one (below) , may would be reflected in the one above it [certainly]
(Assuming: potential scenarios are provided )
=#
#Start from the top, downwards


### Possible issue: potential error in the lower functions:
#### Completed: boundComparisonCondition
#### Completed: doCompare()
#### Completed: depreciate goleft & goright
#### completed: compareTriad, compareQuartet  #[correcting ]
### Update: replace `swapContent` insteadof `doCompare` [erroneous]
### Update: replace expression: `Throw(error(::String))` with raise(exception(::String))
### count number of function calls
### extra: function frequency

### the thing : there's no direct relationship with index
### solution: look for: lowerBound, upperBound (i.e. look for the higher order function that is calling them)

#=

Use only lowerBound of the generic `_stack` , then you pop the next arbitrary interval,
and redo the same thing: call the  kernel function `middle`, partition & Sort

# Correct-Form of view
view(v, firstindex(v[1]):lastindex(v[length(v)]))

#TODO:check all views

Update: euclidDist #(is debugged?)
# Check all euclidDist values
# Lesson learned :always check: length(_view)  === Nothing # return -1 instead [first-thing]

=#
#---
#another whole idea : discard left, right lingo , keep it cause-effect
#starting range is lowerBound cause of potential 2 more effects ( unless length = 1 , )

#Idea(9): gcd vs lcm
#lcm(9) #9
#gcd(9) #9

#--------
#TODO: compareIntervals, recursively

export lineLengthAcceptable, subView

#from unUsed2: import writeError
include("unUsed2.jl") # : writeError #<---
# import unUsed2: writeError

import Base: @propagate_inbounds, @inline
UnexpectedError = "Unexpected Error"
global msg = "ERROR: Please  try again with different input parameters"


"""
Gets the firstIndex & the lastIndex of
"""
function lineLengthAcceptable( a :: Int64 ,b :: Int64 ,_length :: Float32 ; exceptionParameter :: String = UnexpectedError)

try
    _flagIsAcceptable = false
    if a <= _length && b <= _length && a >= 0 && b >= 0
        _flagIsAcceptable =  true

    elseif a > _length  || b > _length || a<0 || b < 0
        # return _flagIsAcceptable # do nothing
    else
         raise(exception(exceptionParameter)) #throw(error("Unexpected Error occured"))
    end

    _flagIsAcceptable

    catch exceptionParameter
     writeError(msg, exceptionParameter) #@error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace())
    end
end


function processReturns( _firstIndex :: Int64 ,  _lastIndex :: Int64 ,  _firstValue :: Float32, _lastValue :: Float32 ; exceptionParameter = UnexpectedError)

    try
        #set return value
        _return = 0, 0, 0.0, 0.0

        #if scalar
        if _firstIndex == _lastIndex #&& _firstValue == _lastValue  # mind the: values could be equal

        # the same 1 answer (use one of them only )
        #but more likely: it's highly possible to return multiple values
            _return =  1 , _firstIndex,_firstValue # i.e. (numOcurrences, valueOfInterst, firstIndex):  (3, 3) -> 2, 3  ( 7 , 7 ) -> 2, 7 , 1

        # if there are `2` (or more) # then indicies are identical
        elseif _firstIndex != _lastIndex #&& _firstValue != _lastValue # index used: must be unique
            _return =  2, _firstIndex,  _firstValue,  _lastIndex,  _lastValue

        _return
        else
            raise(exception(exceptionParameter))
        end
    catch exceptionParameter
        writeError(msg, exceptionParameter) #@error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace())
    end
end


#TODO: check output :
""" checks the array `arr` for a content , returns the first & the last """
#ERROR: LoadError: MethodError: no method matching elementAt(::Vector{Int64}, ::Int64)
function elementAt(arr, xContent  ; exceptionParameter = UnexpectedError)

try
    #0. Init : get `newXIndex` occurences,  get last index
    newXIndex = findall((x -> x == xContent), arr) # it could be array (if has multiple occurences)
    _lastIndex = last(newXIndex)

    #1. Check Next Index
    _firstIndex = newXIndex[1]

    #2. Get first value, from `_firstIndex`
    _firstValue =  arr[_firstIndex] # gets the first occurence of newXIndex in array `arr`

    #3. get last value, from `_lastIndex`
    _lastValue = arr[newXIndex[ _lastIndex] ] # gets the last occurence of newXIndex in array `arr`

    #4. Return:  lastIndex = NumMatches (last)
    _firstIndex,  _firstValue,_lastIndex, _lastValue # processing done after it

    #5. Otherwise: catch excpetions using `exceptionParameter`
    catch exceptionParameter
        writeError(msg , exceptionParameter)
    end
end


#Demo:
ar1=  [1,1,1,2] # consider indicies
_firstIndex,  _firstValue, _lastIndex,   _lastValue = elementAt(ar1,1)

println("_firstIndex,  _lastIndex,  _firstValue, _lastValue = ",_firstIndex,  _lastIndex,  _firstValue, _lastValue )

v = collect(1:3)
arr = collect(1:9)

#---------------------------------------------------
"""
Law Properties:

1. v must be contained in arr:
an extreme case would be that v === arr
equal to arr, then bounds should be equal

On index remapping [depreciated idea]:
the last index in v  might not be the last in arr (most of the time)

v[1] , v[-1 ] # dirty python
1: v[1] = 1
-1:v[-1] = 3

Plug those in the Original arr :
#stick to the plan: retrieve only the bounds
# arr[v[1] : v[-1 ] ]

arr[v[1] ] = arr[1] # Ok
arr[ last(v)] =  #v[lastIndex(v)]]
the thing: unsure whether
last(v) ===  #arr[lastIndex(v)]]
for that reason use notation:

arr[ v[lastIndex(v)]] ]
"""
#---------------------------------------


#=function handleReturnedvalue(_firstIndex,  _lastIndex,  _firstValue, _lastValue;n)


    if n == 1
        #if Scalar
        #return only one of these value
        #return [_firstIndex, _firstValue] # size 2
        return _firstIndex, _firstValue # size 2
    end
    #elseif n == 2
        # bit complicated ( than anticipated)
        #(at most ) return all information gathered
        # return [_firstIndex,  _lastIndex,  _firstValue, _lastValue]
        return _firstIndex, _firstValue,_lastIndex, _lastValue # size 2 #suggest: (_firstIndex, _firstValue), (_lastIndex, _lastValue)

    #end
end
=#

nullMsg = "null or empty input object" #exception e;

"""returns 2 collections: 1st is index(ies) , 2nd is value(s)

``output:``
index : index , single if scalar , or 2 if it's of 2 (or more ) returns
value : value , single if scalar, or 2 if it's 2 (or more ) returns

"""

function listHandling(_list ;  exceptionParameter :: String  = UnexpectedError )

try
    #0.Init:
    #get list's first index (whatever that might be)
    _firstIdx = first(_lst)

    if _list == is #isa  nothing #isa Nothing  #=== nothing  #=== Nothing #nothing #Nothing  #isa Nothing
        println("List is Nothing")
        return nothing, nothing
    elseif  n < length(_list)

        #check for special cases
        # if list's Number `n` equals 1
        if n == 1
            _list[_firstIdx], _list[_firstIdx]
        elseif n == 2 #n == 2 # scalar
            return _list[_firstIdx], _list[_firstIdx + 1 ]
         end
         #if n > 2:
        _list[_firstIdx], _list[n]

        #Otherwise, raise an exceptionParameter`
        else   #throw(e) # error("null or empty input object") )
            raise(exception(exceptionParameter))

    end

    #Return

    catch exceptionParameter
        writeError( msg , exceptionParameter )
    end

end


# handling a null list
_list = nothing #<------
if _list == nothing
println(_list == nothing)
else
    listHandling(_list)
end

#startingIndex = 1
#lastIndex(arr) = length(arr)- 1 #or it 2 was it? # last index
## objBounds of a view , of an array (or view)

function objBounds( arr ) # compiles # rechecked

    firstXIndex = firstindex(arr)  #newXIndex)

    firstXValue = arr[firstXIndex]

    lastXIndex = lastindex(arr) #newXIndex)
    lastXValue =  arr[lastXIndex]

    return firstXIndex, firstXValue, lastXIndex, lastXValue # classic
end


""" returns the object's bounds
``input:``
_view : a (sub)view of an array (or _view)
arr: an original array (or _view)
``output:``
return index1, value1, index2, value2

"""
function objBounds(_view, arr) # requires elementAt

    # 1 .check if _view is bounder by arr
    if firstindex(_view ) >= firstindex(arr) && lastindex(_view) <= lastindex(arr)

        #newXIndex = findall((x -> x == _XContent), arr)

        #2. get first & last contet from _view object

        _first = first(_view) #XIndex = firstindex(_view)
        _last = last(_view)

        #firstxIndex = _view[firstXIndex]
        #lastxIndex = lastindex(_view)

        _firstIndex1,  _firstValue1, _lastIndex1, _lastValue1 = elementAt(arr, _first)

        #n,_firstIndex,  _lastIndex,  _firstValue, _lastValue = processReturns(_firstIndex,  _lastIndex,  _firstValue, _lastValue)
        # return would be 2 vals (may require additional unpacking, but it's good to go)
        # index1, value1  = handleReturnedvalue(n,_firstIndex,  _lastIndex,  _firstValue, _lastValue)

        _firstIndex2,  _firstValue2, _lastIndex2,   _lastValue2 = elementAt(arr, _last)

        #index2, value2  = handleReturnedvalue(m,_firstIndex,  _lastIndex,  _firstValue, _lastValue)
        # return index1, value1, index2, value2

        #TODO: check whether this is a better representation [ _firstIndex1, _firstValue1] , [_firstIndex2, _firstValue2]
        return [_firstIndex1, _firstValue1], #, [_lastIndex1, _lastValue1], # wawrning : last index always = 1
        [_firstIndex2, _firstValue2]

        # Now this tuple has 2 items (if scalar) or 4 (if 2 returns, or more )
        #firstXIndex = findall((x -> x == firstXValue), arr) #returns list of all occurences
        #firstXIndex = firstXIndex[startingIndex]
        """
        lastXIndex =  findall((x -> x == lastXindex), arr) #returns list of all occurences
        lastXIndex = lastXIndex[ length(lastXIndex)-1] # get me the last one (subtracting the starting 1 )  # lastIndex(newXIndex)
        lastXValue =   #arr[lastXIndex]
        """
    end
end


#---------
#Experimental
function objBounds2(_view, arr)

    # 1 .check if _view is bounder by arr
        if firstindex(_view ) >= firstindex(arr) && lastindex(_view) <= lastindex(arr)

            #newXIndex = findall((x -> x == _XContent), arr)

            #2. get first & last contet from _view object

            _first = first(_view) #XIndex = firstindex(_view)
            _last = last(_view)

            #firstxIndex = _view[firstXIndex]
            #lastxIndex = lastindex(_view)
            #_firstIndex1,  _firstValue1,  _lastIndex2, _lastValue2 = elementAt(arr, _first) #TODO: RenameAll #  (convert: (_lastIndex2, _firstValue) , (_lastValue2,_lastValue)

           _firstIndex,  _lastIndex,  _firstValue, _lastValue = elementAt(arr, _first)

            #n,_firstIndex,  _lastIndex,  _firstValue, _lastValue = processReturns(_firstIndex,  _lastIndex,  _firstValue, _lastValue)
            # Return would be 2 values (may require additional unpacking, (but that's good for now))
            # index1, value1  = handleReturnedvalue(n,_firstIndex,  _lastIndex,  _firstValue, _lastValue) # TODO:convert (from old to new thinking)

            _firstIndex2,  _firstValue2, _lastIndex2,   _lastValue2 = elementAt(arr, _last)

            #index2, value2  = handleReturnedvalue(m,_firstIndex1,  _lastIndex,  _firstValue, _lastValue)
            #drop first & last
            # return index1, value1, index2, value2

            return [_firstIndex1, _firstValue1], [_lastIndex1, _lastValue1],[_firstIndex2, _firstValue2], [_lastIndex2, _lastValue2]

            #, [_lastIndex1, _lastValue1], # warning : last index always = 1
            #[_firstIndex2, _firstValue2]
            #, [_lastIndex2, _lastValue2]

            # now this tuple has 2 items (if scalar) or 4 (if 2 returns, or more )


            #firstXIndex = findall((x -> x == firstXValue), arr) #returns list of all occurences
            #firstXIndex = firstXIndex[startingIndex]
            """
            lastXIndex =  findall((x -> x == lastXindex), arr) #returns list of all occurences
            lastXIndex = lastXIndex[ length(lastXIndex)-1] # get me the last one (subtracting the starting 1 )  # lastIndex(newXIndex)
            lastXValue =   #arr[lastXIndex]
            """
        end
    end

# call bounds on small _view
# since view is bounder by ass , its safe to use its indecies bounds on arr
v = collect(1:10)
v1 = collect(3:7)
_subView = view(v1,firstindex(v1):lastindex(v1))
_view = view(v,firstindex(v):lastindex(v))

firstXIndex, firstXValue, lastXIndex, lastXValue = objBounds(_view) #_view)

""" # uncommentMe #later
println("objects: firstIndex ",firstXIndex, " firstValue = ", firstXValue," lastIndex = ", lastXIndex, " lastValue = ", lastXValue)
#-------------
firstindexValue1, lastindexValue1, firstindexValue2, lastindexValue2 = objBounds(_subView, _view)

println("objects: first[Index1, Value1] ",firstindexValue1," Last[Index1, Value1]  = ", lastindexValue1, " first[IndexValue2] =", firstindexValue2, " last[indexValue2] = ", lastindexValue2 )
"""
indexValue1, indexValue2 = objBounds(v1,v) #find v1's bounds, in terms of v (or _view's bounds in terms of arr)


#-------------------------------------------

# findall Demo
#find (first) index of firstXindex on arr

#find (last) index of lastXindex on arr

""" checks if an object is an Array """
function isArray(x ; exceptionParameter :: String = UnexpectedError)

    try
        _isArray = true
        if typeof(x) != Array
            # isArray  already is false
            _isArray = false
        #theType = copy(typeof(x))
        elseif typeof(x) == Array# here: unsure of ar1 content # {Int64,1} # debugged
            #_isArray =  true # this line
            #presumes firstXvalue is of type Array
        #otherwise: if code is erroneous
        else
            #raise an exception
            raise(exception(exceptionParameter))   #firxtXValue = firxtXValue
        end
        _isArray
    catch exceptionParameter
        writeError( msg , exceptionParameter )
    end
end


firstXValue = findall((x -> x == firstXValue), ar1)#[1] #debugged
if typeof(firstXValue) == Array# here: unsure of ar1 content # {Int64,1} # debugged
    firxtXValue = firstXvalue[1] # this line presumes firstXvalue is of type Array
#else
    #firxtXValue = firxtXValue
end


newXIndex = findall((x -> x == lastXValue), ar1) # ask self is return an array? (most likely, NO)
if isArray(newXIndex) == true
    lastXValue  = newXIndex[length(newXIndex) -1 ] # error here
end


firstXIndex = firstindex(newXIndex)
newXIndex = lastindex(newXIndex)

#end
# v = collect(1:3) #3; intervalLength(v[1],v[2]) # 2
#--------------------------
euclidDist(lowerBound::Int64, upperBound::Int64) = 0 <= lowerBound && 0 <= upperBound ? abs(max(lowerBound, upperBound) - min(lowerBound, upperBound)) + 1 : 0 #+ 1 : 0 #-1 #both lowerBound,upperBound > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset
#-(lowerBound::Int64, upperBound::Int64) = 0 <= lowerBound && 0 <= upperBound ? abs(max(lowerBound, upperBound) - min(lowerBound, upperBound)) : 0 #+ 1 : 0 #-1 #both lowerBound,upperBound > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset

-(lowerBound::Int64, upperBound::Int64) = 0 < lowerBound && 0 < upperBound ? abs(max(lowerBound, upperBound) - min(lowerBound, upperBound)) : 0 #+ 1 : 0 #-1 #both lowerBound,upperBound > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset

#euclidDist(3, 1)
# intervalLength2(v[1],v[2]) # 3

euclidDist(3, 1) #+ 1 # 1 2 3  #valid value
#euclidDist(3, 1)


@inline function intervalLength(lowerBound :: Int64 , upperBound :: Int64 )

    lowerBound + upperBound - 1
end


"""Another variation of intervalLength (): this intervalLength is vaid , under context of sum """
@inline  function intervalLength2(lowerBound :: Int64, upperBound :: Int64 )

    lowerBound + upperBound  #- 1
end


# Experimental
@inline  function intervalLength3(lowerBound :: Int64, upperBound :: Int64 ; _firstIndex = 1) #

    #lowerBound + upperBound  + 1
    # length

    # Yin
    +(lowerBound , upperBound)

end

intervalLength3(0,1)
# euclidDist(1,3)

# -(1,3) + 1

# see also: antonym function  euclidDist()
#euclidDist(1,3)

#py's 0th index  intervalLength[0, 1]
+(0,1) = 1


@inline function intervalLength4(lowerBound :: Int64, upperBound :: Int64 ; _firstIndex = 1)

    # length + 1
    #lowerBound + upperBound  + 2
    lowerBound + upperBound  + _firstIndex  # + 1
    +(lowerBound , upperBound) + _firstIndex
end

intervalLength4(0,1) # 0 + 1

#intervalLength4(3,1)
    #    length + 1  - 1  == length

# Yang, Yin
+(0,1) = 1 # Yang
+(0,1) = 1 + 1
-(0,1) = 1 - 1 # Yin


# isEven
function isEven3(lowerBound :: Int64, upperBound :: Int64 ; exceptionParameter :: String = UnexpectedError , _firstIndex =  1 ) # review#1 corrected: adds offset adjustment #review#2: ; offset = 1 #offset is Independent

    try
        number = -1

        # check vales given  are valid
        if lowerBound > 0 && upperBound > 0
            number = upperBound + lowerBound  # calculates Interval length  #  offset - 1
            number = intervalLength(lowerBound, upperBound) _firstIndex _firstIndex
            intervalLength4(lowerBound, upperBound )  -_firstIndex
            #length + 1 - firstIndex[ 1] - _firstIndex
            intervalLength4(lowerBound, upperBound ) - _firstIndex
            # length + 1 - 1 == length

            number > 0 && number % 2 == 0 ? true : false   #always exists (if conditions apply)
        else
            raise(exception(exceptionParameter))  #throw(error("Unexpected value error"))
        end
    end
end


function isEven(lowerBound :: Int64, upperBound :: Int64 ; exceptionParameter :: String = UnexpectedError , _firstIndex =  1 ) # review#1 corrected: adds offset adjustment #review#2: ; offset = 1 #offset is Independent

    try
        number = -1

        # check vales given  are valid
        if lowerBound > 0 && upperBound > 0
            number = upperBound + lowerBound  # calculates Interval length  #  offset - 1
            number = intervalLength(lowerBound, upperBound) +  _firstIndex
            number > 0 && number % 2 == 0 ? true : false   #always exists (if conditions apply)

        else
            raise(exception(exceptionParameter))  #throw(error("Unexpected value error"))
        end

    number
    catch exceptionParameter
        writeError( msg, exceptionParameter)
        # @error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace) #passing function pointer to catch_backtrace
    end
end


# isEven

"""checks the Evenity of lowerBound numuber , via modular arithmetic """
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
            raise(exception(nonPositiveError)) # sumInterval(1,2) # 3 # throw(error("not positive error"))
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
@inline sumInterval(lowerBound::Int64, upperBound::Int64) = lowerBound > 0 && upperBound > 0 ? abs(upperBound) + abs(lowerBound) : 0


@inline function getIsWhole(lowerBound :: Int64, upperBound :: Int64)

    return isWhole isEven(lowerBound, upperBound) # sumInterval(lowerBound,upperBound) % 2 == 0
end

function getIsWhole(arr::Array{Int64,1})

    isWhole = firstindex(arr) + lastindex(arr) % 2 == 0
    return isWhole
end

#-----------
#DEMO
#1. get isWhole
isWhole = getIsWhole(1, 3)
# ar1 = [10,5,3]; getIsWhole(ar1) # false

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
            raise(exception(UnexpectedError)) #throw(error("Unexpected Error Occured"))
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

intervalLength(1, 3) #sumInterval(1,3) # 3
#intervalLength2(1,3) #Wrong, remove it,Please

intervalLength(1, 10)

1:2
(1:2)[1]
(1:2)[length(1:2)]

(1:2)[1]:(1:2)[length(1:2)] #2
collect(1:2) # Vector{Int64} [1 2]T


euclidDist(1, 3) #3  #euclidDist(1,3) =?=  -(1,3) + 1
-(1, 3) # the context is: to subtract #i.e. TODO: to be replaced by -(1,3)

""" get a subView from any view, provided a `lowerBound` & an `upperBound` """
function subView(lowerBound,upperBound,_view)
    collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
end


v = collect(1:9)
#v = view(v, firstindex(v):lastindex(v))
res = subView(3,5,v) #  view([3,4,5])
print("subView(3,5) = ",res)

_view = collect(3:5)
_view = view(_view, firstindex(_view):lastindex(_view))
res = subView(1,2, _view )


euclidDist(1, 3) #3
-(1, 3) # the context is to subtract #i.e. TODO: to be replaced by -(1,3)

""" get a `SubArray` from any view, provided a `lowerBound` & an `upperBound` with a view itself"""
function subView(lowerBound,upperBound,_view) #ok
    collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
end


#res = subView(3,5) #  view([3,4,5])
#Demo
# Create a View: from 1 to 9
v = collect(1:9);
v = view(v,firstindex(v): lastindex(v) ) #SubArray
print( typeof(v) ) # SubArray{Int64, 1, Vector{Int64}, Tuple{UnitRange{Int64}}, true}

# Create a subView: from 3 to 5
#  1 2 3 4 5 6 7 8 9
#     [3 4 5 ]
#subView(3,5)
#res = subView(v, 3,5) view([3,4,5]) #TODO: check
res = subView( 3,5, v)
print( res) # view(::Vector{Int64}, 1:3) with eltype Int64:
print( typeof(res ) )#SubArray{Int64, 1, Vector{Int64}, Tuple{UnitRange{Int64}}, true}

# view `SubArray`: it is possible to subview, with any valid index range, using starting & ending indicies
# subview( startIndex, endIndex, View)
print( subView(1,2, res) )  # [1, 2]
print( subView(1,1, res) )  # [1] valid subView (gets a subview, from index 1 to 1 )
print( typeof( subView(1,1, res) )) # SubArray{Int64, 1, Vector{Int64}, Tuple{UnitRange{Int64}}, true}

print( subView(1,2, res) !=  subView(1,1, res) )
#End #Warning: view is of type SubArray, not View (anymore)

#-----------
# doCompare

## doCompare: compare two indicies, on lowerBound vector Array
#index, value space  [vital]
#requires: oldSchoolSwap
## BoundsError: attempt to access 2-element view(::Vector{Int64}, 1:2) with eltype Int64 at index [3]

@inline function doCompare(lowerBound, upperBound, arr ; exceptionParameter = UnexpectedError )  #,  conditionSame = ) #works # arr ::Array{Int64,1}

        try
            #[1...8] length = 8+1 -1 = 8

            _length = copy(length(arr))
            contentSwapped = false  #nothing
            if lowerBound < _length && upperBound < _length && lowerBound >= 0 && upperBound >= 0 # && upperBound >= m2 # if lowerBound <= _length && upperBound <= _length

                #0. Init
                aContent = arr[lowerBound] #<------
                bContent = arr[upperBound]
                contentSwapped = false #true  #  nothing
                #= try
                # Base.@propagate_inbounds =#

                #1. Check condition
                if aContent <= bContent
                    pass

                elseif aContent > bContent # arr[lowerBound] > arr[upperBound] n# <--- critial decision
                    #Base.@propagate_inbounds
                    lowerBound, upperBound, contentSwapped = swapContent(arr[lowerBound] , arr[upperBound] , arr) #oldSchoolSwap(lowerBound, upperBound, arr) #swapContent(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap

                    #    contentSwapped = true   #arr[lowerBound], arr[upperBound]
                    println("at index lowerBound = ", lowerBound, " upperBound = ", upperBound, ", aContent = ", arr[lowerBound], " , bContent = ", arr[upperBound])
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

## doCompare: compare two indicies, on lowerBound view

#=
#index, value space  [vital]
@inline function doCompare(lowerBound, upperBound, _view::SubArray) # 9-8
    _length = copy(length(_view)) #ok
    if lowerBound == upperBound # scalar
        # v = collect(lowerBound:upperBound)
        # _view = view(v, firstindex(v):lastindex(v))

        return lowerBound, lowerBound, nothing
    elseif lowerBound < _length && upperBound < _length && lowerBound >= 0 && upperBound >= 0
        # aContent = _view[lowerBound] #view(_view, lowerBound) #arr[lowerBound]
        #   bContent = _view[upperBound] #view(_view, upperBound) #arr[upperBound]

        contentSwapped = nothing

        #  if aContent > bContent # arr[lowerBound] > arr[upperBound]
        v = collect(lowerBound:upperBound) # collect(lowerBound, upperBound)# collect(lowerBound, upperBound + 1) # # content
        _view = view(v, firstindex(v):lastindex(v)) # correct  # indecies
        println("lowerBound = ", lowerBound, " upperBound = ", upperBound)

        println("Index = findall((x -> x == _view[lowerBound]), _view))(lowerBound) = ", findall((x -> x == _view[lowerBound]), _view)(lowerBound))
        println("Index = firstindex(findall((x -> x == _view[upperBound]), _view))(upperBound) = ", firstindex(findall((x -> x == _view[upperBound]), _view))(upperBound))


        lowerBound, upperBound, contentSwapped = swapContent(_view[lowerBound], _view[upperBound], _view)  #oldSchoolSwap(firstindex(findall((x -> x == _view[lowerBound]), _view))(lowerBound), firstindex(findall((x -> x == _view[upperBound]), _view))(upperBound), _view) #<--

        # swapContent(_view[lowerBound], _view[upperBound], _view)  #oldSchoolSwap(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap

        #lowerBound, upperBound = oldSchoolSwap(lowerBound, upperBound, _view)
        # contentSwapped = true   #arr[lowerBound], arr[upperBound]

        #  elseif aContent > bContent
        #do nothing
        #  contentSwapped = false
        #  end
        return lowerBound, upperBound, contentSwapped

    elseif isUnitDistanceReached(lowerBound, upperBound) == true # 3, 4 ,d = 1
        _view = collect(lowerBound:upperBound)
        _view = view(_view, firstindex(_view):lastindex(_view))
        lowerBound, upperBound, contentSwapped = swapContent(_view[lowerBound], _view[upperBound], _view) # # swapContent(_view[lowerBound], _view[upperBound], _view)  #oldSchoolSwap(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap #<-
        return lowerBound, upperBound, contentSwapped
        # elseif lowerBound == lowerBound == _length-1 || upperBound == _length-1
        #     return isUnitDistanceReached(lowerBound,upperBound) #1, 2)
    elseif lowerBound == _length || upperBound == _length # last step  #scalar
        # isUnitDistanceReached(lowerBound,upperBound)
        # return getLastElement2(lowerBound, upperBound)
        # return end
        # return isUnitDistanceReached(lowerBound,upperBound) #1, 2)
        return lowerBound,upperBound, nothing  #isEndReached(lowerBound, upperBound) #1, 1)

    end
end
=#

#-------
#TODO: finish the recursive checkNextView(_view)
function checkNextView(_view) # Note : _view is Nullable

    if length(_view) === Nothing # does not function properly
        return -1
        #but lowerBound view can be at least 3(makes senselength  3->1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) >= 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed))
        lowerBound = firstindex(_view)
        upperBound = lastindex(_view)

        println("firstindex(x)+1:lastindex(x)-1", firstindex(x)+1:lastindex(x)-1)
        x = collect(lowerBound:upperBound)
        return view(x, firstindex(x)+1:lastindex(x)-1)
    end
end

 """ specific: for lowerBound given bounds lowerBound, upperBound, calculates the next view """
function checkNextView(_view, lowerBound, upperBound;_first=1)
    _length = length(_view) # no method matching length(::var"#5#6")#TODO: add subView
    if _length === Nothing
        return -1

     #but lowerBound view can be at least 3 (without 2 bounds: length  3-2 = 1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif _length == 1 #valid
        return _length
    elseif _length >= 2 * 2 - _first # 4 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed))
        println("firstindex(x)+1:lastindex(x)-1", firstindex(x)+1:lastindex(x)-1)
        x = collect(lowerBound:upperBound)

        return view(x, firstindex(x)+1:lastindex(x)-1)
    end
end

#checkNextView()

function handleNegativeValue(currentValue)

    if currentValue < 0
        currentValue = 0
    end
    currentValue
end

lowerBound = 1
upperBound = 9

#make  view from points, only
v = collect(lowerBound:upperBound)

# Experienced Note: in `divide-conquer`: while dividing 1:9
# range becomes:
subLoBound = 3;
subUpBound = 5;
_rangeSub = collect(3:5)

_rangeNew = subView(firstindex(_view),lastindex(_view), _view)
_rangeNew = collect(3:5) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #input

#_view = collect(lowerBound:upperBound) |> lowerBound = lowerBound + 1;upperBound = upperBound + 1 |> lowerBound + 1 <= upperBound - 1 ? _view -> view(x, firstindex(lowerBound + 1):lastindex(upperBound - 1)) : return  #Note: collect(lowerBound:upperBound) is rendered unused

_view = subView(firstindex( _view)+1, lastindex(_view)-1, _view)

#_view = _view = collect(3:5) |> _view -> view(_view, firstindex( _view)+1:lastindex(_view)-1):return  #firstindex(_view)+1:lastindex(_view)-1) : return # # (fills) switches to the Next available _view (from Nothing to _view object)
#_view = lowerBound = lowerBound + 1 && upperBound =  upperBound + 1 <= upperBound - 1 ? _view -> view(_view, firstindex(_view)+1:lastindex(_view) -1) : return  #firstindex(_view)+1:lastindex(_view)-1) : return # # (fills) switches to the Next available _view (from Nothing to _view object)

println(_view)
println(typeof(_view))
_view = collect(3:5) |> _view -> view(_view, firstindex(_view):lastindex(_view))

#_Interval = collect(3: 5) # subView( interest):  1: 3
#euclidDist( _Interval[1], _Interval[2] ) # 3 euclidDist: form is like:  -(a,b) +1
#-( _Interval[2], _Interval[1]) # 2
# resolved:# _rangeNew |> _view -> view( _view, firstindex(_view):lastindex(_view))

_view = collect(3:5) |> _view -> view(_view, firstindex(_view):lastindex(_view)) # subView( interst ) : 1:3

#v = collect(1:9)
# res = view(v,firstindex(v): lastindex(v))
#_view = length(_view)> 2 ?_view -> view(_view,firstindex(_view),lastindex(_view)) : return

#last:  # <----
if length(res) > 2 #ok #TODO:Q. how about length(res) <2 ?
    _view -> view(_view, firstindex(_view):lastindex(_view))
    return _view
else
    return  #todo: check <---
end

# DEMO

rangeOrginal = 1:9
_view = view(v, rangeOrginal) #makes a view
_rangeNext = 3:7
_subview = subView(_rangeNext[1], _rangeNext[2], _view)

v = collect(3:7)
_view = subView(3 , 7 ,v) #TODO:  view(v, firstindex(v): length(v)) #v, firstindex(v):length(v))

#currentVal = checkCurrentValue!(_view, currentVal)
#currentVal = checkCurrentValue!(_view, currentVal) # currentValue = 1 # correct # <------

#Critical Point#2 : ##WARNING: IntervalLength #Tampers with the sum (Q.how?)

totalLength = intervalLength(1, 3)
# copy(intervalLength(lowerBound, upperBound)) #lowerBound+upperBound -1 (or +1)

sum = totalLength # + 1 #  this is for euclidDist # (removes 1 )  #Done

isWhole = isEven(sum)
currentValue = 1
getSubtractedValue(isWhole) # (subtract length(midddle): 1 or 2)

currentValue -= getSubtractedValue(isWhole)
# handleCurrentValue(currentValue) #TODO: re-check now

length([1, 2, 3]) == intervalLength(1, 3) # == 3 #true
isEven(length([1, 2, 3]))
#isEven(length([1, 2, 3]) + 1) #Rule: in isEven: always add 1 to the total length

println( intervalLength(0,1) + euclidDist(0,1) )

# Sort & Swap

## swapContent on lowerBound vector array
function swapContent(aContent, bContent, arr)# Debugged #; offset=1) #new! # lowerBound,upperBound,indicies in arr

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


#Demo:
ar1 =  [3,2,1]

a,b,isSwapped = swapContent(3,2,ar1)
print("a = ",a, " b = ", b)
print("ar1 = ",ar1)

## swapContent on lowerBound view


function swapContent(aContent, bContent, _view::SubArray)#; offset=1) #new! # lowerBound,upperBound,indicies in arr

    # Hint: what if the there are multiple values ( of the same )
    contentSwapped = nothing

    #lowerBound = findall(x -> x == aContent, arr)
    #lowerBound = lowerBound[offset]
    #upperBound = findall(x -> x == bContent, arr)
    #upperBound = copy(upperBound[length(upperBound)])   # -offset])

    lowerBound = firstindex(_view)
    upperBound = lastindex(_view)

    if aContent > bContent && lowerBound < upperBound ##
        _view[lowerBound], _view[upperBound] = _view[upperBound], _view[lowerBound] #swap
        contentSwapped = true
        #   _first = arr[lowerBound]
        #  _last = arr[upperBound]
        println(_view[lowerBound], _view[upperBound], contentSwapped)

    elseif aContent <= bContent
        # arr[lowerBound], arr[upperBound] = arr[lowerBound], arr[upperBound] # nothing
        contentSwapped = false
        println(_view[lowerBound], _view[upperBound], contentSwapped)
    end

    return lowerBound, upperBound, contentSwapped #returns index (more practical)
end

# oldSchoolSwap
## oldSchoolSwap on lowerBound vector array

"""
Swaps two items in lowerBound vector


Indices, has to be correctly sorted, as expected
Additional condition : first input must be lower tham 2nd one

Note:
if the first input argument (for the lower bound lowerBound) is larger than upperBound
then swapping indicies has to happen, to ensure the process consistency of this function


"""
#depreciate
#= unCommentMe
function oldSchoolSwap(lowerBound, upperBound, arr::Array{Int64,1}) #lowerBound,upperBound,indicies in arr

    #check left-most bound is lower than right most bound, if not, replace indicies
    if lowerBound > upperBound
        lowerBound, upperBound = upperBound, lowerBound
    end
    contentSwapped = nothing

    aContent = arr[lowerBound]
    bContent = arr[upperBound]
    #_first = nothing
    #_last = nothing

    #comparing contents
    if aContent > bContent
        arr[lowerBound], arr[upperBound] = arr[upperBound], arr[lowerBound] #swap
        contentSwapped = true
        #   _first = arr[lowerBound]
        #  _last = arr[upperBound]
        println(arr[lowerBound], " ", arr[upperBound], contentSwapped)

    elseif aContent <= bContent
        # arr[lowerBound], arr[upperBound] = arr[lowerBound], arr[upperBound] # nothing
        contentSwapped = false
        println(arr[lowerBound], arr[upperBound], contentSwapped)
    end
    # content evaluation #review#1: maybe unnecessary here

    # _first = arr[lowerBound]
    # _last = arr[upperBound]
    return lowerBound, upperBound, contentSwapped  #  _first, _last  #lowerBound, upperBound
end
=#
## oldSchoolSwap on lowerBound View
"""
Swaps two items in lowerBound view

indices, has to be correctly sorted, as expected
Additional condition : first input must be lower tham 2nd one

Note:
if the first input argument (for the lower bound lowerBound) is larger than upperBound
then swapping indicies has to happen, to ensure the process consistency of this function

"""
#depreciate
# oldSchoolSwap on lowerBound view #non-practical (in arrays, or sub arrays )
#=
function oldSchoolSwap(lowerBound, upperBound, _view::SubArray) #lowerBound,upperBound,indicies in arr

    #check left-most bound is lower than right most bound, if not, replace indicies
    if lowerBound > upperBound
        #this is the reason of why it is Impractical: #cannot invert indicies (of arrays)
        lowerBound, _view[upperBound] = upperBound, lowerBound
        contentSwampped = true
    end
    contentSwapped = nothing
=#

#its view[aId] = lowerBound
    aContent = lowerBound #_view[lowerBound] #<----- Rational mid(index)= 8
    bContent = upperBound #_view[upperBound-1] # issue was here

    #_first = nothing
    #_last = nothing
    #comparing contents

    if aContent > bContent

        #_view[lowerBound], _view[upperBound] = _view[upperBound], _view[lowerBound] #swap
        aContent,bContent = bContent, aContent
        contentSwapped = true
        #   _first = arr[lowerBound]
        #  _last = arr[upperBound]
        println(aContent, " ", bContent,contentSwapped) #_view[upperBound], contentSwapped)

    elseif aContent <= bContent
        # arr[lowerBound], arr[upperBound] = arr[lowerBound], arr[upperBound] # nothing
        contentSwapped = false
        println(aContent, " ", bContent, " contentSwapped = ", contentSwapped)  #_view[upperBound], contentSwapped)

        #  elseif aContent == bContent
        #personal preference solution , the first one close to lower bound  is at first
        #lowerBound < upperBound always! but here, we are assuming the assumption was not ta
        #if lowerBound < upperBound
        #arr[lowerBound], arr[upperBound] = arr[lowerBound], arr[upperBound] #do nothing
        #     contentSwapped = false
        #     println(_view[lowerBound]," " ,_view[upperBound], contentSwapped)
        #= elseif lowerBound > upperBound #swap
            arr[lowerBound], arr[upperBound] = arr[upperBound], arr[lowerBound] #ture
            contentSwapped = true
            println(arr[lowerBound], arr[upperBound], contentSwapped)

        else #do nothing or
            raise(exception(UnexpectedError)) # throw(error("Unexpected Error ))
        end =#
    end

    # content evaluation #review#1: maybe unnecessary here
    # _first = arr[lowerBound]
    # _last = arr[upperBound]
    return lowerBound, upperBound, contentSwapped  #  _first, _last  #lowerBound, upperBound
end



println("_view = ", typeof(_view)) # SubArray{Int64, 1, Vector{Int64}, Tuple{UnitRange{Int64}}, true}\
v = collect(first(_view):last(_view))
println("v = ", v)
_view[lastindex(_view)] # <---
euclidDist(lowerBound, upperBound) #1
upperBound
euclidDist(lowerBound, upperBound)
v = collect(lowerBound:upperBound)
#remap
#return
view([1, 2, 3, 4, 5], 1:5)
view(v, firstindex(v):lastindex(v)) #Correct-Form # ==view(v, remap(lowerBound, upperBound))
# view(v, remap(lowerBound, upperBound)) #v[length(v)])
# _view = collect(lowerBound:upperBound) |> view(v, firstindex(v):lastindex(v))
_view = collect(lowerBound:upperBound) |> v -> view(v, firstindex(v):lastindex(v))
#end
-(1, 1)
-(lowerBound, upperBound)
lowerBound
upperBound
# (m2 + 1, upperBound - 1)

#---------
# Middle

## Middle of Two Points

@propagate_inbounds function middle(lowerBound::Int64, upperBound::Int64) # upperBound  + lowerBound -1  # Acceptable #review#2 ; offset = 1 #rule-found: offset only used in an array (at its start)

    try
        _sum = sumInterval(lowerBound, upperBound)  #    upperBound + lowerBound - 1  # distance between them  <---- Error
        println("lowerBound , upperBound =", lowerBound, " ", upperBound) # lowerBound , upperBound =1 9
        println("sum = ", _sum)
        isItEven = isEven(_sum) # even is lowerBound proxy for divisibility # TODO: surround by lowerBound copy()  #homeMade Heuristic  <------
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
            raise(exception(UnexpectedError)) #throw(error("Unexpected error occured")) #<-------
        end

    catch UnexpectedError #errors out
        @error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end
end

#-------
#doCompare
euclidDist(a,b) = -(a+b) + 1
-(a,b) = -(a+b) #+ 1

function isUnitDistanceReached(lowerBound, upperBound)

    if -(lowerBound, upperBound) <= 1  || -(lowerBound, upperBound) == 0 # -(lowerBound, upperBound) <= 1  || -(lowerBound, upperBound) == 0 #TODO: chage inside the function
        return true
    else
       # v = collect(lowerBound:upperBound)
       # _view = view(v, firstindex(v):lastindex(v))
        m1, m2, isWhole = middle(lowerBound, upperBound) #lowerBound - 1, lowerBound, upperBound, upperBound + 1, _view) #<-----sumInterval not defined
        v = collect(m1:m2) # collect(first(m1): last(m2) )
        # compareBounds
        lowerBound, upperBound, contentSwapped = swapContent(m1, m2, view(v,first(v):last(v)))  #doCompare(m1, m2, view(v,first(v):last(v)))  #v) # <-----
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end
end

function isUnitDistanceReached(lowerBound, upperBound,kernel)

    if -(lowerBound, upperBound) <= 1 || -(lowerBound, upperBound) == 0 #TODO: chage inside the function
        return true

    else
        # v = collect(lowerBound:upperBound)
        # subView(3,7,v) #todo:check # _view = view(v, firstindex(v):lastindex(v))
        m1, m2, _flag = kernel(lowerBound, upperBound) #lowerBound - 1, lowerBound, upperBound, upperBound + 1, _view) #<-----sumInterval not defined
        # lower = 4 , upper = 5
        v = collect(m1:m2)
        # compareBounds
        _view = view(v, firstindex(v):lastindex(v))
        lowerBound, upperBound, contentSwapped = swapContent(firstindex(m1, _view), firstindex(m2, _view), _view) # doCompare(firstindex(m1, _view), firstindex(m2, _view), _view)  #v) # <-----
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        #TODO: lowerBound,upperBound, contentSwapped  (record, stats relation)
        return false
    end
end


middle(1, 3)

m1, m2, _isSWapped = middle(1,9)
#next take

#lowerBound newM1 #m1, m2  # m2, upperBound
_m1,_m2, _isSwapped = middle(1,m1-1)

#= isUnitDistanceReached(1, m1-1) # < ------------ buggy
#isEndReached(1,m1-1)

_m1,_m2, _isSwapped = middle(m1,m2)
isUnitDistanceReached(m1, m2) #  - 1)
#isEndReached(m1,m2)

_m1,_m2, _isSwapped = middle(m2+1,upperBound)
isUnitDistanceReached(m2+1, upperBound)
#isEndReached(m2 + 1, upperBound)
=#

### getLastElement2
""" lowerBound patch for only - """

function getLastElement2(lowerBound, upperBound) #
    if -(lowerBound, upperBound) == 0 #1 #0

        return -1, -1, nothing
    elseif -(lowerBound, upperBound) == 1
        #return the index of either lowerBound, or upperBound:
        return lowerBound, lowerBound, view([lowerBound], firstindex([lowerBound]):lastindex([lowerBound]))  #nothing
    else
        v = collect(lowerBound:upperBound) #+1)

        return view(v, firstindex(v):lastindex(v))
    end
end


## passing two indicies points
-(3,4)

function isEndReached(lowerBound, upperBound) # compiles

    if -(lowerBound, upperBound) == 1#0 #1 #TODO: chage inside the function
        return true
    else
        v = collect(lowerBound:upperBound)
        _view = view(v, firstindex(v):lastindex(v))
        compareQuartet(lowerBound - 1, lowerBound, upperBound, upperBound + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end
end

## passing lowerBound custom kernel

function isEndReached(lowerBound, upperBound, kernel) # requires: -@ -(a,b)

    if -(lowerBound, upperBound) == 1#0 #1  #TODO: chage inside the function
        return true
    else
        v = collect(lowerBound:upperBound)
        _view = view(v, firstindex(v):lastindex(v))
        kernel(lowerBound - 1, lowerBound, upperBound, upperBound + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end
end

_length = copy(length(_view)) #ok
if lowerBound == upperBound # scalar
    # v = collect(lowerBound:upperBound)
    # _view = view(v, firstindex(v):lastindex(v))

    return lowerBound, lowerBound, nothing
end

elseif lowerBound < _length && upperBound < _length && lowerBound >= 0 && upperBound >= 0
    # aContent = _view[lowerBound] #view(_view, lowerBound) #arr[lowerBound]
    #   bContent = _view[upperBound] #view(_view, upperBound) #arr[upperBound]

    contentSwapped = nothing

    #  if aContent > bContent # arr[lowerBound] > arr[upperBound]
    v = collect(lowerBound:upperBound) # collect(lowerBound, upperBound)# collect(lowerBound, upperBound + 1) #

    _view = view(v, firstindex(v):lastindex(v)) # correct
    lowerBound, upperBound, contentSwapped = swapContent(_view[lowerBound], _view[upperBound], _view)
    #   #oldSchoolSwap(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap
    #oldSchoolSwap(lowerBound, upperBound, _view) #<--
    #lowerBound, upperBound = oldSchoolSwap(lowerBound, upperBound, _view)
    # contentSwapped = true   #arr[lowerBound], arr[upperBound]

    #  elseif aContent > bContent
    #do nothing
    #  contentSwapped = false
    #  end

    return lowerBound, upperBound, contentSwapped

elseif isUnitDistanceReached(lowerBound, upperBound) == true # 3, 4 ,d = 1
    _view = collect(lowerBound:upperBound)
    _view = view(_view, firstindex(_view):lastindex(_view))

    lowerBound, upperBound, contentSwapped = swapContent(_view[lowerBound], _view[upperBound], _view) # oldSchoolSwap(lowerBound, upperBound, _view) #   #oldSchoolSwap(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap #<-
    return lowerBound, upperBound, contentSwapped
    # elseif lowerBound == lowerBound == _length-1 || upperBound == _length-1
    #     return isUnitDistanceReached(lowerBound,upperBound) #1, 2)
elseif lowerBound == _length || upperBound == _length # last step  #scalar
    # return getLastElement2(lowerBound, upperBound)
    # return end
    # return isUnitDistanceReached(lowerBound,upperBound) #1, 2)
    return lowerBound,lowerBound,nothing #isUnitDistanceReached(lowerBound, upperBound) #isEndReached(lowerBound, upperBound) #1, 1)

end

# compareTriad

# return lowerBound, upperBound, contentSwapped

# hint: Experimental
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


""" compares  two points of indices , which are subsets of lowerBound _view """
function compareBounds(pt1, pt2, _view::SubArray)
    return swapContent(pt1, pt2, _view) #doCompare(pt1, pt2, _view)
end

""" compares  lowerBound point & an interval of indices , which are subsets of an arr """
function compareBounds(pt, interval, arr::Array{Int64,1})
    interval = collect(interval)
    return compareTriad(pt, interval[1], interval[2], arr)
end


""" compares  lowerBound point & an interval of indices , which are subsets of lowerBound _view """
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

function compareBounds(pt, interval, _view::SubArray)
    interval = collect(interval)
    return compareTriad(pt, interval[1], interval[2], _view) #<------- buggy
end

#doCompare

#DEMO

arr = collect(1:7)
_length = copy(length(arr))
lowerBound = firstindex(arr);
upperBound = lastindex(arr);
if lowerBound < _length && upperBound < _length && lowerBound >= 0 && upperBound >= 0 # && upperBound >= m2 # if lowerBound <= _length && upperBound <= _length
    # aContent = arr[lowerBound] #<-------
    # bContent = arr[upperBound]

    contentSwapped = nothing
    # try
    # Base.@propagate_inbounds
    # if aContent > bContent # arr[lowerBound] > arr[upperBound] n# <--- [critial] decision

    lowerBound, upperBound, contentSwapped = oldSchoolSwap(lowerBound, upperBound, arr) #swapContent(arr[lowerBound], arr[upperBound], arr)  #an inbounds swap #actual array swap
    #    contentSwapped = true   #arr[lowerBound], arr[upperBound]
    println("at index lowerBound = ", lowerBound, " upperBound = ", upperBound, ", aContent = ", arr[lowerBound], " , bContent = ", arr[upperBound])

    #Base.@inbounds
    #TODO: situation: where both contents are equal # current: do nothing
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
    #catch UnexpError #<--- exception: Caught: check for euclidDist above the scope of this function
    #    @error "ERROR:UnexpError " exception = (UnexpError, catch_backtrace())
    #end

    return lowerBound, upperBound, contentSwapped #arr[lowerBound], arr[upperBound]
elseif lowerBound == _length || upperBound == _length
    return getLastElement2(lowerBound, upperBound)
end

#=unCommentMe
function isUnitDistanceReached(lowerBound, upperBound, kernel)

    if -(lowerBound, upperBound) == 1  #TODO: chage inside the function
        return true
    else
        v = collect(lowerBound:upperBound)
        _view = view(v, firstindex(v):lastindex(v))
        #check the bounds' sanity check #TODO:
        kernel(lowerBound - 1, lowerBound, upperBound, upperBound + 1, _view)
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
        return false
    end

end
=#
#rule for isUnitDistanceReached
# d(1,2) <= 1
#=
isUnitDistanceReached(1, 3) # <---- middle
isUnitDistanceReached(1, 1) # <----
isUnitDistanceReached(1,2) # d(1,2) =1
isUnitDistanceReached(1,3)
=#
#------
# doCompare Function

## Patch for doCompare

### getLastElement
""" lowerBound patch for - """
function getLastElement( lowerBound:: Int64 , upperBound :: Int64 )

    if -(lowerBound, upperBound) == 0 #1 #0
        return
    else

        #remap TODO: remap true form
        #return view(v, remap(lowerBound, upperBound)) #v[length(v)])

        v = collect(lowerBound:upperBound) #+1)
        return view(v, firstindex(v):lastindex(v)) #not view(v, firstindex(v): lastindex(v))#_view = collect(lowerBound:upperBound) |> v-> view(v, firstindex(v):lastindex(v))
    end
end


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
oldSchoolSwap(1, 2, arr)
oldSchoolSwap(5, 6, arr)

#additional condition : first input must be lower tham 2nd one
oldSchoolSwap(6, 5, arr)
arr
arr[length(arr)]

#1. getSubtractedValue
function  getSubtractedValue(isWhole::Bool)
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

#getSubtractedValue(10, 5,ar1) #TODO: uncommentMe


function getIndicies(a::Int64, b::Int64, arr)

        firstIndex = first(findall(x -> x == a, arr))
        lastIndex = last(findall(x -> x == b, arr))
        idxA, IdxB = firstIndex, lastIndex
        idxA, IdxB
end


ar1= [10,5,3]

a,m = getIndicies(10,5,ar1) # 1,2


function swap(a::Int64, b::Int64, lst; first=1)

    #1. Init
    idxA, IdxB = 0,0
    n = length(lst)
    nMax =  n -1  + first
    is_swapped = nothing

    #2. Check conditions
    if a > nMax || b > nMax

        #2.1.1 Call Procedure
        idxA, idxB = getIndicies(a , b, lst)
        #2.1.2 Swap Indices
        a,b = idxA, idxB
    end

    if a < nMax || b < nMax
        # if collection is ordered
        if lst[a] < lst[b]
            is_swapped = false  # no swap
            print(" Content is not swappable\n")
        # If collection is not ordered
    elseif lst[a] > lst[b]
            lst[a], lst[b] = lst[b], lst[a] #swap
            is_swapped = true # swap
            print(" Content Swapped\n")
        end
    end
    #3. Return
    print("a ", a, " b ", " lst[a] = ", lst[a], " lst[b] =", lst[b])

    a,b, is_swapped
end

#compareTriad()
# Demo:
#swap(1,2 [10,5,3]) # 1,2, true
#=
function compareTriad(a, m1, b, arr::Array{Int64,1})

    try
        #if a !== Nothing && m1 !== Nothing && b !== Nothing
            _isSwapped = nothing

            #1. 1st scan (2 ops)
            a, m1, _isSwapped = swap(a, m1, arr) #doCompare(a, m1, arr)

            print("\npost-swap: \n")
            print("a, m1, b = ", a, " ", m1, " ", b, " swapped = ", _isSwapped, "\n")
            println(" [a, m1]= ", a, " ", m1, " checked \n")

            #a, upperBound, _isSwapped = swapContent(a, b, arr) #swap(a, b, arr) #doCompare(a, b, arr)
           # println("twinMiddles [a, b]= ", a, " ", b, " checked ")

            ## swap2
            print("swap 2: m1, b\n")
            m1, b, _isSwapped = doCompare(m1, b, arr) # swap(m1, b, arr) #doCompare(m1, b, arr)

            print("a, m1, b = ", a, " ", m1, " ", b, " swapped = ", _isSwapped, "\n")
            println(" [m1, b]= ", m1, " ", b, " checked \n")
            #2. 2nd scan (1)
            print("swap 3: a, m1\n")
            a, m1, _isSwapped = swapContent(a, m1, arr) #swap(a, m1, arr) #doCompare(a, m1, arr)
            println(" [b, m1]= ", a, " ", m1, " checked \n")
            print("a, m1, b = ", a, " ", m1, " ", b, " swapped = ", _isSwapped, "\n")

     catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
      end
     return a, b, m1

 end
=#
# Demo:

ar1 = [10, 8, 3]
# a,b,m1 = compareTriad(1,2,3, ar1)
# print("a= ",a ,"  m1= ",m1," b= ",b ,"; ar1[a]= ",ar1[a] , " ar1[m]= ", ar1[m1] ," ar1[b]= ", ar1[b] ) # print a friendly message, indicating the new array values
#done
#---------
# Comparing Three Numbers, as lowerBound  Triad (compareTriad)
#=
## compareTriad for lowerBound vector array
function compareTriad(lowerBound, m1, upperBound, arr::Array{Int64,1} ; exceptionParameter = UnexpectedError)

    try
        if lowerBound !== Nothing && m1 !== Nothing && upperBound !== Nothing
            _isSwapped = nothing

            lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, arr) # doCompare(lowerBound, upperBound, arr)
            println("twinMiddles [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " checked ")

            lowerBound, m1, _isSwapped = swapContent(lowerBound, m1, arr) #doCompare(lowerBound, m1, arr)
            println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")

            m1, upperBound, _isSwapped =  swapContent(m1, upperBound, arr) # doCompare(m1, upperBound, arr)
            println(" [lowerBound, m1]= ", m1, " ", upperBound, " checked ")

            if lowerBound === nothing || upperBound === nothing || m1 === nothing
                return nothing
            else
                return lowerBound, upperBound, m1
            end

            #else   # throw(error(""))
                raise exceptionParameter
            end
        end

    catch exceptionParameter #UnexpectedError
        writeError( msg, exceptionParameter)
        #@error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end

## compareTriad for any 3 indices
function compareTriad(lowerBound, m1, upperBound) #Used

    try
        _isSwapped = nothing
        if lowerBound < upperBound
            isInReverse = false
        elseif lowerBound > upperBound
            isInReverse = true
        end
        v = nothing
        first = nothing
        second = nothing


        isInReverse == false ? v = collect(lowerBound:m1) : v = collect(m1:lowerBound)  #ok
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = lowerBound
            second = m1
        else
            first = m1
            second = lowerBound
        end
        first, second, _isSwapped =  swapContent(first, second, _view) #  doCompare(first, second, _view)
        println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")


        isInReverse == false ? v = collect(m1:upperBound) : v = collect(upperBound:m1) #ok
        _view = collect(m1:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m1
            second = upperBound
        else
            first = upperBound
            second = m1
        end
        first, second, _isSwapped = swapContent(first, second, _view) #doCompare(first, second, _view)
        println("twinMiddles [m1, upperBound]= ", m1, " ", upperBound, " checked ")

        isInReverse == false ? v = collect(lowerBound:upperBound) : v = collect(upperBound:lowerBound) #ok
        _view = collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = lowerBound, second = upperBound
        else
            first = upperBound, second = lowerBound
        end
        lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, _view) #doCompare(lowerBound, upperBound, _view)
        println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " checked ")

        println("lowerBound, m1, upperBound = ", lowerBound, m1, upperBound)
        if lowerBound === nothing || upperBound === nothing || m1 === nothing
            return nothing
        else
            return lowerBound, upperBound, m1
        end
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end
=#

#Plug-in compareTriad

# rule : compareTriad should not have isEven comparison
( as it is trivial we are dealing with only lowerBound triad: lowerBound m1 ,upperBound)
#left is lowerBound question of interval set-up: lowerBound,m1 m1+1 , upperBound or lowerBound, m1-1, m1 upperBound #depends on situation -deep

## compareTriad: for lowerBound view # applied fail-safe mechanism
function compareTriad( lowerBound :: Int64 , m1 :: Int64 , upperBound :: Int64 , _view::SubArray; exceptionParameter = UnexpectedError) #corrected # warning lowerBound, upperBound unused

    try
        #0. Init
        upperBound = 0
        lowerBound = 0 #nothing

        if lowerBound !== nothing && m1 !== nothing && upperBound !== nothing && _view !== nothing

            _isSwapped = nothing
            lowerBound = m1 - 1

            #_view = collect(lowerBound:m1) |>
            #suggest: use lowerBound,upperBound as bounds of the current _view
            #  lowerBound != upperBound ? _view = view(_view, firstindex(lowerBound):lastindex(upperBound)) : return "lowerBound ==upperBound scalar: lowerBound = ", lowerBound, " upperBound = ", upperBound
            # 1 ,3 + 1 =4//2 =2  m1:
            #either
            #boils down to lowerbound & upperBound
            # lowerBound , m1-1 ;  m1 upperBound
            # lowerBound, m1,  or m1+1 , upperBound

            if lowerBound != lowerBound  #(lowerBound != m1 - 1 )# fail-safe mechanism
                v = collect(lowerBound:lowerBound)
                length(v)
                lowerBound, lowerBound, _isSwapped = swapContent(lowerBound, lowerBound, _view) #doCompare(lowerBound, lowerBound, _view) # [lowerBound, m1]= 1 2 checked

                if lowerBound === nothing && lowerBound === nothing && _isSwapped == nothing # retry: #lowerBound = m1  #TODO: check doCompare returns nothing, nothing,nothing when lowerBound==upperBound
                    lowerBound = m1
                    lowerBound, lowerBound, _isSwapped = swapContent(lowerBound, lowerBound, _view) #doCompare(lowerBound, lowerBound, _view)
                end

            #Decide: shall we  continue ?
            elseif lowerBound == lowerBound #m1 # fallback
                # lowerBound, m1, _isSwapped = 1, 1, nothing
                lowerBound, lowerBound, _isSwapped = lowerBound, lowerBound, nothing
                #TODO: can we retry here, with lowerBound different lowerBound, as well?
            end

            #decide the upperBound (from lowerBound) w
            #if lowerBound == m-1 ||  lowerBound == m
            upperBound == lowerBound + 1
            println(" upperBound = ", upperBound)

            # lowerBound, m1, _isSwapped = swapContent(lowerBound, m1, _view) # doCompare(lowerBound, m1, _view) # [lowerBound, m1]= 1 2 checked  # <-----
            # println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")

            # mid = m1 + 1 # or (m1) , upperBound
            #rule: once lowerBound is determined, so do the upperBound, as well


            if upperBound != upperBound
                v = collect(upperBound:upperBound)
                _view = view(_view, firstindex(v):lastindex(v)) #mid):lastindex(upperBound))  # (_view, _view)

                # mid, upperBound, _isSwapped = mid < upperBound && length(_view)>1 ?
                # if upperBound < upperBound && length(_view) > 1 # you can safely pick 1 (either mean the same )
                #   upperBound, upperBound, _isSwapped = SwapContent(upperBound, upperBound, _view) doCompare(upperBound, upperBound, _view) #: return  #doCompare(m1, upperBound, _view) #<-------
                #if mid != upperBound
                #  if upperBound != upperBound # compiles

                upperBound, upperBound, _isSwapped = swapContent(upperBound!, upperBound, _view) #doCompare(upperBound!, upperBound, _view) # [lowerBound, m1]= 1 2 checked

                #  else # fallback  # Activated #where it fails   if view == 0 # throw error
                #  mid, upperBound, _isSwapped = 1, 1, nothing
                #should throw(error())
                #println(" [upperBound upperBound] checked ", upperBound)

                println(" upperBound , upperBound] checked ", upperBound, " _isSwapped = ", _isSwapped)
            else
                upperBound == upperBound # or length () throw error
                #m == upperBound # does not exist
                println("upperBound == upperBound upperBound = ", upperBound, " upperBound = ", upperBound)

                # println("upperBound == upperBound upperBound = ",upperBound, " upperBound = ", upperBound )
                #   p upperBound , " ", upperBound, " checked ")

            end

        else
            raise(exception( UnexpectedError)) #"Unexpected Error")) #throw(error("Unexpected Error Reason : ")) #<---- careful (excepion name is `weak`)
        end

        v = collect(lowerBound:upperBound)
        _view = view(v, firstindex(v):lastindex(v))

        if lowerBound != upperBound
            lowerBound, upperBound, _isSwapped =  swapContent(lowerBound, upperBound, _view)  # doCompare(lowerBound, upperBound, _view)
        elseif lowerBound == upperBound # fallback
            lowerBound, upperBound, _isSwapped = lowerBound, lowerBound, nothing

        end

        println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " checked ")
        println("lowerBound, m1, upperBound = ", lowerBound, m1, upperBound)
        #  if lowerBound === nothing || upperBound === nothing || m1 === nothing
        #      return nothing, nothing, nothing
        # else
        return lowerBound, upperBound, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]
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

## compareQuartet: on lowerBound vector array
##in lowerBound vector, as lowerBound Quartet

""" Comparing 4 numbers: lowerBound,upperBound & middles: m1,m2 , input vector array , applys view  on each Interval """

function compareQuartet(a, m1,m2, b, arr; exceptionParameter = UnexpectedError)

    try
        #0. Init
        #G1: Group1
        a = firstIndex(arr)
        b = lastindex(arr)
        #G2: Group2
        m1
        m2

        #Phase 1:

        # Group1: find local min
        a, b, isSwapped1 = docompare(a,b,arr)

        #Group2: find local min
        m1 , m2, isSwapped2 = docompare(m1,m2,arr)

        #Phase2:
        # find min(s): a  & m1
        a , m1 , isSwapped3 = docompare(a,m1,arr)

        # find max(ex)
        m2, b , isSwapped3 = docompare(m2,b,arr)
        Ms = [isSwapped1,isSwapped2,isSwapped3,isSwapped4]
    #3. Return
    a , m1 , m2, b, Ms
    catch exceptionParameter #UnexpectedError
        writeError(msg, exceptionParameter) # @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end


## compareQuartet: in General #TODO: unCommentMe
#=
"""# compareQuartet with no input argument view , returns  lowerBound dynamic view for each pair of points """
function compareQuartet(lowerBound, m1, m2, upperBound)

    try

        println("entering compareQuartet")
        _view = nothing
        isInReverse = nothing

        if lowerBound < upperBound
            isInReverse = false
        elseif lowerBound > upperBound
            isInReverse = true
        end
        v = nothing
        first = nothing
        second = nothing

        #1
        isInReverse == false ? v = collect(lowerBound:m1) : v = collect(m1:lowerBound)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))

        if isInReverse == false
            first = lowerBound
            second = m1
        else
            first = m1
            second = lowerBound
        end
        first, second, isSwapped = swapContent(first, second, _view) # doCompare(first, second, _view)
        println("twinMiddles [lowerBound, m1]= ", m1, " ", m2, " swapped ")

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
        first, second, isSwapped = swapContent(first, second, _view) #doCompare(first, second, _view)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")
        #3
        isInReverse == false ? v = collect(lowerBound:m2) : v = collect(m2:lowerBound)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = lowerBound
            second = m2
        else
            first = m2
            second = lowerBound
        end
        first, second, isSwapped = swapContent(first, second, _view) #doCompare(first, second, _view)
        println("twinMiddles [lowerBound, m2]= ", lowerBound, " ", m2, " swapped ")

        #4
        isInReverse == false ? v = collect(m1:upperBound) : v = collect(upperBound:m1)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m1
            second = upperBound
        else
            first = upperBound
            second = m1
        end
        first, second, _isSwapped = swapContent(first, second, _view) # doCompare(first, second, _view)
        println("twinMiddles [m1, upperBound]= ", m1, " ", upperBound, " swapped ")

        #5
        isInReverse == false ? v = collect(m2:upperBound) : v = collect(upperBound:m2)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = m2
            second = upperBound #<-----
        else
            first = upperBound
            second = m2
        end

        first, second, _isSwapped = swapContent(first, second, _view) # doCompare(first, second, _view)
        println("twinMiddles [m2, upperBound]= ", m2, " ", upperBound, " swapped ")

        #6
        isInReverse == false ? v = collect(lowerBound:upperBound) : v = collect(upperBound:lowerBound)
        _view = v |> _view -> view(_view, firstindex(_view):lastindex(_view))
        if isInReverse == false
            first = lowerBound, second = upperBound
        else
            first = upperBound, second = lowerBound
        end
        first, second, _isSwapped = swapContent(first, second, _view)  # doCompare(first, second, _view)
        println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " swapped ")

        println("twinMiddles [m1, m2]= ", [m1, m2])

        return lowerBound, upperBound, m1, m2 #m1, m2 #should it be lowerBound,upperBound, twinMiddles (this is Practical)
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end
=#
#mynote: its lowerBound bit easier : there is lowerBound clear distinction between m1 & m2

#function compareQuartet2(lowerBound, m1, m2, upperBound, arr:: Array) #Warning

#    lowerBound, m1
# compareQuartet
#1.applied input parameter check for Nothing  condition
function compareQuartet( lowerBound, m1, m2, upperBound, arr :: Array; exceptionParameter = UnexpectedError) #Warning

    try
        println("entering compareQuartet")

        if lowerBound !== Nothing && m1 !== Nothing && m2 != Nothing && upperBound !== Nothing && arr !== Nothing
            _isSwapped = nothing

            _isEven = copy(isEven(lowerBound, upperBound))

            if _isEven == true # lowerBound m1 m1+1  upperBound

                lowerBound = m1
                upperBound = m1 + 1

                #1
                lowerBound, lowerBound, isSwapped = swapContent(lowerBound, lowerBound, arr) #doCompare(lowerBound, lowerBound, _view) #<------
                println("twinMiddles [lowerBound, m1]= ", lowerBound, " ", lowerBound, " swapped =", isSwapped)
            elseif _isEven == false # lowerBound m1 m2 upperBound
                lowerBound = m1
                upperBound = m2 # which is always equal to m + 1

            end

            #1

            lowerBound, lowerBound, _isSwapped = swapContent(lowerBound, lowerBound, arr) #<------
            println("twinMiddles [lowerBound, lowerBound]= ", lowerBound, " ", lowerBound, " _isSwapped ", _isSwapped)
            #2
            lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, arr)
            println("twinMiddles [lowerBound, m2]= ", lowerBound, " ", m2, " swapped ", _isSwapped)
            #3
            lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, arr)
            println("twinMiddles [lowerBound, m2]= ", lowerBound, " ", upperBound, " swapped ", _isSwapped)

            #4
            lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, arr)
            println("twinMiddles [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " _isSwapped =  ", _isSwapped)

            #5
            upperBound, upperBound, _isSwapped = swapContent(upperBound, upperBound, arr)
            println("twinMiddles [m2=upperBound , upperBound]= ", upperBound, " ", upperBound, " _isSwapped =", _isSwapped)

            #6
            lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, arr)
            println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " _isSwapped = ", _isSwapped)


            #twinMiddles = [m1, m2] # vector (Array{Int64, 1})
            println("twinMiddles [m1, upperBound]= ", [lowerBound, upperBound])
            #        push!(Middles, twinMiddles)

        elseif lowerBound == Nothing || upperBound == Nothing || m1 == Nothing || m2 == Nothing
            # should be throw(error...)
            #return
            raise(UnexpectedError) #throw(error("Unexpected Null Error Reason :  lowerBound or upperBound or m1 or m2 = Nothing+-'[l0] "))
        #end
    end
        return lowerBound, upperBound, m1, m2 #m1, m2 #should it be lowerBound,upperBound, twinMiddles ?
    catch exceptionParameter
        writeError( msg, exceptionParameter)
    end
end


## compareQuartet: on lowerBound view
""" input vector array , applied on lowerBound view  (on each Interval) """
function compareQuartet( lowerBound, m1, m2, upperBound, _view::SubArray; exceptionParameter = UnexpectedError) #TODO: fix

    try

        println("entering compareQuartet")
        #lowerBound, m1
        #1 lowerBound, m1 (G1)
        lowerBound, m1, isSwapped = swapContent(lowerBound, m1, _view) #<------
        println("twinMiddles [lowerBound, m1]= ", m1, " ", m2, " swapped ")

        #2 lowerBound, m2 (G2)
        lowerBound, m2, isSwapped = swapContent(lowerBound, m2, _view)
        println("twinMiddles [lowerBound, m2]= ", lowerBound, " ", m2, " swapped ")

        # 3 m1 , m2 (inter group: max)
        #3
        m1, m2, isSwapped = swapContent(m1, m2, _view) # doCompare(m1, m2, _view)
        println("twinMiddles [m1, m2]= ", m1, " ", m2, " swapped ")

        #4 Inter-Group min


        m1, upperBound, _isSwapped = swapContent(m1, upperBound, _view)
        println("twinMiddles [m1, upperBound]= ", m1, " ", upperBound, " swapped ")
        #5
        m2, upperBound, _isSwapped = swapContent(m2, upperBound, _view)
        println("twinMiddles [m2, upperBound]= ", m2, " ", upperBound, " swapped ")
        #6
        lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, _view)
        println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " swapped ")
        # =#

        #twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", [m1, m2])
        #        push!(Middles, twinMiddles)
        return lowerBound, upperBound, m1, m2 #m1, m2 #should it be lowerBound,upperBound, twinMiddles ?
    catch exceptionParameter #UnexpectedError
        writeError( msg, exceptionParameter)
        #@error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
end


# custom Kernel functions

## kernel: of Two Points
function kernel(lowerBound, upperBound, consumedFunction)

    return consumedFunction(lowerBound, upperBound)
end


## kernel: of lowerBound Vector Array
function kernel(lowerBound, upperBound, arr::Array{Int64,1}, consumedFunction)

    return consumedFunction(lowerBound, upperBound, arr)
end

## kernel: of lowerBound View
function kernel(lowerBound, upperBound, _view::SubArray, consumedFunction)

    return consumedFunction(lowerBound, upperBound, _view)
end

view(v, v)

#kernel(lowerBound, upperBound, view(v, v), middle!) #UncommentMe
#kernel(lowerBound, upperBound, arr, middle!)

#---------
#start
# let ar1 be lowerBound view , subarray of the main lowerBound,upperBound = 1,9
ar1 = [1, 3]
length(ar1) - 2 # should be 0 (special case: ending make it 1 so that if is checked 1 more time )
firstindex(ar1)
firstindex(ar1) - (length(ar1) - 2) # 1 (1 middle left)
currentValue = nothing
#currentValue = initCurrentValue(arr) # 1 #correct
#currentValue = initCurrentValue(ar1[1], ar1[2]) # 1 i.e.  #correct
#calcVerteciesLeft!(ar1[1], ar1[2], currentValue) # 1
numMiddles = currentValue # 1 #FYI

#stopFlag = isStoppingCondition(lowerBound, upperBound, currentValue) #correct
#stopFlag = isStoppingCondition(lowerBound, upperBound, 2) #when currentValue>1 should be false
#callMiddle!
#m1, m2, isWhole = middle(ar1[1], ar1[2]) # callMiddle!(firstindex(ar1): lastindex(ar1), ar1) #should be true #true  # odd members have an actual middle
#isWhole = getIsWhole(ar1[1],ar1[2])
#stopFlag = isStoppingCondition(lowerBound, upperBound, ar1) #<------- KNOWN ISSUE (checkVerticiesLeft) # logic Discrepency either ar1, nothing or lowerBound,upperBound,nothing (not both)
#subtle discripence : check both flows
#stopFlag = isStoppingCondition(lowerBound, upperBound, nothing)
#stopFlag = isStoppingCondition(ar1, nothing) # we're only concerned with the given interval

#update currentValue


#TODO: remapping function from indicies to values

### new Idea : use of kernel as input
#lowerBound m1-1 m1+1 upperBound

#lowerBound m1-1 m2+1 upperBound


# CompareBounds


arr = collect(1:7)
pts = [1, 3, 4, 7]
#pts[1] # proxy for lowerBound lower bound
#compareBounds(pts[1], pts[2], arr) #input # solved #requires pts #Bounds Error
#---------
#compareQuartet(1, 2, 3, 4, [1, 2, 3, 4])  # 1 4 2 3  # <----- bug

view(v, firstindex(v):lastindex(v))#done

v = collect(1:9)
res = view(v, firstindex(v):lastindex(v))

typeof(res)
v
view(v, v)

# Depreciate NewView
"""
#TODO: Check use of NewView
function NewView(_a, _b)
    v = collect(_a:_b)
    _view = view(v, firstindex(v):lastindex(v))
    #  _view = view(v,firstindex(v): lastindex(v)) #(res[1]:res[length(res)]))

    return v, _view
end
"""

#-------

function checkSumIsEven( lowerBound :: Int64, upperBound :: Int64)

    _sum = sumInterval( lowerBound, upperBound) #    upperBound + lowerBound - 1  # distance between them  <---- Error
    println("lowerBound,upperBound =", lowerBound, " ", upperBound)
    println("sum = ", _sum)
    isItEven = isEven(_sum) # even is lowerBound proxy for divisibility # TODO: surround by lowerBound copy()  #homeMade Heuristic  <------
    println("iseven  = ", isItEven)
    mid = _sum / 2 #  -1  # precalculate mid (_sum /2 )  #Float32(64)
    println("mid( sum / 2) = ", mid)

    return isItEven, mid #warning: sum is not functional(no utility)
end


#----------
# DEMO: Critical

#value-check:

ϕ = [1, 3]
mid = 1.5 # 3/2 =

lower  = -1 # <-------
upper = -1 # <-----------
lower = Int(floor(mid))
upper = Int(ceil(mid))
#---------------------------

# getSingleMiddle
# if you have a triad of Points (1,2,3) [order]: should you also compare & sort?

#Int(floor(5.5))

#checked

function getSingleMiddle( mid, isItEven::Bool )
    newMid = 0
    println("Even = ", isItEven)
    newMid = Int(floor(mid)) #Int
    println("Rational mid(index)= ", mid)
    #= isWhole = true
    println("is whole = ", isWhole) =#
    return newMid, newMid + 1, isItEven #=, isWhole =#

end

#-------------

# getFractionalMiddle

function getFractionalMiddle(mid, isItEven::Bool)

    # calculate fractionalMid
    println("Even = ", isItEven)
    println("fractionalMiddle, twinMiddles ") # Warning: one be 1 other -1
    lower = -1
    upper = -1
    lower = Int(floor(mid))
    upper = Int(ceil(mid))
    #=isWhole = false =#
    println("lower = ", lower)
    println("upper = ", upper)
    #= println("isWhole = ", isWhole) =#
    #TODO: recommendation: lower, upper , isItEven
    return lower, upper, isItEven # the differenece is still 1, one way to resolve:  `isWhole`

end


#------------------
# middle

@propagate_inbounds function middle( lowerBound, upperBound; exceptionParameter = UnexpectedError ) # upperBound  + lowerBound -1  # Acceptable #review#2 ; offset = 1 #rule-found: offset only used in an array (at its start)

    try

        #=
        _sum = sumInterval(lowerBound, upperBound) #    upperBound + lowerBound - 1  # distance between them  <---- Error
        println("lowerBound,upperBound =", lowerBound, " ", upperBound)
        println("sum = ", _sum)
        isItEven = isEven(_sum) # even is lowerBound proxy for divisibility # TODO: surround by lowerBound copy()  #homeMade Heuristic  <------
        println("iseven  = ", isItEven)
        mid = _sum / 2 #  -1  # precalculate mid (_sum /2 )  #Float32(64)
        println("mid( sum / 2) = ", mid)
        =#

        isItEven, mid = checkSumIsEven(lowerBound, upperBound) # _sum removed

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
            raise(exceptionParameter) #throw(error("Unexpected error occured")) #<-------
        end
    catch exceptionParameter #UnexpectedError #errors out
        writeError( msg, exceptionParameter)
        #@error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end
end


#TODO middle!(lowerBound,upperBound)
#isItEven, mid = checkSumIsEven(1, 10)


getSingleMiddle(2, true)
getFractionalMiddle(2, false)
checkSumIsEven(1, 10)
checkSumIsEven(1, 9)
checkSumIsEven(1, 3)

#------master function
middle(1, 10) #works
#------

#in Progress # unstable #unCommentMe

#=function middle!(lowerBound, upperBound)

    try

        isItEven, mid = checkSumIsEven(lowerBound, upperBound) # _sum removed
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
            #=
            return m1, m2, isItEven #lower, upper, isItEven # the differenece is still 1, only way to discriminate is by using isWhole
        else
            throw(error("Unexpected error occured"))
        end
        #finally , what to do next #(nextMiddle ?) lowerBound,m
        #pop next interval from _stack , then apply kernel
        middle(lowerBound, upperBound) #<-------
        =#
    catch UnexpectedError #errors out
        @error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end

end=#

#middle!(1,9)
#---------------------------
#Q.how to make intervals from points
#Q2. why to have those (faster than intrvals )
#-----------
#
#At least 1 partition function
""" gets _stack of ranges """

_stack = [[1, 3], [4, 7]]
typeof(_stack)

#-------
function rangesToPts(ranges) #checked

    _length = copy(length(ranges))
    idMid = Integer(ceil(_length / 2)) # 1 # dof = {1,2} 0 #missing #TODO: complete
    pts = []
    #for i in 1:length(ranges)
    for eachindex in ranges
        # push
        lowerBound = ranges[i][1]
        upperBound = ranges[i][length(ranges[i])] #[2]
        ranges[idMid+idMid][2] #<----------  ranges do exist
        println("lowerBound = ", lowerBound)
        println("upperBound = ", upperBound)
        push!(pts, lowerBound) # every odd has an lowerBound value
        push!(pts, upperBound) # every even has lowerBound upperBound value
    end
    return pts
end

#pts = rangesToPts(_stack) #UncommentMe
#compareBounds() #TODO: Check

pts
_view = collect(5:6) |> _view -> view(_view, firstindex(_view):lastindex(_view))

#callCause(5, 6, _view) # depreciate
#cause(5, 6, _view)

currentValue = nothing
interval = copy(1:3)
_view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))


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
#-compare(lowerBound,upperBound,view)

# 3 - 1 + 1
intervalLength(1, 4) # same as +(1,4)

# Compare
""" lowerBound universal compare: compares & sorts contents according to the structure of lowerBound given interval, (lowerBound,upperBound)"""
function Compare(lowerBound, upperBound, arr::Array{Int64,1}; exceptionParameter = UnexpectedError ) # should #unimplemented: no such function with niput arguments specified
    #implicit docompare() function
    m1, m2, isWhole = middle(lowerBound, upperBound)
    _length = copy(intervalLength(lowerBound, upperBound))
    try
        if _length == 3 #took the easy way, what if view is large? only way is from lowerBound,upperBound
            compareTriad(lowerBound, m1, upperBound, arr) #lowerBound, m1, upperBound # m1 is vital

        elseif _length == 4
            compareQuartet(lowerBound, m1, m2, upperBound, arr)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch exceptionParameter #UnexpectedError
        writeError( msg, exceptionParameter)
        #@error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end
end


function Compare( lowerBound :: Int64 , upperBound :: Int64 , _view :: SubArray ; exceptionParameter :: String = UnexpectedError )

    #implicit docompare() function
    m1, m2, isWhole = middle(lowerBound, upperBound)
    _length = copy(intervalLength(lowerBound, upperBound))

    try
        if _length #length(_view == 3) #took the easy way, what if view is large? only way is from lowerBound,upperBound
            compareTriad(lowerBound, m1, upperBound, _view) #lowerBound, m1, upperBound # m1 is vital

        elseif _length #length(_view == 4)
            compareQuartet(lowerBound, m1, m2, upperBound, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
    catch exceptionParameter #UnexpectedError
        writeError( msg, exceptionParameter)
        # @error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end
end


#----
# Map Points
## Map on an array
""" maps indicies to lowerBound Array values """
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


## Map on lowerBound View
""" maps indicies to lowerBound SubArray values """
function mapPts(pts, _view :: SubArray) #ok

    vals = []

    for i in 1:length(pts) # _length
        idx = pts[i]
        append!(vals, _view[idx])
    end
    return vals
end


## Event-Driven: map an array
"""Event-Driven"""
function mapPts(pts, arr :: Array{Int64,1}, i :: Int64) #ok

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
function mapPts(pts, _view::SubArray, i :: Int64 )
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
maps points on lowerBound vector array arr, with respect to index i
"""
# Map Points (MapPts!) with lowerBound vector array
function mapPts!( pts, arr::Array{Int64,1}, i :: Int64 ) # TODO: sanity check : use of i

    vals = []

    #for i in 1:length(pts) # _length
    if i > 1
        idx = popat!(pts, i) #pts[i]
        append!(vals, arr[idx]) # accumulates
        i -= 1
    end
    return vals
end


# Map Points (MapPts!) with lowerBound view
function mapPts!( pts, _view::SubArray, i :: Int64 ) # TODO: sanity check : use of i

    vals = []

    #for i in 1:length(pts) # _length
    if i > 1
        idx = popat!(pts, i) #pts[i]
        append!(vals, _view[idx]) # accumulates
        i -= 1 #subtract
    end
    return vals
end


mapPts([1, 3], [1, 2, 3], 1)

#------
#TODO: Recheck Compare , the under lowerBound new light #requires: mapPts

function Compare( pts, arr::Array{Int64,1}, i :: Int64 ; exceptionParameter = UnexpectedError) # should be sanity checked
    #implicit docompare() function
    #  m1, m2, isWhole = kernel(lowerBound, upperBound, arr)
    vals = mapPts(pts, arr, i)       #<-------- sanity check
    _length = copy(length(vals))
    try
        if length == 2
            return swapContent(vals[1], vals[2], arr)  #doCompare(vals[1], vals[2], arr)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from lowerBound,upperBound
            lowerBound = vals[1]
            m1 = vals[2]
            upperBound = vals[3]
            return compareTriad(lowerBound, m1, upperBound, arr) #lowerBound, m1, upperBound # m1 is vital

        elseif _length == 4 #length(_view == 4)
            lowerBound = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            upperBound = vals[4]
            return compareQuartet(lowerBound, m1, m2, upperBound, arr) #<------

        else
            raise(exceptionParameter) #throw(error("Unexpected Error Occured"))
        end
    catch exceptionParameter
        writeError( msg, UnexpectedError)
    end
end

#TODO: Utilize kernel
function Compare(pts, _view::SubArray, i :: Int64 ; exceptionParameter = UnexpectedError) # should be sanity checked #< --------


    ## implicit docompare() function
    ## m1, m2, isWhole = kernel(lowerBound, upperBound, _view)
    vals = mapPts(pts, _view, i)             #<-------- sanity check
    _length = copy(length(vals))
    try
        if length == 2
            return swapContent(vals[1], vals[2], _view) #doCompare(vals[1], vals[2], _view)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from lowerBound,upperBound
            lowerBound = vals[1]
            m1 = vals[2]
            upperBound = vals[3]
            return compareTriad(lowerBound, m1, upperBound, _view) #lowerBound, m1, upperBound # m1 is vital

        elseif _length == 4 #length(_view == 4)
            lowerBound = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            upperBound = vals[4]
            return compareQuartet(lowerBound, m1, m2, upperBound, _view)

        else
            throw(error("Unexpected Error Occured"))
        end

        lowerBound, upperBound,  m1, m2
    catch exceptionParameter # UnexpectedError
        writeError( msg, exceptionParameter)
    end
end


function Compare(pts, _view :: SubArray, kernel, i :: Int64 ; exceptionParameter =  UnexpectedError) # should be sanity checked #< --------

    #implicit docompare() function
    m1, m2, isWhole = kernel(lowerBound, upperBound, _view)
    vals = mapPts(pts, _view, i)             #<-------- sanity check
    _length = copy(length(vals))
    try
        if length == 2
            return swapContent(vals[1], vals[2], _view) # doCompare(vals[1], vals[2], _view)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from lowerBound,upperBound
            lowerBound = vals[1]
            m1 = vals[2]
            upperBound = vals[3]
            return compareTriad(lowerBound, m1, upperBound, _view) #lowerBound, m1, upperBound # m1 is vital

        elseif _length == 4 #length(_view == 4)
            lowerBound = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            upperBound = vals[4]
            return compareQuartet(lowerBound, m1, m2, upperBound, _view)

        else
            raise(exceptionParameter) #throw(error("Unexpected Error Occured"))
        end #<---
    catch exceptionParameter
        writeError( msg, exceptionParameter) #@error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end
end


function Compare(pts, arr :: Array{Int64,1} , kernel, i :: Int64 ; exceptionParameter :: String = UnexpectedError) # should be sanity checked #< --------
    #implicit docompare() function
    m1, m2, isWhole = kernel(lowerBound, upperBound, arr)
    vals = mapPts(pts, arr, i)             #<-------- sanity check
    _length = copy(length(vals))
    try
        if length == 2
            return swapContent(vals[1], vals[2], arr) #doCompare(vals[1], vals[2], arr)
        elseif _length == 3 #length(_view == 3) #took the easy way, what if view is large? only way is from lowerBound,upperBound
            lowerBound = vals[1]
            m1 = vals[2]
            upperBound = vals[3]
            return compareTriad(lowerBound, m1, upperBound, arr) #lowerBound, m1, upperBound # m1 is vital

        elseif _length == 4 #length(_view == 4)
            lowerBound = vals[1]
            m1 = vals[2]
            m2 = vals[3]
            upperBound = vals[4]
            return compareQuartet(lowerBound, m1, m2, upperBound, arr)

        else
            raise(exceptionParameter)
        end
    catch exceptionParameter # UnexpectedError
        writeError( msg, exceptionParameter)
    end
end


function Compare( lowerBound :: Int64 , upperBound :: Int64, _view::SubArray, kernel ; exceptionParameter = UnexpectedError) # check

    #implicit docompare() function
    m1, m2, isWhole = kernel(lowerBound, upperBound, _view)
    _length = copy(intervalLength(lowerBound, upperBound))
    try
        if _length #length(_view == 3) #took the easy way, what if view is large? only way is from lowerBound,upperBound
            compareTriad(lowerBound, m1, upperBound, _view) #lowerBound, m1, upperBound # m1 is vital

        elseif _length #length(_view == 4)
            compareQuartet(lowerBound, m1, m2, upperBound, _view)

        else
            raise(exceptionParameter)
        end
        lowerBound, upperBound, m1, m2
    catch exceptionParameter #UnexpectedError
        writeError( msg, exceptionParameter)
    end
end


#----#test: _stack
#_stack = []
#_item = pop!(_stack) # [1,3]

length(_stack)
#2. sort()


""" Compares & sorts points based on the structure of the view, whether lowerBound triad or quartet of points """
function CompareSort( lowerBound, upperBound, arr :: Array{Int64,1} )

    #implicit docompare() function
    m1, m2, isWhole = middle(lowerBound, upperBound) # callMiddle!(lowerBound,upperBound,_view)
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

            res = compareTriad(lowerBound, m1, upperBound, arr) # <---

        elseif length(arr) == 4
            res = compareQuartet(lowerBound, m1, m2, upperBound, arr)

        else
            raise(exceptionParameter) #throw(error("Unexpected Error Occured"))
        end
        println(arr)
        return res
    catch exceptionParameter #UnexpectedError
        writeErrorq( msg, exceptionParameter)
        #@error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
    end
end


function CompareSort(lowerBound, upperBound, _view :: SubArray; exceptionParameter = UnexpectedError )

    #implicit docompare() function
    m1, m2, isWhole = middle(lowerBound, upperBound) # callMiddle!(lowerBound,upperBound,_view)
    res = nothing
    _first = copy(firstindex(arr))
    _last = copy(lastindex(arr))
    try
        if length(arr) == 1
            isEndReached(_first, _last)

        elseif length(arr) == 2
            isUnitDistanceReached(_first, _last)

        elseif length(_view) == 3
            res = compareTriad(lowerBound, m1, upperBound, _view)

        elseif length(_view) == 4
            res = compareQuartet(lowerBound, m1, m2, upperBound, _view)

        else
            throw(error("Unexpected Error Occured"))
        end
        println(_view)
        return res
    catch exceptionParameter # UnexpectedError
        writeError( msg, exceptionParameter) #@error "Unexpected Error Occured" exception = (UnexpectedError, catch_backtrace())
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

upperBound = pts[length(pts)-1] #before the  last (upperBound)
lowerBound = pts[length(pts)-1-1] #before the  last (lowerBound)
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

#---- #view run
v = @view [1, 4, 8][1:2]

#index to content
#elementOf(index::Int64)
first([1, 4, 8], 2)[2] #return the first n elements i.e. 2: [1:4] , [1:4][2] = 4



""" searches the Content in the vector, returning its index(cies)"""
function indexOf( arr, aContent :: Int64)

    res = findall((x -> x == aContent), arr)  #indexOf(aContent, arr)
    return res
end


#collect([1, 4, 8], 1:2)

firstindex([1, 4, 8], 9) # erroneous function (reson: always returning 1)

#indexOf(aContent::Int64)

aContent = 4
lowerBound = findall((x -> x == aContent), [1, 4, 8])  #indexOf(aContent, arr)

##  v lowerBound = lowerBound[1]firstindex(lowerBound)
    #first([1,4,8],1)
#v1 = view([1, 4, 8],1:firstindex([1,4,8],4)) #)
#v2 = view([1, 4, 8], 4 :lastindex([1, 4, 8])) #,8)
#view([1, 4, 8], firstindex([1, 4, 8], 1)) #correct
#v = union(min(firstindex([1, 4, 8], lowerbound),max(firstindex([1, 4, 8], lowerbound)) #, firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3] # [1,1]
#view([1, 4, 8], firstindex([1, 4, 8], 8)) #1
## newRow = view(arr, 2-1:2) # this works  #[4 8]
#----

_newView = collect(lastB:interval[2]) |> _newView -> view(_newView, firstindex(_newView):lastindex(_newView))  #(v, firstindex(v):length(v)) # interval[2]) #works # [1,2,3]
#view-property: Sub-View : (view of lowerBound view )
_newView = collect(lastB:interval[2]) |> _newView -> view(_newView, firstindex(_newView):lastindex(_newView)) #subviewing the view
_newView2 = collect(lastB:interval[1]) |> _newView2 -> view(_newView2, firstindex(_newView2):lastindex(_newView2))
#---------
# Infer Location

## Infer location of three point

## of lowerBound Three Points

""" quantitatively, compare values , returns lowerBound qualitative value """
function inferLocation(lowerBound :: Int64 , upperBound :: Int64 , x; exceptionParameter :: Int64 = EqualBoundsError)

    try # the classical approach (compare all 3 at same time )
        #  newLocation

        if x > lowerBound && x > upperBound # x is max
            if lowerBound < upperBound #lowerBound is min
                return lowerBound, upperBound, x
            elseif lowerBound > upperBound  # or lowerBound is max
                return upperBound, lowerBound, x
            end
        elseif x > lowerBound && x < upperBound #x is the middle
            if lowerBound < upperBound # lowerBound is min
                return lowerBound, x, upperBound
            elseif lowerBound > upperBound # lowerBound is max
                return upperBound, x, lowerBound
            end
        elseif x < lowerBound && x < upperBound # x is the min (how low is lowerBound )
            if lowerBound < upperBound # lowerBound is the min
                return x, lowerBound, upperBound
            elseif lowerBound > upperBound # lowerBound is the max
                return x, upperBound, lowerBound
            end

        elseif x == lowerBound || x == upperBound
            raise(exceptionParameter) #throw(error("Different Bounds are equal "))
        end
    catch exceptionParameter #EqualBoundsError
        writeError( msg, exceptionParameter)
        #@error "EqualBoundsError : Different Bounds,which should be different, are equal " (EqualBoundsError, catch_backtrace())
    end
end


##Depreciate
#=
function inferLocation(lowerBound, upperBound, x)

    try
        # newLocation
        if x > lowerBound && x > upperBound #x is max
            return lowerBound, upperBound, x
        elseif x > lowerBound && x < upperBound #x is in between
            return lowerBound, x, upperBound
        elseif x < lowerBound && x < upperBound # x is the min
            return x, lowerBound, upperBound
        elseif x == lowerBound || x == upperBound
            throw(error("Different Bounds are equal "))
        end
    catch BoundsEqualError
        @error "BoundsEqualError :Different Bounds are equal " exception = (BoundsEqualError, catch_backtrace())
    end

end
=#

#using arr content from location arr
##of 3 points, on lowerBound Vector array
## of 3 points, on lowerBound Vector array

function inferLocation(lowerBound :: Int64 , upperBound :: Int64 , x, arr) #compiles  #warning arr is unused


    # try
    # newLocation
    first = 0
    middle = 0
    last = 0
    locations = copy(inferLocation(lowerBound, upperBound, x))
    if locations !== nothing
        #if lowerBound === nothing && upperBound === nothing && x === nothing && arr === nothing
        first, middle, last = locations
    else
        first, middle, last = lowerBound, upperBound, x #nothing, nothing, nothing
        #TODO:
        #if locations !== nothing
        # return [first, middle, last], [arr[first], arr[middle], arr[last]]

    end
    #return locations
    return first, middle, last #], [arr[first], arr[middle], arr[last]]
    #  catch
    # end

end

#DEMO:
lastB
interval[1]
interval[2]
lastB = 1
interval = collect(2:3)

lastB, interval[1], interval[2] = inferLocation(interval[1], interval[2], lastB)# inferlocation application

v = union(lastB, (interval[1], interval[2]))

_view = collect(v) |> _view -> view(_view, firstindex(_view):lastindex(_view))

## collect(v)
#view(v, firstindex(v):lastindex(v)) # [1,2,3]
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

"""returns lowerBound set of non-redundant indicies """
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
#---------------------------
#length(inds)

inds2
popat!(inds2, 1)
v
view(v, firstindex(v):lastindex(v))
#TODO: recursive popat!()

#----
#When building lowerBound view, there must be an exact match between items & their indices

#=
unlocks hidden property
vector[lowerBound,lowerBound+1,lowerBound+2], inds=[]
(if lowerBound=0 i.e. vector is lowerBound 0th index)
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
println("pts[1] = lastA= ", pts[1]) #lowerBound
println("pts[2] = lastB= ", pts[2]) #upperBound
#-----
interval = nothing # afterwards, has lowerBound value
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

println("pts[1] = lastA= ", pts[1]) #lowerBound
println("pts[2] = lastB= ", pts[2]) #upperBound

#Generalization:

#while true #Todo: add lowerBound condition

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
    println("pts[1] = lastA= ", pts[1]) #lowerBound
    println("pts[2] = lastB= ", pts[2]) #upperBound
elseif length(_stack) == 1 # last one get lst (ndv )

    #=
    if group == 1 # only 1 per item
        #complete Triad : [lastB, interval[1], interval[2]

        #GET Last upperBound = currentA #pop!
        interval = pop!(_stack)
        #form lowerBound view from lastB, & interval (midpoint newInterval[1] becomes implicit)
        #view(lastB,interval[2])
        _view = view(lastB:interval[2], [lastB, interval[1], interval[2]])

        #create view with points of lastb, lastrange
        # Compare(lowerBound, upperBound, _view) #
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


## pts handling: lowerBound,upperBound points (joined with an original arr )
#goal: to evaluate (some) kernel function with inputs lowerBound,upperBound, arr
#i.e. kernel:trivialPartitionFunction(lowerBound,upperBound )
#   middle(lowerBound,upperBound) #TODO call middle from in : lowerBound,upperBound to all ranges 1st, last


#TODO:
#=
    if group == 1 # only 1 per item
        #complete Triad : [lastB, interval[1], interval[2]

        #GET Last upperBound = currentA #pop!
        interval = pop!(_stack)
        #form lowerBound view from lastB, & interval (midpoint newInterval[1] becomes implicit)
        #view(lastB,interval[2])
        _view = view(lastB:interval[2], [lastB, interval[1], interval[2]])

        #create view with points of lastb, lastrange
        # Compare(lowerBound, upperBound, _view) #
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

    #GET Last upperBound = currentA #pop!
    interval = pop!(_stack)
    #form lowerBound view from lastB, & interal (midpoint newInterval[1] becomes implicit)
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
    # Compare(lowerBound, upperBound, _view) #
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
length(pts) - 1 > 0 ? upperBound = pts[length(pts)-1] : -1 #before the  last (upperBound)
length(pts) - 1 - 1 > 0 ? lowerBound = pts[length(pts)-1-1] : -1 #before the  last (lowerBound)

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

"appends lowerBound scalar value  at the first of lowerBound vector "
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
lowerBound = first(v)
upperBound = last(v)
#v[1],v[2] =  #remap(v[1],v[2]) # 4" 7 -> 1:4 #no remap
# v = collect(lowerBound:upperBound) #first(v):last(v)) #(v[1]: v[2]))
_view = collect(lowerBound:upperBound) |> v -> view(v, firstindex(v):lastindex(v))

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
    Compare(lowerBound,upperBound,_view)
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


#---------------------------

=#

lastB = 1
interval = [2, 3]
println(interval)
lowerBound = interval[1]
upperBound = interval[2]
m = lastB
println("lowerBound, m, upperBound", lowerBound, m, upperBound)
lowerBound, m, upperBound = inferLocation(lastB, interval[1], interval[2])
println("lowerBound, m, upperBound", lowerBound, m, upperBound)

interval = union(lowerBound, m, upperBound)

# lastb = pts[length(pts)-1] #moved out of if scope

_stack = [[1, 3], [4, 7]]

compareTriad(1, 2, 3, [1, 2, 3])


[1 2 3 4] # was typical input
[1 2], [3, 4] # stack input

#=  #TODO:  define middle
    define left (of middle)
    define right (of middle)
    #------
    stack element
   interval[i] = [lowerBound,upperBound]
    interval[i][1] # lowerBound
    interval[i][2] # upperBound


=#
__int = [[4, 7]]
midId = length(__int) // 2
midId = 1
#__int[1][1]
__int[midId][1]# 4
__int[midId][2] # 7

v = collect(__int[midId][1]:__int[midId][2]) #4:7
#view(__int, interval[id][lowerBound]:interval[id][upperBound])


_view = view(v, firstindex(v):lastindex(v))  #__int[1][1]:__int[1][2])  # 4:7

v = collect(__int[1][1]:__int[1][2]) #works  #, __int[1][1]:__int[1][2]) # [4,5,6,7] vector  # 4:7 (wait don;t siklvealready)
view(v, firstindex(v):lastindex(v))   #__int[1][1]:__int[1][2])  # [4,5,6,7] view

#indexOf(v,v[1])
firstindex(v)
length(v)

#v = 4,5,6,7
#make lowerBound view , with lowerBound valid datastructure: vector, with valid mapping (index-1)

n = 1
#_stack[interval[1][lowerBound], interval[1][upperBound]]
collect(interval[1][lowerBound]:interval[1][n])
_stack
#_view = view(_stack, firstindex(v):length(v))  #interval[1][lowerBound]:interval[i][upperBound])
#_view(v, firstindex(v):lastindex(v))   #__int[1][1]:__int[1][2])  #
_view = collect(_stack) |> _view -> view(_view, firstindex(_view):lastindex(_view))




#-------

_stack = [[1, 3], [8, 9]]

id = 1
interval = pop!(_stack)
interval #[1,3]

interval[2]


_int = [[1, 3], [4, 7], [8, 9]] # IF Odd : we only care to get the middle (at the median)
#if length(_int) %2 == 0 # length isEven
idMid = Integer(ceil(length(_int) / 2)) # 2 [casted correctly to 2]

lowerBound = _int[idMid][1]#4
upperBound = _int[idMid][length(_int)-1]#7

## kernelFunction(lowerBound,upperBound, arr)
# id lowerBound,upperBound, interval
#---------
#callCause(idMid, 4, 7, _int) # 4:7
#v = collect(lowerBound:upperBound)
#_view = view(v, firstindex(v):lastindex(v))

_view = collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))

#callCause(idMid, lowerBound, upperBound, _int) # view error # correct # loop infinity  TODO:check

#-------
# DEMO:

_int = [[1, 3], [8, 9]]
pts = []
idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2} #1

lowerBound = _int[idMid][1] #1
upperBound = _int[idMid][length(_int)] #3

lowerBound = _int[idMid+idMid][1] # 8
upperBound = _int[idMid+idMid][length(_int)] # 9

#kernelFunction #1

#----
#Ranges
##[1, 2, 3]
##[3, 4, 5, 6, 7, 8]
#----------
## fill up the stack function
#kernelFunction #2



_stack = []

#from points to interval indices , getting the `Buns`
_length = copy(length(_int))

#=for i in 1:_length
    idMid = Integer(ceil(_length / 2)) # 1 # dof = {1,2}
    # local lowerBound & upperBound
    lowerBound = _int[i][1] #1
    upperBound = _int[i][2] #2
    println("lowerBound = ", lowerBound, " upperBound = ", upperBound)
    push!(_stack, collect((lowerBound:upperBound)))

end
=#

_stack

A = []
#from stack  to point vectors
#= for i in 1:length(_stack)

    #idMid = Integer(ceil(length(_int) / 2)) # 1 # dof = {1,2}

    println("i = ", i)
    lowerBound = firstindex(_stack[i])# [1] # first(i)
    upperBound = lastindex(_stack[i]) #last(_stack[i])[2] #
    #the goal: get lowerBound,upperBound
    #lowerBound =  _int[i][1] #1
    #upperBound = _int[i][2] #2

    println("lowerBound = ", lowerBound, " upperBound = ", upperBound)
    push!(A, collect((lowerBound, upperBound)))
end
=#
_stack
A

#Critical Point  #<------
#= for i in 1:length(_int)
    # push
    lowerBound = _int[i][1] #<------
    upperBound = _int[i][2]
    push!(pts, lowerBound) # every odd has an lowerBound value
    push!(pts, upperBound) # every even has lowerBound upperBound value
end
=#

pts = [] # excellent

ranges = []
ranges = copy(_stack) # stack has to have at least 2 items for proceeding functions to work
typeof(_stack)

#-----#lastB #clue
#=
lowerBound = ranges[1][1]
upperBound = ranges[1][length(ranges[1])] #[2]
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

#= for i in 1:length(ranges) #1:3
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
lowerBound = 8
upperBound = 9

#----- pts manipulation
_view = nothing # val

# mapPts()
_length = length(pts)
if _length == 2

    _view = collect(pts[1]:pts[2]) |> _view -> view(_view, firstindex(x):lastindex(_view))
    swapContent(pts[1], pts[2], _view) #doCompare(pts[1], pts[2], _view)
end

#=
ranges = copy(_stack)
ranges[1]
ranges[2]

lowerBound = ranges[1][1]
upperBound = ranges[1][length(ranges[1])]

a2 = ranges[2][1]
b2 = ranges[2][length(ranges[2])]
=#
#=
#pts to range
for i in 1:Int(length(pts) // 2)
    # push
    lowerBound = pts[i]#[1]
    upperBound = pts[i+1]#[2]
    v = collect(lowerBound:upperBound)
    push!(ranges, v)
end=#

function ptsToRanges(pts)

    #pts to range
    ranges = []
    _length = copy(Int(length(pts) // 2))
    for i in 1:_length
        #was
        #lowerBound = pts[i]#[1]
        #upperBound = pts[i+1]#[2]
        lowerBound = pts[i] # + 1
        upperBound = pts[i+1] #- 1

        v = collect(lowerBound:upperBound)
        push!(ranges, v)

    end
    return ranges #<----
end # <--------


#pts not defined
pts = [1, 2, 3, 4, 5]
a1 = pts[1]#[1] #<----
b1 = pts[1+1]#[2] #correct was lowerBound coincidence #3

a2 = pts[2]#[1]
b2 = pts[2+1]#[2]

#pts[2+1] - 1

#=plan:
pts[2] = 3  #the first point makes lowerBound domino effect for the rest of points

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
""" from lowerBound point to lowerBound View """
function ptToView(singlePt; exceptionParameter = UnexpectedError) # ok

    try
        lowerBound = -1
        upperBound = -1
        _newView = nothing
        if length(singlePt) == 2
            lowerBound = singlePt[1]
            upperBound = singlePt[2]

            _newView = collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        else
            throw(error(msg))
        end

        return _newView
    catch exceptionParameter
        write( msg, exceptionParameter)
        #@error msg exception = (UnexpectedError, catch_backtrace())
    end
    # fabricate view from points only
end


function ptsToViews(pts) # fixed

    _views = []
    #iterating on pts
    #TODO: lowerBound way to concatenate first 2
    _length = copy(Int(length(pts) // 2))
    #_length = length(pts)

    # - -> -(a,b )

    for i in 1:_length
        if -(pts[i], pts[i+1]) > 1
            lowerBound = pts[i]#[1]
            upperBound = pts[i+1]#[2] #<--------
            println("lowerBound = ", lowerBound)
            println("upperBound = ", upperBound)

            interval = lowerBound:upperBound

            #  # [1]:lastindex(v))
            print("v = ", interval)
            #
            # _view = ptToView(interval)
            _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))
            println("_view", _view)
            push!(_views, _view)
        elseif -(pts[i], pts[i+1]) == 1
            _view = collect(pts[i]:pts[i+1]) |> _view -> view(_view, firstindex(_view):lastindex(_view))
            swapContent(pts[i], pts[i+1], _view) # doCompare(pts[i], pts[i+1], _view)
        end
    end
    return _views
end


function ptsToView( lowerBound :: Int64 , upperBound :: Int64 )

    _length = -(lowerBound, upperBound)

    if _length == 0 # lowerBound == upperBound (return either element)
        return lowerBound #getLastElement(lowerBound, upperBound)
    elseif _length == 1 #|| _length == 0
        v = collect(lowerBound:upperBound)

        _view = view(v, firstindex(v):lastindex(v))
        #v1, v2 = remap(v[1], v[length(v)])
        doCompare(lowerBound, upperBound, _view) #view(v[1], v[length(v)]))
    else
        v = collect(lowerBound:upperBound)
        return view(v, firstindex(v):lastindex(v)) # remap(lowerBound,upperBound) #TODO: check usefulness
    end

end


""" transforms points to views,  on lowerBound particular view """
function ptsToViews(pts, _view) # for lowerBound particular view

    _views = []
    #iterating on pts
    _length = copy(Int(length(pts) // 2))
    #_length = length(pts)
    for i in 1:_length

        lowerBound = pts[i]#[1]
        upperBound = pts[i+1]#[2] #<--------
        println("lowerBound = ", lowerBound)
        println("upperBound = ", upperBound)

        interval = lowerBound:upperBound

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

#=note: _view is related to  _stack (item, taken off it )
# i = length(_stack) # last item
=#
# unnamed Function: f1

"""Unnamed function"""
function f1(_stack)

    _length = copy(length(_stack))
    for i in _stack

        if _length > 1
            interval = popat!(stack, i) #interval, each has 2 bounds
            lowerBound = interval[1]
            upperBound = interval[2]

            #TODO: How to check in between the function
            #make view
            # v = collect(lowerBound:upperBound)
            # _view = view(v, firstindex(v: lastindex(v))
            _view = collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #new:pass new info

            return false, _view
        elseif _length == 1
            return true, nothing
        else raise(UnexpectedError)
        end

    end
end


## Event-Driven: f1
"""Event-Driven function """
function f1(_stack, i) # unknown Unamed funtion (yet ) #TODO: rename into lowerBound meaningfulname
    _length = copy(length(_stack))

    #for i in _stack
    if _length > 1 && i <= _length
        interval = popat!(stack, i) #interval, each has 2 bounds
        lowerBound = interval[1]
        upperBound = interval[2]

        #= make view
        #v = collect(lowerBound:upperBound)
        #_view = view(v, firstindex(v: lastindex(v)) #new:pass new info =#
        _view = collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        #TODO: return false, _view [new information ]

        return false, _view
    elseif _length == 1
        return true, nothing
    end
end


# Next Sort
"""Event-driven to sort the next element """
function nextSort( lowerBound :: Int64 , upperBound :: Int64 , _view::SubArray, i) #lowerBound,upperBound, inputs not used #TODO

    vals = []
    i = -(lowerBound, upperBound)
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
        if -(pts[i], pts[i+1]) > 1
            lowerBound = pts[i]#[1]
            upperBound = pts[i+1]#[2] #<--------
            println("lowerBound = ", lowerBound)
            println("upperBound = ", upperBound)

            interval = lowerBound:upperBound
            _view = collect((interval)) |> _view -> view(_view, firstindex(_view):lastindex(_view))
            println("_view", _view)
            push!(_views, _view)
        elseif -(pts[i], pts[i+1]) == 1
            # done: View true form : subView
            swapContent(pts[i], pts[i+1], view(collect(pts[i]:pts[i+1]), firstindex(pts[i]):lastindex([pts[i+1]]))))  # doCompare(pts[i], pts[i+1], view(collect(pts[i]:pts[i+1]), firstindex(pts[i]):lastindex([pts[i+1]])))# fixed
        end

    end
    return _views
end


#Intact
function viewsToPts( _views :: Vector{Vector{Int64}})#::Vector{Vector{Int64}})

    pts = []
    _length = length(_views) # Int(ceil(length(_views) // 2))
    # _length = copy(Int(length(_views) // 2))
    println("_length = ", _length)
    lowerBound = -1
    upperBound = -1
    for i in 1:_length
        #if i + 1 < _length
        lowerBound = _views[i][1]#[1]
        upperBound = _views[i][length(_views[i])]#[2]
        println("lowerBound = ", lowerBound)
        println("upperBound = ", upperBound)

        # end
        #lowerBound = _views[i][1]
        #upperBound = length(_views[i])

        push!(pts, lowerBound)
        push!(pts, upperBound)
    end

    return pts
end


function viewsToPts(arr)#::Vector{Vector{Int64}})

    pts = []
    _length = length(arr) # Int(ceil(length(_views) // 2))
    # _length = copy(Int(length(_views) // 2))
    println("_length = ", _length)
    lowerBound = -1
    upperBound = -1
    for i in 1:_length
        #if i + 1 < _length
        lowerBound = arr[i][1]#[1]
        upperBound = arr[i][length(arr[i])]#[2]
        println("lowerBound = ", lowerBound)
        println("upperBound = ", upperBound)
        # end
        #lowerBound = _views[i][1]
        #upperBound = length(_views[i])

        push!(pts, lowerBound)
        push!(pts, upperBound)
    end

    return pts
end

vals = mapPts(pts, arr, 1) # works

## Demo: rangesToPts - failing
#= #UncommentMe
_int = [[1, 3], [8, 9]]
#typeof(_int)
pts = rangesToPts(_int)# correct order 1389 #  LoadError: BoundsError: attempt to access 2-element Vector{Vector{Int64}} at index [3]
#Hint: this opens the door for lowerBound fine point manipulation
#---pts testing
a1 = pts[1]#[1]
b1 = pts[1+1]#[2] #correct (it was lowerBound coincidence) #3

a2 = pts[2]#[1]
b2 = pts[2+1]#[2]
=#
#----
#=#UncommentMe
_views = ptsToViews(pts)#correct order
length(_views)

#eltype(_views) # Any
typeof(_views[1])
_views[1][1]#1
length(_views[1])#3 # wrong approach

_view = copy(_views[1]) # unhandeled till now
copy(_views[2]) # [5 6 7 8]
_view = [_view] # warning : this Must be implemeneted as lowerBound singleton
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
=#
#vals = mapPts(pts, arr) # Buggy input [requires 3rd parameter: Index ]
#ranges = ptsToRanges(pts) #Bug  # UncommentMe=
#-----------

doCompare(2, 4, [1, 2, 3, 4])

if [1, 2, 3, 4][1] > [1, 2, 3, 4][2]
    m1, upperBound, _isSwapped = doCompare(1, 2, [1, 2, 3, 4])
    println("twinMiddles [m1, m2]= ", m1, " ", upperBound, " swapped ")
end
#m1

# DEMO:
doCompare(1, 4, [1, 2, 3, 4]) # 1 4
lowerBound = 1;
upperBound = 1;

if [1, 2, 3, 4][lowerBound] > [1, 2, 3, 4][upperBound] #<--------
    #lowerBound, upperBound, _isSwapped =
    doCompare(lowerBound, upperBound, [1, 2, 3, 4])
    lowerBound += 1
    upperBound += 1
    println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " swapped ")
else
    println("processing failed ")
end

swapContent(1, 2, [1, 2, 3, 4]) #) # doCompare(1, 2, [1, 2, 3, 4])# 1 2

m1 = 2
if [1, 2, 3, 4][lowerBound] > [1, 2, 3, 4][m1]
    lowerBound, m1, _isSwapped =  swapContent(lowerBound, m1, [1, 2, 3, 4]) #doCompare(lowerBound, m1, [1, 2, 3, 4])
    println(" [lowerBound, m1]= ", lowerBound, " ", m1, " swapped ")
end


#println("lowerBound, m2, upperBound = ", lowerBound, m2, upperBound)

swapContent(3, 4, [1, 2, 3, 4]) # doCompare(3, 4, [1, 2, 3, 4])

m2 = 2 + oneunit(2)
if arr[m2] > arr[upperBound]
    m2, upperBound = swapContent(m2, upperBound, [1, 2, 3, 4])  # doCompare(m2, upperBound, [1, 2, 3, 4])
end

arr = [1, 2, 3, 4]
lowerBound, upperBound, _isSwapped = swapContent(firstindex(1), lastindex(4), arr) #doCompare(firstindex(1), lastindex(4), arr)
lowerBound, m1, _isSwapped = swapContent(firstindex(1), lastindex(2), arr) #doCompare(firstindex(1), lastindex(2), arr)
m1, upperBound, _isSwapped = swapContent(firstindex(2), lastindex(4), arr) # doCompare(firstindex(2), lastindex(4), arr)
m2, upperBound, _isSwapped = swapContent(firstindex(3), lastindex(4), arr) # doCompare(firstindex(3), lastindex(4), arr) #<------

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

if (interval === nothing) == false #ismissing(interval) ==false #i.e. has lowerBound value  #interval !== nothing # on the 2nd, 4th , every even Run # if it has lowerBound value (from previous run) # interva==nothing
    oldInterval = interval # store value
end

interval
oldInterval

##(oldInterval[1], interval[2])
#oldInterval === nothing
#interval === nothing
#interval == oldInterval
#pop the first value (load onto interval)
#pop()
#--
_first = 1
_second = 2
_third = 3

#create lowerBound view
_view = collect(1:3)
_view = view(_view, firstindex(_view):lastindex(_view))

#pass to function in question
compareTriad(_first, _second, _third, _view) #<-----

#-----
## An example Experiment:

interval = popfirst!(_stack) # sequential pop of lowerBound stack  # popped value is lost #  decreases _stack by 1
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

#_view = collect(lowerBound:m1) |>
#suggest: use lowerBound, upperBound as bounds of the current _view
_view = view(_view, firstindex(_view):lastindex(_view))

lowerBound, m1, _isSwapped = doCompare(lowerBound, m1, _view) # <----

println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")
mid = m1 + 1
v = collect(mid:upperBound)
_view = view(_view, firstindex(v):lastindex(v))  # (_view, _view)


# mid, upperBound, _isSwapped = mid < upperBound && length(_view)>1 ?
if mid < upperBound && length(_view) > 1
    println("mid = ", mid)
    println("upperBound = ", upperBound)
    println("_view = ", _view) # [3, 4] #note : difference  = 4 -3 = 1 # infer: missing functionality for d=1
    mid, upperBound, _isSwapped = doCompare(mid, upperBound, _view) #: return  #doCompare(m1, upperBound, _view) #<-------
end


oldInterval = collect(1:3)
_view1 = view(v, firstindex(v):lastindex(v)) # 1 7 # <---------
#lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, _view) #correct # 1 7 3 4  TODO: # UncommentMe
# compareTriad Error

#try
if lowerBound !== Nothing && m1 !== Nothing && upperBound !== Nothing && arr !== Nothing

    _isSwapped = nothing
    ##_view = collect(lowerBound:m1) |>
    #suggest: use lowerBound,upperBound as bounds of the current _view
    lowerBound != upperBound ? _view = view(_view, firstindex(lowerBound):lastindex(upperBound)) : return "lowerBound == upperBound scalar: lowerBound = ", lowerBound, " upperBound = ", upperBound

    # 1,2,3  d(1,3)+1 =4 /2 = 2 IS EVEM lowerBound, m1, m2

    if isEven(lowerBound, upperBound) == true #TODO: isEven lowerBound, m1, m2 : (lowerBound,m1] mid=m1+1

        if lowerBound != m1 # fail-safe mechanism
            lowerBound, m1, _isSwapped =  swapContent(lowerBound, m1, _view) #doCompare(lowerBound, m1, _view) # [lowerBound, m1]= 1 2 checked
            println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")
        elseif lowerBound == m1 # fallback
            lowerBound, m1, _isSwapped = lowerBound, m1, nothing
        end
        ## lowerBound, m1, _isSwapped = doCompare(lowerBound, m1, _view) # [lowerBound, m1]= 1 2 checked  # <-----
        #println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")

        mid = m1 + 1
        if mid != upperBound  #TODO: needs an end
            _view = collect(mid:upperBound) # |>
            _view = view(_view, firstindex(_view):lastindex(_view))  # (_view, _view)
            # mid, upperBound, _isSwapped = mid < upperBound && length(_view)>1 ?

            if mid < upperBound && length(_view) > 1 # this condition should be global
                mid, upperBound, _isSwapped = swapContent(mid, upperBound, _view) # doCompare(mid, upperBound, _view) #: return  #doCompare(m1, upperBound, _view) #<-------
                if mid != upperBound # where it fails
                    mid, upperBound, _isSwapped = swapContent(mid, upperBound, _view) # doCompare(mid, upperBound, _view) # [lowerBound, m1]= 1 2 checked
                else # fallback
                    mid, upperBound, _isSwapped = 1, 1, nothing
                end
            end
        elseif mid == upperBound #lowerBound , m1, upperBound

                ##if isEven()
                #=
                #else
                if lowerBound != m1  #m1 == upperBound  # was m ==upperBound : m undefined
                    println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")
                    v = collect(lowerBound:upperBound)
                    _view = view(v, firstindex(v):lastindex(v))

                elseif lowerBound == m1
                    println("twinMiddles [m1, upperBound]= ", m1, " ", upperBound, " checked ")
                end
                if m1 != upperBound
                    v = collect(lowerBound:upperBound)
                    _view = view(v, firstindex(v):lastindex(v))
                elseif m1 != upperBound
                    println("twinMiddles [m1, upperBound]= ", m1, " ", upperBound, " checked ")
                end
                =#
            #   end
        end
        else
             raise(exceptionParameter)
        end

    #Fail_safe mechanism applied :
    if lowerBound != upperBound
        v = collect(lowerBound:upperBound)
        _view = view(v, firstindex(v):lastindex(v))  #_view -> view(_view, firstindex(lowerBound): lastindex(upperBound))
        #   if lowerBound != upperBound
        lowerBound, upperBound, _isSwapped = doCompare(lowerBound, upperBound, _view) # < -----
    else # lowerBound == upperBound fallback
        lowerBound, upperBound, _isSwapped = lowerBound, lowerBound, nothing
    end
end


println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " checked ")
println("lowerBound, m1, upperBound = ", lowerBound, m1, upperBound)
if lowerBound === nothing || upperBound === nothing || m1 === nothing
    return nothing, nothing, nothing
else
    return lowerBound, upperBound, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]

end

#TODO: Replace with `compareTriad()` for lowerBound's `_view`

group = 2

## if group == 2 #,-----

#= if so compare contents then, reset group
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
    _first, _second, _third = inferLocation(oldInterval[2], interval[1], interval[2]) # sorts lowerBound 3 points
    unifiedPts = union(_first, _second, _third)
    #v = collect(1:length(totalSet))
    v = collect(first(unifiedPts):last(unifiedPts))

    _view = collect(_first:_third)

    _view = view(v, firstindex(v):lastindex(v))
    _view = view(_view, firstindex(_view):lastindex(_view)) #collect(v), 1:length(v))
    # lowerBound, upperBound, m1, m2 = compareBounds(_first, collect(_second:_third), _view) # compare interval bounds  # <---
    # lowerBound, upperBound, m1, m2 = compareBounds(_first, _second, _third, _view)

    #_first, _second, _third = inferLocation(_first, _second, _third) # valid output
    #check values:
    println("first = ", _first)
    println("second = ", _second)
    println("third = ", _third)
    unifiedPts = union(_first, _second, _third)

    v = collect(first(unifiedPts):last(unifiedPts))
    _view = view(v, firstindex(v):lastindex(v))

    lowerBound, upperBound, m1, m2 = compareTriad(_first, _second, _third, _view) #<---- handling scalar i.e. 1,1 # still unhadeled
    println("lowerBound = ", lowerBound, " upperBound = ", upperBound, " m1 = ", m1, " m2 = ", m2)
    group = 0 # reset group
end
=#
#---
# if m1 not defined!

m1 = 1 # when m1 = 1 ( lowerBound = 1 = m1 )

#experimental : compareTriad()

_isSwapped = nothing

# fail_safe mechanism
if lowerBound != m1
    v = collect(lowerBound:m1)
    _view = view(v, firstindex(v):lastindex(v)) # 0
else #lowerBound == m1 scalar situation
    _msg = "lowerBound == upperBound scalar situation: lowerBound = ", lowerBound, " upperBound = ", upperBound
    print(msg)

end

#_view = collect(lowerBound:m1) |>

#Suggest: use lowerBound,upperBound as bounds of the current _view
# fail_safe mechanism
_msg = "lowerBound == upperBound scalar situation: lowerBound = ", lowerBound, " upperBound = ", upperBound
#lowerBound != upperBound ? _view = view(_view, firstindex(lowerBound):lastindex(upperBound)) : return _msg  # lowerBound = 1 , upperBound = 1  #scalar  3

if lowerBound != upperBound
    v = collect(lowerBound:upperBound)
    _view = view(_view, firstindex(v):lastindex(v)) #firstindex(lowerBound):lastindex(upperBound)) # lowerBound = 1 , upperBound = 1  #scalar  3 # access 0ement at index 1:1] or no method matching iterate (:Nothing )
else # lowerBound == upperBound # fsll
    println(_msg)
    return lowerBound, upperBound, nothing
end

#m1 is given by input parameter
print(lowerBound)
#if m1 !== Nothing
if lowerBound != m1 # where it had a hiccup
    lowerBound, m1, _isSwapped = swapContent(lowerBound, m1, _view) #doCompare(lowerBound, m1, _view) # [lowerBound, m1]= 1 2 checked
else # fallback
    lowerBound, m1, _isSwapped = 1, 1, nothing
end
#<----- #scalar has to skip doCompare : 1,1,nothing

println(" [lowerBound, m1]= ", lowerBound, " ", m1, " checked ")

mid = m1 + 1
print(upperBound)# 2 # issue: m1: upperBound => 2:3
_view = collect(mid:upperBound) # |>
_view -> view(_view, firstindex(mid):lastindex(upperBound))  # (_view, _view)


# mid, upperBound, _isSwapped = mid < upperBound && length(_view)>1 ?
if mid < upperBound && length(_view) > 1
    mid, upperBound, _isSwapped = doCompare(mid, upperBound, _view) #: return  #doCompare(m1, upperBound, _view) #<-------
else
    return

    println("twinMiddles [m1, upperBound]= ", m1, " ", upperBound, " checked ")

    _view = collect(lowerBound:upperBound) # |>
    _view = _view -> view(_view, firstindex(lowerBound):lastindex(upperBound))
    lowerBound, upperBound, _isSwapped = swapContent(lowerBound, upperBound, _view) #doCompare(lowerBound, upperBound, _view)
    println(" [lowerBound, upperBound]= ", lowerBound, " ", upperBound, " checked ")

    println("lowerBound, m1, upperBound = ", lowerBound, m1, upperBound)
    if lowerBound === nothing || upperBound === nothing || m1 === nothing
        return nothing
    else
        return lowerBound, upperBound, m1 # BoundsError: attempt to access 0-element Vector{Any} at index [1]
    end
end



#arr = collect(1:9) #1:9
group
_length # 3
#decrement _length # end of current loop
_length -= 1 # decrement length (_stack ) at end (or on each time measure _stack , no
#continue applying this logic, becuase there's lowerBound logical check up ahead about current length ) - more practical
#end
#at the end i.e. _length == 0
_length#2

#lastB #7 # 1 3
#interval[2]#3
interval #1 3
oldInterval
lastB = interval[2]

##v
#_view = collect(v, (lastB:interval[2]))
#_view = collect(v, lastB:interval[2])
#_view = collect( lastB:interval[2],v) # false
#collect(lastB, interval[2])

v = collect((lastB:interval[2]))

#if length(v ) == 1 #TODO: if scalar, Then return
# _view = view(v, firstindex(v): lastindex(v))

unifiedPts = union(lastB, interval[1], interval[2])
v = collect(first(unifiedPts):last(unifiedPts))
#_view = collect(lastB:interval[2])  # |>
# _view=  view(_view, firstindex(_view):lastindex(_view))

_view = view(v, firstindex(v):lastindex(v))  #view(v,firstindex(v):lastindex(v))

print(_view) # 7 8 9 #TODOD: it should be 7 8 9 (Got only 5 !)

#v[1], v[2], [v3] # indices : 1 2 3
#lowerBound, upperBound, m1 = compareTriad(v[1], v[2], v[3], _view)

# TODO: check if v is scalar (and check if v is empty = [])
if v == []
    #return # do nothing , as no data exist
else
lowerBound = indexOf(v, v[1]) # LoadError: BoundsError: attempt to access 0-element Vector{Int64} at index [1]
m1 = indexOf(v, v[2])
upperBound = indexOf(v, v[3])
lowerBound, upperBound, m1 = compareTriad(lowerBound[1], m1[1], upperBound[1], _view)
oldInterval
interval
end


#TODO: report back new information ( _view ) to its function
if group == 1 && _length == 0 #i == _length - 1 # && reached the end i.e.  #<------

    #issue: previous value (of _stack)
    #lastB = getlastB(_stack)
    lastB = oldInterval[2]

    ## lastB with interval[2]
    #compareTriad(lastB,interval[1], interval[2]) #TODO: store return
    #points : lastB, interval[2]
    #compare() # compareTriad  : lastB , interval[1], interval[2]
    #generate _view : from lastB to interval[2]

    ## make lowerBound view()
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
        lowerBound, upperBound, m1 = res #unzip res
        return lowerBound, upperBound, m1, _view
    end
    #  return lowerBound, upperBound, m1
end


#----------
## Comparing two intervals of lowerBound stack

function compareIntervals( _stack, _newView :: SubArray , interval, group=0 ) # _view)#misspecification error  # TODO:

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
        if (interval === nothing) == false #ismissing(interval) ==false #i.e. has lowerBound value  #interval !== nothing # on the 2nd, 4th , every even Run # if it has lowerBound value (from previous run) # interva==nothing
            oldInterval = interval # store value
        end

        interval = pop!(_stack) # sequential pop of lowerBound stack
        #-----
        group += 1
        # _view = NewView(oldInterval[1], interval[2])

        unifiedPts = union(min(first(oldInterval), first(interval)),
            max(last(oldInterval), last(interval)))

        v = collect(first(unifiedPts):last(unifiedPts)) #oldInterval[1]:interval[2])# 1 7
        _view = view(v, firstindex(v):lastindex(v)) # (oldInterval[1]:interval[2]))

        lowerBound, upperBound, m1, m2 = compareBounds(first(unifiedPts), last(unifiedPts), _view)
        return lowerBound, upperBound, m1, m2
        #------
        if group == 2
            # if so compare contents then, reset group

            #TODO: define _newView (from)

            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
            return lowerBound, upperBound, m1, m2
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
        #make lowerBound view (with lowerBound proper remapping )

        lowerBound = indexOf(v, v[1])
        m1 = indexOf(v, v[2])
        upperBound = indexOf(v, v[3])
        lowerBound[1], upperBound[1], m1[1] = inferLocation(lowerBound[1], m1[1], upperBound[1])
        lowerBound, upperBound, m1 = compareTriad(lowerBound[1], m1[1], upperBound[1], _view)

        #-----
        group = 0
        return lowerBound, upperBound, m1
    end
end

function compareIntervals(_stack, _newView :: SubArray, interval = nothing , group=0, i=0) # _view)#Misspecification error  # TODO:

    #0. Init
    #= group = 0
    # interval = nothing
    # oldInterval = nothing
    #if _length === nothing =#
    _length = copy(length(_stack))
    #end

    #1. Check is nothing
    if i === nothing
        i = 1
    end
    #for _ in 1: _length #length(_stack)  #_view)
    if i <= _length - 1
        group += 1
        #do
        if interval !== nothing # on the 2nd, 4th , every even Run # if it has lowerBound value (from previous run)
            oldInterval = interval # store value

        end
        interval = pop!(_stack) # sequential pop of lowerBound stack

        if group == 2
            # if so, compare contents then, reset group number

            #TODO: define _newView (from)

            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
            return lowerBound, upperBound, m1, m2
        end
    end

    #finally last check if group = 1
    _newView = NewView(1, _length - 1) #<--------------
    compareIntervals(_stack, _newView)
    if group == 1

        lastB = getlastB(_stack)

        ##Union()
        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]
        union_old = union(min(oldInterval[first(oldInterval)]), oldInterval[lastindex(oldInterval)]) #a1,b1
        union_new = union(min(interval[firstindex(interval)]), interval[lastindex(interval)]) # a2, b2
        unifiedPts = union(min(first(union_old), first(union_new)), max(last(union_old), last(union_new)))

        #Golden line:
        v = collect(first(unifiedPts):last(unifiedPts))
        _newView = view(v, firstindex(v), lastindex(v)) # _newView = view(lastB:interval[2], (lastB, interval[2]))

        # compareTriad
        lowerBound, upperBound, m1 = compareTriad(lastB, interval[1], interval[2], _newView) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
        group = 0
        return lowerBound, upperBound, m1
    end
end

#Vectorize interval (or extern interval to include rationals (indicies) between first & last bound)
#interval = collect(first(interval):last(interval))

function compareIntervals( _stack, _newView ::SubArray , interval, group :: Int64 =0 ) # _view)#misspecification error  # TODO: utilize _newView

    # group = 0
    #interval = nothing
    #oldInterval = nothing

    if _length === nothing

        _length = copy(length(_stack))
    end
    if i === nothing
        i = 1
    end

    for _ in 1:length(_stack)  #_view (?)
        group += 1
        #do
        if (interval === nothing) == false #ismissing(interval) ==false #i.e. has lowerBound value  #interval !== nothing # on the 2nd, 4th , every even Run # if it has lowerBound value (from previous run) # interva==nothing
            oldInterval = interval # store value
        end

        interval = pop!(_stack) #1. sequential pop of lowerBound stack
        #2. vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)
        interval = collect(first(interval):last(interval))

        v = collect(first(interval):last(interval))
        _newView = view(v, firstindex(v), lastindex(v))

        #-----
        group += 1
        # _view = NewView(oldInterval[1], interval[2])
        v = collect(oldInterval[1]:interval[2])# 1 7
        _view = view(v, firstindex(v):lastindex(v))

        lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, _view)
        #------
        if group == 2
            # Union()
            # if so compare contents then, reset group

            #TODO: define _newView (from combb) # done
            union_old = union(min(oldInterval[firstindex(oldInterval)]), oldInterval[lastindex(oldInterval)]) #a1,b1
            union_new = union(min(interval[firstindex(interval)]), interval[lastindex(interval)]) # a2, b2
            unifiedPts = union(min(first(union_old), first(union_new)),
                max(last(union_old), last(union_new)))
            v = collect(first(unifiedPts):last(unifiedPts))
            _newView = view(v, firstindex(v), lastindex(v))
            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
        end
    end
    _length -= 1
    #decrement by 1#finally last check if group = 1
    if group == 1 && _length == 0 #i==_length-1 # && reached the end i.e.


        lastB = getlastB(_stack)

        #compare() # compareTriad  : lastB , interval[1], interval[2]
        #generate _view : from lastB to interval[2]

        unifiedPts = union(min(lastB:interval[1]), max(lastB:interval[2]))
       v = collect(firstIndex(unifiedPts):lastindex(unifiedPts))
        _newView = view(v, firstindex(v):lastindex(v))#lastB:interval[2], (lastB, interval[2]))

        ##    _newView = newView(lastB, interval[2])
        #Compare() # compareTriad #Erroneous  #TODO:fix#-----
        #make lowerBound view (with lowerBound proper remapping )

        lowerBound = indexOf(v, v[1])
        m1 = indexOf(v, v[2])
        upperBound = indexOf(v, v[3])
        lowerBound, upperBound, m1 = compareTriad(lowerBound[1], m1[1], upperBound[1], _view)

        #-----
        group = 0
        return lowerBound, upperBound, m1
    end
end

## compareIntervals, of lowerBound `_stack`, lowerBound  view `_newView`, an `interval`` , lowerBound  `group` & an index `i`

function compareIntervals( _stack, _newView::SubArray, interval=nothing, group=0, i=0 ) # _view)#Misspecification error  # TODO:

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
        if interval !== nothing # on the 2nd, 4th , every even Run # if it has lowerBound value (from previous run)
            oldInterval = interval # store value

        end
        interval = pop!(_stack) #1. sequential pop of lowerBound stack

        #vectorize interval (or extern interval to includ rationals (indicies) between first & last bound)

        interval = collect(first(interval):last(interval))

        if group == 2
            # if got 2 groups, compare contents then, reset group

            #TODO: define _newView (from)
            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, _newView)

            group = 0
            return lowerBound, upperBound, m1, m2
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
        lowerBound, upperBound, m1 = compareTriad(lastB, interval[1], interval[2], _newView) #_newView[lastB] > _newView[interval[2]] ? compareTriad(lastB, interval[1], interval[2], _newView) : return
        group = 0
        return lowerBound, upperBound, m1
    end
end


#= #check inputs #--------------
  _stack
  interval = nothing
  compareIntervals(_stack, _View, interval, oldInterval, group, _length)
  compareIntervals(_stack, arr, 1) # compile error
=#
# compareIntervals
## compareIntervals, of lowerBound `_stack` & vector array `arr`

function compareIntervals( _stack, arr :: Array{Int64,1} ) #vital
    group = 0
    interval = nothing
    oldInterval = nothing
    lowerBound = -1
    upperBound = -1
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
            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, arr) #<-----
            group = 0
            return lowerBound, upperBound, m1, m2
        end
    end

    #finally last check: if group = 1
    if group == 1

        lastB = getlastB(_stack) # TODO:
        #interval
        lowerBound, upperBound, m1 = arr[lastB] > arr[interval[2]] ? compareBounds(lastB, interval[1], interval[2], arr) : return #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr
        group = 0 # reset group
        return lowerBound, upperBound, m1
    end
    _newView = NewView(1, i)
    compareIntervals(_stack, _newView)
end


_stack
length(_stack)

## compareIntervals, of lowerBound `_stack`, lowerBound  vector array `arr`, & an index `i`


function compareIntervals( _stack, arr :: Array{Int64,1}, i :: Int64;exceptionParameter = UnexpectedError ) #vital #compiles

    group = 0
    interval = nothing
    oldInterval = nothing
    lowerBound = -1
    upperBound = -1
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
            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, arr)
            group = 0
            return lowerBound, upperBound, m1, m2
        end

    end
    #  _newView = view(1, _length)
    newView
    print(_length)
    _newView = collect(1:_length) |> _view -> view(_view, firstindex(_view):lastindex(_view))
    ## return compareIntervals(_stack,_newView)
    ## finally last check if group = 1
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
            lowerBound, upperBound, m1 = res
            #return nothing
            return lowerBound, upperBound, m1
        elseif res === nothing
            return
        else
            raise(exceptionParameter)
        end
        ## lowerBound, upperBound, m1 = res
        #group = 0 # reset group
        ## return lowerBound, upperBound, m1
    end

    i = i + 1
    compareIntervals(_stack, _newView, i) #ok
end

## compareIntervals, of lowerBound `_stack`, lowerBound  vector array `arr`, lowerBound group number `group` , & an index `i`

function compareIntervals( _stack, arr :: Array{Int64,1}, interval=nothing, group=0, i=0 :: Int64 ) #vital #compiles  ## oldInterval=nothing [removed]

    # group = 0
    # interval = nothing
    # oldInterval = nothing
    lowerBound = -1
    upperBound = -1
    m1 = -1
    m2 = -1
    _length = copy(length(_stack))

    #  i += 1  #1 increment
    if i == 1 # length(_stack) #- 1
        return
    else
        # for _ in 1:length(_stack)
        group += 1
        #do
        if interval !== nothing
            oldInterval = interval # the issue: inside the if  oldInterval cannot be [...]
        end
        interval = pop!(_stack) # 1. pop the next _stack iterm , get interval bounds
        #2. vectorize interval (or extern interval to include rationals (indicies) between first & last bound)

        interval = collect(first(interval):last(interval))

        if group == 2
            # if so,  then, reset group
            lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, arr)
            group = 0
            return lowerBound, upperBound, m1, m2
        end
                #finally call next subarray [subView]
    end

    #  _newView = view(1, _length)
    length(arr)
    newView
    print(_length)

    # _newView = view(v, i)
    #return compareIntervals(_stack,_newView)
    #finally last check if group = 1
    if group == 1 # done

        lastB = getlastB(_stack)
        #interval
        lowerBound, upperBound, m1 = compareBounds(lastB, interval[1], interval[2], arr) #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr
        group = 0 # reset group
        return lowerBound, upperBound, m1
    end
    i = i + 1
    v = collect((1:_length-1))
    #_newView = view(v, i)
    _newView = view(v, (1:_length-1)) #length(arr - 1))
    return compareIntervals(_stack, _newView)
end


_stack
_stack = [[1, 3], [4, 7], [8, 9]]
## compareIntervals([[1, 3], [4, 7], [8, 9]], arr, 1) # UncommentMe
#view(v,(1, 3))
#ERROR: LoadError: BoundsError: attempt to access 1-element Vector{Vector{Int64}} at index [0]
# A = compareIntervals(_stack, arr, i)
#---------
# Experiment
# say on the stack have the following indicies (output of lowerBound custom partition function )
#checked(#1)
group = 0 # count groups (we got to have some form of group `structure` )
interval = nothing
oldInterval = nothing
lowerBound = -1
upperBound = -1
m1 = -1
m2 = -1
#for _ in 1:length(_stack)
_length = copy(length(arr))

i = 1 # inialize i to 1
if i <= _length - 1
    group += 1 # increment group

    #do
    if interval !== nothing # if interval has lowerBound value
        # store it to oldInterval
        oldInterval = interval
    end

    interval = popfirst!(_stack) #next, pop the first  interval item, on _stack
    # build lowerBound vectorized version of an interval

    interval = collect(first(interval):last(interval))

    if group == 2
        ## if so  then, `reset group`
        ## or call `compareQuartet`
        lowerBound, upperBound, m1, m2 = compareBounds(oldInterval, interval, arr) #<-----
        group = 0
        return lowerBound, upperBound, m1, m2
    end
end

#Finally: last check if group = 1
#=UncommentMe
if group == 1 # done

    lastB = oldInterval[2] #getlastB(_stack) # TODO:check
    #interval
    make
    lowerBound, upperBound, m1 = compareBounds(lastB, interval[1], interval[2], arr) #arr[lastB] > arr[interval[2]] ?  : return #compareTriad(lastB, interval[1], interval[2], arr) # updates are Reflected on the arr
    group = 0 # reset group
    return lowerBound, upperBound, m1
end
=#

_view = union(min(lastB, interval[1], interval[2]), max(lastB, interval[1], interval[2])) |> _view -> view(_view, firstindex(_view):lastindex(_view)) #TODO: please Check

interval# 4, 7
oldInterval#1, 3
#---------
A
_stack = [[1, 3], [4, 7], [8, 9]]
res
#res = compareIntervals(_stack, arr, i) #removed
res

arr
# res = compareIntervals(_stack, arr, i + 1)
# 7, 9, 8, 4  lowerBound,upperBound ,m1, m2 ; should've been 1, 9,
res
arr
_stack #stack should be nothing
print(res)
# missionAccomplished  - for

#---------------------------------
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

#TODO: how to get upperBound of previous interval? make getB

#----------------------------

#extremely experimental functions  # vital
"""Event-Driven: compares lowerBound bounds in ranges of lowerBound Vector arr """
function boundComparisonCondition(ranges, _view, i; exceptionParameter = UnexpectedError)

    try

        _last = copy(length(ranges))
        lowerBound = max(ranges[i-1][_last])
        upperBound = min(ranges[i][1])
        contentSwapped = nothing
        if i >= 1 && lowerBound < upperBound # max(lastRange) # if i>=1

            lowerBound, upperBound, contentSwapped = doCompare(lowerBound, upperBound, _view)
            #return lowerBound, upperBound, contentSwapped
        else
            raise(exceptionParameter)
        end

        lowerBound, upperBound, contentSwapped
    catch exceptionParameter
        writeError( msg, exceptionParameter)
    end
end

# max(ranges[i][2]) # ,ranges[i][1]) # UncommentMe
# upperBound = min(ranges[i][1])

_last = copy(length(ranges) - 1)

# ranges on lowerBound list

#----
lowerBound = m2 + 1;
upperBound = upperBound - 1;
#-----
res = nothing


# Demo: on using `isEndReached` (at the end)
if -(lowerBound, upperBound) == 1 #(m2, upperBound) == true # compilese
else
    return false
end

#Demo:
isEndReached(1, 1)
isUnitDistanceReached(1, 2)
isUnitDistanceReached(1, 1)
# CompareSort(1, 3, [1, 2, 3]) = # returns answer (with error ) # TODO: fix `last`
