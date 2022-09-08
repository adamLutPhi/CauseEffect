#=
lessons learned
"all your actions go right between the Idealized & the Materialized"

---
1.   view(collect(1:5),1:5)  #correct syntax
view(collect(a:b),a:b)  #correct syntax
in general
    view(arr,1:5) or  view(arr,a:b)


2. when error throws a `MethodError`: no method matching iterate(::Nothing) iterate('nothing')
    it's like saying, WARNING: there is a `Hidden issue` that you have Overseen
    like a `function call`, with a `Missing Function` (user forgot to get compiled)

3. MethodError: no method matching !(::Int64)

    !(a >= b) no such operator composition (not less than (or greater than))
    just revert the `bounds` manually
    (a <= b)

4. StackOverflowError: severe Error with unclear reasoning: missing 1 (or more) conditions(s) without a returning argument

5. BoundsError: attempt to access 2-element view(::Vector{Int64}, 1:2) with eltype Int64 at index [5:9]
possible 2 composed views (subarray of another subarray) whereas answer expects only 1 view (subarray)

# BoundsError: attempt to access 2-element view(::Vector{Int64}, 1:2) with eltype Int64 at index [1:5]
the problem is with the provided `bounds`
1.Update:
1.1. mabe they aren't updated: needs continual update
1.2. maybe they are wrongly updated: needs to redo each bound of each view
1.3. the currently passed a view, instead of intended subview


6. #`BoundsError`: attempt to access 4-element Vector{Int64} at index [1:5]:
Problem Definition : Given bounds exceed the  actual array size

Note: 5 & 6 are have the same problem domain, but with different scenario implementation
& with the same solution
solution: check input arguments(bounds) are less than (or equal to) input vector array

 #`BoundsError`: attempt to access 4-element Vector{Int64} at index [1, 4]
        #remapping problem  #subtle-issue why: because of an update on (1 of the ) bounds

 solution:
        b = euclidDist(a,b) + 1
        a = 1
        #create a new view with a,b

7. ERROR: Bound sError: attempt to access 9-element Vector{Int64} at index [1, 5]
Go with the hunch on this one:
Reason : observed b is set to 9 (outside the scope of this function)
Problem's region is outside the function boundaries

passed
8. ERROR: `BoundsError`: attempt to access 3-element view(::Vector{Int64}, 1:3) with eltype Int64 at index [1, 2]

first: it has reached its terminus as euclidDist(1,2) = 1
instead of terminating
it throws a boundError

9. `BoundsError`: attempt to access 1-element view(::Vector{Int64}, 1:1) with eltype Int64 at index [1:2]

Answer: it's a scalar: scalar handling when a-b=0 <=> a=b

10. BoundsError: attempt to access 1-element view(::Vector{Int64}, 1:1) with eltype Int64 at index [1:2]
first index [1:2] has a=1 , b=2 , dist = b-a = 1 # check euclidDist(a,b) =

Solution:
#try#1: correct misspecified function arguments: adds type for arr::Array{Int64,1}
REVEALED A GIGANTIC ISSUE If left Uncorrected
For functions arr , _view
(bef    ore: compiler has been thinking  they are the same 1 function(view & arr are same) , after correction, they are 2 expected functions [as Expected] (view, arr are different ))

BoundsError: attempt to access 1-element view(::Vector{Int64}, 1:1) with eltype Int64 at index [1:2]

twinMiddles [m1, m2]= [1, 1]
local sorting finished successfully of sorting _view:
[1]
....
b =1
a =1 b =2

Seeing enough evidence: I became sure the error is after merging m1 m2 as one Unity
as it's forgot to autoadjust, on the interval m2:b:
m2 -= 1 ; b -= 1



=#

import Utils: lineLengthAcceptable
import Base: @propagate_inbounds
Middles = []
offset = 1
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

#=Recursive code  #uncommentMe at end
nNodes = length(arr) - 2 # 2: for a & b count - explorable nodes see length(arr) -2 -1
if nNodes == 0 #offest - 1
    return #0
elseif nNodes == 1 #nVertices() == 1 (couple, pair)
    doCompare(a, b)
    return #0
elseif nNodes > 1
    stoppingCondition = copy(isStop(a,b,view(_view,a,b))) # isStop(a,b,view(_view,a:b))
    #isStop = copy(isStop(1, 4, [2, 1, 3, 5]))
    # if stoppingCondition == false
    #     if checkCond # checkCond(a,m1, m2, b, isWhole, arr)
    effect(a, b, view(arr, a, b - offset)) # nNodes = length(arr)-2 -1 (offset)
    #else #on its own does nothing

end
#end
=#
""" if m is bi-valued, unpack it """
function unpackM(m)
    _m1 = 0
    _m2 = 0
    try
        if m !== 0
            _m1 = m[1]
            _m2 = m[2]
        elseif m == 0
            _m1 = 0
            _m2 = 0
        else
            throw(error("Unexpected error occured"))
        end
        return _m1, _m2
    catch UnexpectedError
        @error "Unexpected Error occured" exception(UnexpectedError, catch_backtrace())
    end

end

"""From the content, get its index, compareContents & swap them accordingly"""
@inline function swapContent(aContent, bContent, _view) #TODO: check?

    a = findall(x -> x == aContent, _view)
    # a = a[offset] #ok, but it's offset dependent
    a = firstindex(a) #a[firstindex(a)] #always yields the right choice


    b = findall(x -> x == bContent, _view)
    # b = copy(b[length(b)])
    b = lastindex(b) #b[lastindex(b)]

    if aContent > bContent
        _view[a], _view[b] = _view[b], _view[a] #swap
        contentSwapped = true
        println(_view[a], " ", _view[b], " ", contentSwapped)

    elseif aContent < bContent

        contentSwapped = false
        println(_view[a], " ", _view[b], " ", contentSwapped)

    elseif aContent == bContent
        #personal preference solution , the first one close to lower bound  is at first

        contentSwapped = false
        println(_view[a], " ", _view[b], " ", contentSwapped)

    end

    return a, b, contentSwapped #returns index

end

#=
acontent = ar[1]
bcontent = ar[2]

if bcontent> acontent
    swapContent(acontent, bcontent,ar)
end

=#
#index, value space  [vital]



@inline function doCompare(a, b, _view) #TODO: check?

    _length = copy(length(_view)) #ok
    #a <= _length && b <= _length && a >= 0 && b >= 0
    if lineLengthAcceptable(a,b,_length) == true
        aContent = _view[a] #view(_view, a) #arr[a]
        bContent = _view[b] #view(_view, b) #arr[b]

        contentSwapped = nothing

        if aContent > bContent # arr[a] > arr[b]

            a,b,contentSwapped = swapContent(_view[a], _view[b], _view)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap

        elseif aContent > bContent
            #do nothing
            contentSwapped = false
        end
        return a, b, contentSwapped
    end
end
arr
arr[length(arr)]

#index, value space  [vital]
@inline function doCompare(a, b, arr::Array{Int64,1}) #works
    #[1...8] length = 8+1 -1 = 8

    _length = copy(length(arr))

    if lineLengthAcceptable(a,b,_length) == true #a <= _length && b <= _length # && b >= m2
        aContent = arr[a] #<-------
        bContent = arr[b]

        contentSwapped = nothing
        # try
        # Base.@propagate_inbounds
        if aContent > bContent # arr[a] > arr[b]
            #Base.@propagate_inbounds
            a,b,contentSwapped = swapContent(arr[a], arr[b], arr)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap
            #contentSwapped = true   #arr[a], arr[b]
        #Base.@inbounds

        elseif aContent < bContent  # arr[a] < arr[b] #review#1 #<-----
            #don't swap # return values
            #  return
            contentSwapped = false #arr[a], arr[b]
        #@inbounds a[st], a[ed] = a[st] , a[ed]        #an inbounds swap

        elseif aContent == bContent # arr[a] == arr[b] #contents the same Can increase the count (in a dictionary?)
            #a<b Always
            #   if a < b
            contentSwapped = false  #arr[a], arr[b]
            #do nothing
            #else?
        end
        #catch UnexpError #<--- exception: Caught: check for euclidDist above the scope of this function
        #    @error "ERROR:UnexpError " exception = (UnexpError, catch_backtrace())
        #end
        return a, b, contentSwapped #arr[a], arr[b]
    end
end


""" input vector array , applys view  on each Interval, remap last one"""
function compareQuartet(a, m1, m2, b, arr::Array{Int64,1})
    try
        twinMiddles = nothing

        # apply view(arr, a:b)
        #=
            compareQuartet(a, m1, m2, b, arr)
        =#

        m1, m2, _isSwapped = doCompare(m1, m2, arr) #view(arr, m1:m2)) #<------
        a, b, _isSwapped = doCompare(a, b, arr) # view(arr, a:b))
        a, m1, _isSwapped = doCompare(a, m1, arr) #view(arr, a:m1))

        #m2, b = remap(m2, b)
        # println("a, m2, b = ", a, m2, b)
        m2, b = doCompare(m2, b, arr)  #view(arr, m2:b)) #<------
        #m2, b, _isSwapped = doCompare(m2, b, view(arr, m2:b))


        twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", m1, " ", m2)
        # push!(Middles, twinMiddles) #TODO: push each _isSwapped to swapped[] vector, as well
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ?
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end

function compareQuartet(a, m1, m2, b, _view)
    try
        twinMiddles = nothing

        # apply view(arr, a:b)
        #=
            compareQuartet(a, m1, m2, b, arr)
        =#
        #   m1, m2, _isSwapped = doCompare(m1, m2, view(_view, m1:m2)) #compare twinMiddles' content

        #   a, b, _isSwapped = doCompare(a, b, view(_view, a:b)) #compare bounds' content

        #   a, m1, _isSwapped = doCompare(a, m1, view(_view, a:m1))

        m1, m2, _isSwapped = doCompare(m1, m2, view(_view, m1:m2)) #compare twinMiddles' content
        a, b, _isSwapped = doCompare(a, b, view(_view, a:b)) #compare bounds' content
        a, m1, _isSwapped = doCompare(a, m1, view(_view, a:m1))


        m2, b = remap(m2, b)
        println(" m2,b = ", m2, b)
        m2, b = doCompare(m2, b, view(_view, m2:b))


        twinMiddles = [m1, m2] # vector (Array{Int64, 1})
        println("twinMiddles [m1, m2]= ", [m1, m2])
        #        push!(Middles, twinMiddles)
        return a, b, m1, m2 #m1, m2 #should it be a,b, twinMiddles ?
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end

end

function endAlgorithmSafely()
    return # 0
end

function endAlgorithmSafely(arr::Array{Int64,1})
    println("local sorting finished successfully of sorting arr: ") #show a friendly message of end
    println(arr)
    return #true #0
end

function endAlgorithmSafely(_view::SubArray)
    println("local sorting finished successfully of sorting _view: ") #show a friendly message of end
    println(_view)
    return #true #0
end

euclidDist(a::Int64, b::Int64) = 0 <= a && 0 <= b ? abs(max(a, b) - min(a, b)) : 0 #+ 1 : 0 #-1 #both a,b > 1 positive  #review#2: offset is meaningless in this context #&& 0 <= offset

"""sum of indicies""" #scaffold
sumInterval(a::Int64, b::Int64) = a > 0 && b > 0 ? abs(b) + abs(a) : 0
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

function isEven(number::Int64) # =  #review#2: offset & number are independent
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
    return isItEven #number
end

function getIsWhole(a::Int64, b::Int64)
    isWhole = isEven(a, b) # sumInterval(a,b) % 2 == 0
    return isWhole
end

function getIsWhole(arr::Array{Int64,1})
    isWhole = firstindex(arr) + lastindex(arr) % 2 == 0
    return isWhole
end

function getIsWhole(_view::SubArray)
    isWhole = firstindex(_view) + lastindex(_view) % 2 == 0
    return isWhole
end
#----

@propagate_inbounds function middle(a::Int64, b::Int64) # b  + a -1  # Acceptable #review#2 ; offset = 1 #rule-found: offset only used in an array (at its start)
    try
        _sum = sumInterval(a, b)  #    b + a - 1  # distance between them  <---- Error
        println("a,b =", a, " ", b)
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
            isWhole = true
            println("is whole = ", isWhole)

            return mid, mid + 1, isWhole

        elseif isItEven == false
            # calculate fractionalMid
            println("Even = ", isItEven)
            println("fractionalMiddle, twinMiddles ")
            lower = -1
            upper = -1
            lower = Int(floor(mid))
            upper = Int(ceil(mid))
            isWhole = false
            println("lower = ", lower)
            println("upper = ", upper)
            println("isWhole = ", isWhole)

            return lower, upper, isWhole # the differenece is still 1, only way to discriminate is by using isWhole
        else
            throw(error("Unexpected error occured")) #<-------
        end
    catch UnexpectedError #errors out
        @error "Unexpected error occured" exception = (UnexpectedError, catch_backtrace()) #<-----
    end
end
"""
Vital helper functions
1. middle Index : fetches middle (m1), m1+1
2. doCompare: bounds of a vector, if conditions are met, we'd swap, fetches a, m1 , &  isSwapped

locally compare & sort values
for 4 verticies : a, m1, m2, b -thus we need 4 comparisons

```input
a: lower bound
b:  upper bound
arr: vector array
```
```output
Ms: vector for middes m1, m2
contentSwapped: Bool vector for  whether (note: the first one is always isWhole)
```
"""
@propagate_inbounds function callMiddle(a::Int64, b::Int64) #, arr) #vital function  (middle , docompare...)
    try
        # Reviewr#2: removed distance() should be here ( distance is only in isStop )
        #distance = euclidDist(a,b) # response = isStop(a, b, arr)

        if a != b && a > 0 && b > 0 # only condition we require
            #contentSwapped = []  #nothing
            # _isSwapped = nothing
            m1, m2, isWhole = middle(a, b) #gets middle of a length (in rational positive integer ) <---ERROR: no iterate(Nothing)
            #end
            #push!(rangeIndicies, i)
            # push!(contentSwapped, isWhole) #store iswhole at first index #review#2: delete this line
            #check if isWhole # now: to store it as current middle & in Middles[] (for the future tree)

            #TODO: another thing: assumes that each index is unique & different, (so if not unique, how to handle it?)
            #isunque #if different, then index1, index2 form a valid Interval #done
            #TODO: #2 NOT Passing a vector: worst case (the Worst)defaults to arr value [nightmare]

            #if a != b
            # a, b, _isSwapped = doCompare(a, b, arr) #removed
            #push!(contentSwapped, _isSwapped)
            #end

            #if m1 != m2 # they always are different # m2 - m1 = 1 always
            #    m1, m2, _isSwapped = doCompare(m1, m2, arr)
            #    push!(contentSwapped, _isSwapped) #2nd comparison

            #else # register value only once
            #push!(Middles, m1) #store middle
            # storeMiddle(m1)
            #there is a total mutual exclusion, in the value space (a,m1)

            #still, we're left with a, m1 (which inferred to be both local mins) their content's yet uncompared
            #if a != m1
            #   a, m1, _isSwapped = doCompare(a, m1, arr) #compares values at lower bound & middle
            #   push!(contentSwapped, _isSwapped) #3rd comparison
            #end #else return a scalar leaf node a == m1 (binaryTree)

            #what's left is:  m2, b (local max) - let's compare their values, respectively

            #if m2 != b
            #    m2, b, _isSwapped = doCompare(m2, b, arr)
            #    push!(contentSwapped, _isSwapped) #4th comparison
            #end #else return a scalar leaf node m2 == b (binaryTree)


            # explore!(a, m1, arr) #recursively explore what's left on left
            # explore!(a + 1, m1 - 1, arr) #recursively explore what's in the next m
            # explore!(m2 + 1, b - 1, arr) # explore!(m2+1, b-1, arr)

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


a, b, m1, m2 = compareQuartet(a, m1, m2, b, arr)
#
a = 1
b = 9
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
m1, m2, isWhole = callMiddle(a, b) #, arr) #TODO: callmiddle with arr
a, b, m = compareTriad(a, m1, lastindex(arr), arr) # (1, 9, 5) #ok # BoundsError: attempt to access 4-element Vector{Int64} at index [9]  # MethodError: no method matching iterate(::Nothing) #compiles #(1, 4, 2)

#Int(firstindex(arr))
#Int(lastindex(arr))

#_-----
#vital functions:
"""right side function: to evalualte a,b, arr, & their subsequent intervals -used at first run """
function goright!(a::Int64, b::Int64, arr::Array{Int64,1}) #to evalualte a,b, view1 (& their subsequent intervals )
    #to go right, fix b, increase a

    cause(a, b, arr) #call on the whole array  # <------ problem starts from here (after finishing the function (onEnd()))
    #<---- here:
    #update new value bounds:
    checkRightCondition(arr)
end #<-------

function goright!(_view::SubArray) #to evalualte a,b, view1 (& their subsequent intervals )
    #to go right, fix b, increase a

    a = firstindex(_view)
    b = lastindex(_view)

    cause(a, b, _view) #call on the whole array  # <------ problem starts from here

    #newView here?
    # checkRightCondition(_view) #uncommentMe

end

#done remap
#compareTriad
#maybe remap including b+1 is exclusive to special case, & not all

"""right side function: to evalualte a,b, view1, & their subsequent intervals """
function goright!(a::Int64, b::Int64, _view::SubArray) #ok #<------
    #to go right, fix b, increase a
    #isStop(a,b,view)
    #cause(a, b, originalView) #subView here  #BoundsError: attempt to access 4-element Vector{Int64} at index [1, 4]
    #rule: don't have to subview original view
    cause(a, b, _view) #<--------

    #  checkRightCondition(_view) #uncommentMe
    #<---ends
end

function checkRightCondition(arr::Array{Int64,1})

    a = firstindex(arr)
    b = lastindex(arr)
    msg = "UnexpectedError"
    #update new value bounds:
    try

        a = a + 1 #update a  #[remapping is required]]

        if a != b #1 2
            #remapping problem  #subtle-issue (Solved)
            a, b = remap(a, b) #doing remap
            b - a > 1 ? goright!(view(arr, a, b)) : endAlgorithmSafely(view(arr, a, b))
        elseif a == b
            endAlgorithmSafely()
        else
            throw(error(msg))
        end
    catch UnexpectedError
        @error msg * " Occured" exception = (UnexpectedError, catch_backtrace())
    end
end

#------

function checkRightCondition(_view::SubArray) #correct #<----- this is called  after algorithm finishes

    a = firstindex(_view)
    b = lastindex(_view)
    msg = "UnexpectedError"
    #update new value bounds:
    try

        a = a + 1 #update a  #[remapping is required]]

        if a != b
            #remapping problem  #subtle-issue
            a, b = remap(a, b) #doing remap
            #check input arguments(bounds) are less than (or equal to) input vector array
            if b - a > 1 # distance is more than 1
                # newView = view(_view, a:b)
                goright!(view(_view, a:b))
            elseif b - a == 1 #distance equals 1
                endAlgorithmSafely(view(_view, a:b))
            end
            # b - a > 1 ? goright!(view(_view, a, b)) : endAlgorithmSafely(view(_view, a, b))
        elseif a == b # b-a == 0
            endAlgorithmSafely()
        else
            throw(error(msg))
        end
    catch UnexpectedError
        @error msg * " Occured" exception = (UnexpectedError, catch_backtrace())
    end
end
#checkLeftCondition(arr) for view only
arr
#checkRightCondition(arr)

function goleft!(a::Int64, b::Int64, _view::SubArray) #compiles correctly #todo: Update a,b
    #to go left, fix a, decrease b

    # call cause on original view once
    cause(a, b, _view)

    # cause(a, b, view1) #: endAlgorithmSafely(view1) # return
    # checkLeftCondition(_view) #<------ uncommentMe

    #b-a >0 #b-a>1
end

function goleft!(_view::SubArray)
    a = firstindex(_view)
    b = lastindex(_view)

    cause(a, b, _view)
    # checkLeftCondition(_view) #<--------- #uncommentMe

end


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
        #q. can i get away without remapping here? NO
        b = b - 1 #update b #ok
        a, b = remap(a, b) #after remap

        #b = euclidDist(a, b) + 1
        #a = 1 #always start at this
        #newView = view(arr, a, b) #update view  #was b-1 #ok got remapped
        #isStop() here

        b - a > 1 ? goleft!(firstindex(view(arr, a, b)), lastindex(view(arr, a, b)), view(arr, a, b)) : endAlgorithmSafely(view(arr, a, b))
        #  b - a > 1 ? goleft!(a, b, view(arr, a, b)) : endAlgorithmSafely(view(arr, a, b)) # return #was b - 1 #it's remapped #Q. why play with intervals manually?

    else #a ==b i.e. scalar value
        #endAlgorithmSafely(arr)
        endAlgorithmSafely()    #action: return only
    end
    =#
end


function checkLeftCondition(_view::SubArray)
    msg = "UnexpectedError"
    try
        a = firstindex(_view)
        b = lastindex(_view)

        println("b = ", b) # b was 9
        #nextCond #interval oriented:
        b = b - 1 #update b # now b is 8

        if a != b
            a, b = remap(a, b)
            println("a = ", a, " b = ", b) # b is still 8 #a =1 b =8

            if b - a > 1
                println("b - a = ", b - a) #b-a = 7
                newView = view(_view, a:b) #<-----------
                goleft!(newView)  #<--------------
            elseif b - a == 1
                endAlgorithmSafely()#view(_view, a, b)) #TODO: undo this line  #uncomment Me
            end
            #  b - a > 1 ? goleft!(view(_view, a, b)) : endAlgorithmSafely(view(_view, a, b)) #<-----

        elseif a == b
            endAlgorithmSafely()
        else
            throw(error(msg))
        end
    catch UnexpectedError
        @error msg * " Occured" exception = (UnexpectedError, catch_backtrace())
    end
end
#checkLeftCondition finishes correctly
#----
#cause


#check both funcs below are identically equal
#Rule: cause must always get the updated a & b (of the current view )

function cause(a::Int64, b::Int64, _view::SubArray) #in: _view  #uses view #error #no isStop(a,b,view) ==false
    ##if isStop(a, b, view) == false # continue processing  #callMiddle #checkCond #sub-interval #UncommentMe
    #isStop(a, b, view) #Error here
    #isStop(a, b, view(collect(a:b), a:b))
    condition = stoppingCondition(a, b, _view) #isstop(a, b, _view) #depreciate this  #TODO Questionale change it

    if condition == true # the actual utility of function #out: view : arr , a:b
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        # return callMiddle(a, b) # m1,m2,isWhole
        m1, m2, isWhole = callMiddle(a, b) # arr) #new range new middle
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

currentValue
# init
#before first cause, call init
function cause(a::Int64, b::Int64, arr::Array{Int64,1})#, currentValue) #working  #uses arr only *Warning*
    condition = stoppingCondition(a, b, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = callMiddle(a, b) # arr)
        checkCond(a, m1, m2, b, isWhole, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end
#strategy pass-in an arr, for now  #

function cause(a::Int64, b::Int64, arr::Array{Int64,1},currentValue) #working  #uses arr only *Warning*
    condition = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = callMiddle(a, b) # arr)
        checkCond2(a, m1, m2, b, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(a, b, view(arr, a:b))  #working  #correct use of view (on arr, from a, to b) #view(collect(a:b), a:b)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end
#effect
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



#checkCond
#----

#requires compareQuartet, compareTriad
function checkCond(a::Int64, m1::Int64, m2::Int64, b::Int64, isWhole::Bool, _view::SubArray) #is there a way to convert view to arr
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
        newView = view(_view, a:m1)
        println("a = ", a, " m1= ", m1, " newView = ", newView)

        goleft!(a, m1, newView) #using subview  #was a,m1 #<----- then here (first left I see a:m1 the same i.e )

        #remap required
        m1, b = remap(m1, b)
        print("m1, b = ", m1, b)

        # view2 = view(_view, m1:b) #issue: building proper view - subarray of an array #was m1,b
        goright!(view(_view, m1:b))

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
        # b = euclidDist(m2, b) #+1
        # m2 = 1
        view2 = view(_view, m2:b) #issue: building proper view - subarray of an array  #<----------------error  #was m2,b
        #TODO: handle interval m1,m2 as well (for completeness: we got to compare all vertex intervals )


        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        #effect(m2, b, view2) #<---------- # 3:5

        goleft!(view(_view, a:m1)) #go left iteratively #
        goright!(view2) # goright!(m2, b, view(view2, m2:b)) #go right iteratively #<---------
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
        #to go left: fix a, decrease b #but we start with a:m1 - interval is verified
        # newView = view(_view, a:m1)
        println("a = ", a, " m1= ", m1, " newView = ", newView)

        goleft!(a, m1, newView) #using subview  #was a,m1 #<----- then here (first left I see a:m1 the same i.e )

        #remap required
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
        # b = euclidDist(m2, b) #+1
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
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #b -= 1
        # b = euclidDist(m2, b) #+1
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

function explore(a, m1, m2, b, _view::SubArray)
    upper = nothing
    lower = nothing
    if isWhole == true  # only 1 middle m1
        upper = m1 - 1
        lower = m1 + 1
        #  effect(a, m1, view(_view, a:m1))
        #  effect(m1, b, view(_view, m2:b))

    else
        isWhole == false  # twinMiddles: m1,m2
        upper = m1 - 1
        lower = m2 + 1

    end
    # a != upper ?=
    # effect(a, upper, view(_view, a:upper)) #: a #_view[a] #return #scalar
    # b != lower ?=
    # effect(lower, b, view(_view, lower:b)) #: b #_view[b] #return


    a != upper ? effect(a, upper, view(_view, a:upper)) : a; println("Scalar Value = " , a)
    b != lower ? effect(lower, b, view(_view, lower:b)) : b;
    println("Scalar Value = ", b); #: #_view[b] #return

end

explore(1,2,3,3,view(ar1,1:3))
euclidDist(1, 3) + 1 # 3 max = 2 = 3-1
euclidDist(1, 3)

#=
#abstract space : Idealized
function causeVector(a, b, arr) #with Original arr, got more control
    if isStop(a, b, (arr, a:b)) == true
        return 0

    elseif isStop(a, b, (arr, a:b)) == false
        m1, m2, isWhole = callMiddle(a, b) # arr)
        checkCond(a, m1, m2, b, isWhole, arr)
        #isStop(a, b, view(arr, a:b)) #no , this is an "Atomic Operation" on the current a,b of arr only
    end
end

function effectVector(a, b, arr) #passing arguments
    causeVector(a, b, arr)
end

=#

#=
TODO:
#if left a b : fix a , decrease b by 1 i.e. b-1
#if right a b: fix b, increase a by 1 i.e. a+1

=#

#---test
isStop(1, 2, view(arr, 1:2)) == true ? endAlgorithmSafely(arr) : 0 #doOtherThing()
arr #no swapContent - yet!
#isStop(1, 2, view(collect(1:2), 1:2))
isStop(1, 2, view(collect(1:2), 1:2)) #correct #sample result
isStop(1, 2, view(arr, 1:2)) == true ? endAlgorithmSafely(arr) : 0 #correct # Was methodError no method matching collect(::Int, ::Int) reason , instead use :
#the end

# uncommentMe
#issue: expecting view, got arr
#=
function cause(a, b, arr) #in: arr  #uses view #error
    #isStop(a, b, view) #Error here
    #isStop(a, b, view(collect(a:b), a:b))
    isStop(a, b, view(arr, a:b)) # the actual utility of function #out: view : arr , a:b
end
=#

#a = firstindex(arr)
#b = lastindex(arr)
#=
offset
arr
_first = copy(firstindex(arr)) #copy(firstindex(arr))
_last = copy(lastindex(arr))

if a >= _first &&
   b <= _last
    # Insight: offset Condition is contained & a subset of the other first-last bound Condition

    return true
end
=#

# goright!(a::Int64, b::Int64, view1::SubArray{Int64, 1, Vector{Int64}, Tuple{UnitRange{Int64}}, true})
#1. lastindex(arr) == length(arr) [length is faster]
#log
#1. changed a faulty a ,b to a+1, b
#goright!(firstindex(arr), lastindex(arr), arr) #does Nothing #Warning! #funcs: checkCond
goright!(arr)
arr
goleft!(arr) #does sorting
arr
#Cross-Reference: compare right & left , apply good changes of Left on right
#-----
#callMiddle
@inline function swapContent(aContent, bContent, arr::Array{Int64,1}) # ; offset=1) #new! # a,b,indicies in arr  #the less arguments the better
    contentSwapped = nothing

    a = findall(x -> x == aContent, arr)
    #a = a[offset]
    a = a[firstindex(arr)]

    b = findall(x -> x == bContent, arr)
    b = b[lastindex(b)] # copy(b[length(b)])   # -offset])

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

    end

    return a, b, contentSwapped #returns index (more practical)
end

ar1 = [1, 3, 2, 4]
swapContent(3, 2, ar1) #view(ar1,1,length(ar1)))
ar1
@inline function swapContent(aContent, bContent, _view::SubstitutionString) # ; offset=1) #new! # a,b,indicies in arr  #the less arguments the better
    contentSwapped = nothing

    a = findall(x -> x == aContent, _view)
    #a = a[offset]
    a = a[firstindex(arr)]

    b = findall(x -> x == bContent, _view)
    b = b[lastindex(b)] # copy(b[length(b)])   # -offset])

    if aContent > bContent
        _view[a], _view[b] = _view[b], _view[a] #swap
        contentSwapped = true
        #   _first = arr[a]
        #  _last = arr[b]
        println(_view[a], " ", _view[b], contentSwapped)

    elseif aContent < bContent
        # arr[a], arr[b] = arr[a], arr[b] # nothing
        contentSwapped = false
        println(_view[a], " ", _view[b], contentSwapped)

    elseif aContent == bContent
        #personal preference solution , the first one close to lower bound  is at first

        contentSwapped = false
        println(_view[a], " ", _view[b], contentSwapped)

    end

    return a, b, contentSwapped #returns index (more practical)
end

#b = _v
# b = b[lastindex(b)]


function isInBounds(a::Int64, b::Int64, arr::Array{Int64,1}) #working
    try
        _first = firstindex(arr)
        _last = lastindex(arr)
        #a , b should have valid values
        if a >= _first &&
           (a <= b) &&
           b <= _last
            # Insight: offset bound Condition is  a subset (contained) in the other first-last bound Condition
            return true
            #CommentMe
            #=
            elseif a <= first &&
               b >= last
            return false
            # =#
        else
            throw(error("UnexpectedError Occured"))
            #return false
        end
    catch UnexpectedError
        @error "UnexpectedError Occured, please check the correctness of input bound arguments, then try again" exception = (UnexpectedError, catch_backtrace())
    end

end #lesson:find the conjugate to get the opposite

a = firstindex(arr)
b = lastindex(arr)
if isInBounds(a, b, arr) #checks if a,b in bounds of vector arr
    m1, m2, isWhole = calcMiddle(a, b, arr)
end

#Experimental
#left side function
#= UncommentMe
function goleft!( view1,r=a:b) #
    #to go left, fix a, decrease b
    first = r[offset]
    last = r[offset+1]
    effect(first, last, view1)

    goleft!(first, last - 1, view(view1, a:b - 1))

end
=#


#Small Issue:
# goright!(offset, length(arr), arr)
# goleft!(offset, length(arr), arr) #Ok

#Demo#2
arr = [4, 3, 2, 1]
#3:4 # rightest right # diff = 1 it should call endAlgorithmSafely
#-------
m1
_len = length(arr)
#you cannot view on the whole array (or else it won't be called a view ) - call original array instead

view1 = view(arr, a:m1)
swapContent(1, 5, view1)
view2 = view(arr, a:a+1) #view(arr, a:m1)
view1 = view(arr, a:m1-1)
view1 = view(arr, a:_len)

view1
_v1 = view1[1:5] #view out of bounds #view has 2 items, but request expect [1:5] 5  items

# BoundsError: attempt to access 2-element view(::Vector{Int64}, 1:2) with eltype Int64 at index [1:5]
v1 = view(_v1, 1:5)
goleft!(1, 5, v1)

# goright!()
#goleft!(1, 2, v1) #compiles

arr


#v1
#--------
a
b
view1
#a != b ? effect(a, b, view1) : return
effect(1, 2, view1)
#--=test
#a
#b

if isInBounds(1, 9, arr) == true
    return 0
end
arr

#gorightVector(1, 5, arr) #compiles nicely
goright!(1, 4, arr)

isInBounds(6, 9, arr)
#goleftVector(6, 9, arr) #issue: input handling : check input arguments' sanity
goleft!(6, 9, arr)
#= uncommentMe #future
function cause(a, b, view) # = view(arr, a, b))
    #isStop(a, b, view) #Error here
    #isStop(a, b, view(collect(a:b), a:b))
    isStop(a, b, view(arr, a:b))
    if isStop(a, b, view) == false  #view(arr, a:b)) # the actual utility of function

    # isStop(1,5,view(collect(1:5), 1:5))

        m1, m2, isWhole = callMiddle(a, b) # arr) #<--------
        checkCond(a, m1, m2, b, isWhole, arr) # checkCond(a,m1, m2, b, isWhole, arr) #< -------
end
=#
arr
a = firstindex(arr);
b = lastindex(arr);
a
b
isStop(a, b, view(arr, a:b))

#=
function effect(a, b, arr) # = view(arr, a, b)) #just pass the array iself #do not manipulate arr manually
    # view(collect(1:2), 1:2)
    cause(a, b, view(arr, a:b))  #<-------view is autobuilt for you #infer: view must be prepared beforehand

end
=#

#----

#demo only
#view([1, 2, 3], 3) #3rd argument dimension (discarded)
#end
(length([1 2 3]))

view([1, 2, 3], 1:2, 1) # view(arr, range, 1d) #d: dimension # 1 2
v1 = view(collect(1:2), 1:2) # 1 2
v2 = view([1, 2, 3], 1:2) # 1 2
v1 == v2 #EQUAL IN VALUE ONLY
v1 === v2 # NOT EQUAL IN return OBJECT
m1, m2, isWhole = middle(1, 2) # idea: when m1 == a, m2 == b means we've reached the end (proxy for: smallest distance )
stoppingCondition(1, 2, view([1, 2], 1:2)) # true #Correct #true  # <------------
#isStop2(1, 1, 2, 2) ## isStop2(a,m1,m2,b) #index based #faster: no vector calls or computations are needed #lighter


#view(arr, a, b) #possible errors(if mantual entering): wrong interval bounds Error : BoundsError #uncommentMe
#view([2, 3, 4], 1, 2)
#boundsError: attempt to access 3-element vector at index [1,2]

#doCompare()

arr
_v = view(arr, 1)
firstindex(_v)
_v[1]
#_view[1]



view(arr, 1:2)# 1 2
view(arr, 5:9)# 5 9
view(arr, 2:3)# 2 3

#try
arr
a = 1
m1 = 5

view1 = view(arr, a:m1)
view2 = view(arr, a:a+1) #view(arr, a:m1)

# compareTriad(a,m1,b,view1)

doCompare(a, m1, view1) #<------- Error Here : (length(_view)), swapContent(_view[a], _view[b], _view)
_length = copy(length(view1))
if view1[a] > view1[length(view1)]
    swapContent(view1[a], view1[b], view1)
end
a
view1
length(view1)
swapContent(view1[a], view1[length(view1)], view1)
#swapContent is erroneous

#given those 3
m2 #oldIndex
b #oldIndex
#------- test here
_view = view(arr, m2:b) #Proportionate: make a new portion
#reMap(m,b,_view) OR findBounds function
view2 = view(_view, firstindex(_view):length(_view))
#gotcha
length(_view)# 4
offset

# function findBounds

euclidDist(m2, b)#valid
euclidDist(offset, length(_view))
euclidDist(m2, b) === euclidDist(offset, length(_view)) #Both distances are equivalent
#EntryCondition:  1st check: Is euclidDist(m2,b) <= length(_view)
#reIndex m2= 6

""" use arr: generates a view(s) """
function checkCond(a, m1, m2, b, isWhole, arr::Array{Int64,1}) #error in bounds, please check again # need to use view?
    a != m1 ? view1 = view(arr, a:m1) : return #correct result #index [3:4] #true
    println("arr ", arr)
    println("a:m1 = ", a:m1)
    println("b =", b)

    if isWhole == true
        #m region
        #compare content (of 3-Fractal: a, m, b )
        compareTriad(a, m1, b, arr) #issue: arr [should be view ] #hillarious was b1 instead of b   #<-----

        #Do:
        # view1 = view(arr, a:m1) #correct result #redundant, same as in line 1 of function
        #view2 = view(arr, m1:b) #<----- errors out
        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))   #by luck this works

        # effect(view1[offset], length(view1),view1)  # effect(firstindex(view1[offset]),length(view1), view1)
        #instead of: effect(m1, b, view2) #<---------- # 3:5 #problem here : Solution: update indicies to cover the newly view view2
        #Do: effect(offset, length(view2), view2) # effect(firstindex(view2), length(view2), view2)

        #  goleft!(view1[offset], length(view1), view1)
        println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
        # goleft!(offset, length(view1), view1)
        goleft!(view(arr, a:m1))
        println("goRight: offset = ", offset, " length(view2) = ", length(view2))
        # goright!(offset, length(view2), view2)
        goright!(view(arr, m1:b))

        ##instead of
        #effect(a, m1, arr)
        #effect(m1, b, arr)
    elseif isWhole == false
        #m1, m2 = unpackM(m)
        #  view2 = view(arr, m2:b) #ReIndex #view2 is only local (errors out) nothing
        #effect(a, m1, view1) #passing a view # was arr (should be  # view())
        #effect(firstindex(view2),length(view2),view2)  #m2, b, view2)

        #OR

        # goleft!(view1[offset], length(view1), view1) #view

        #goleft!(offset, length(view1), view1)

        #goright!(offset, length(view2), view2) #to call cause , twice? m2,b &

        println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
        goleft!(view(arr, a:m1))

        println("goRight: offset = ", offset, " length(view2) = ", length(view(arr, m2:b)))
        goright!(view(arr, m2:b))

        #else
    end# uncommentMe
    #println("goLeft: view1[offset] = ", view1[offset], " length(view1) = ", length(view1))
    #goleft!(view1[offset], length(view1), view1)

end

function checkCond(a, m1, m2, b, arr::Array{Int64,1}) #error in bounds, please check again # need to use view?
    isWhole = getIsWhole(a,b)
    a != m1 ? view1 = view(arr, a:m1) : return #correct result #index [3:4] #true
    println("arr ", arr)
    println("a:m1 = ", a:m1)
    println("b =", b)

    if isWhole == true
        #m region
        #compare content (of 3-Fractal: a, m, b )
        compareTriad(a, m1, b, arr) #issue: arr [should be view ] #hillarious was b1 instead of b   #<-----

        #Do:
        # view1 = view(arr, a:m1) #correct result #redundant, same as in line 1 of function
        #view2 = view(arr, m1:b) #<----- errors out
        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))   #by luck this works

        # effect(view1[offset], length(view1),view1)  # effect(firstindex(view1[offset]),length(view1), view1)
        #instead of: effect(m1, b, view2) #<---------- # 3:5 #problem here : Solution: update indicies to cover the newly view view2
        #Do: effect(offset, length(view2), view2) # effect(firstindex(view2), length(view2), view2)

        #  goleft!(view1[offset], length(view1), view1)
        println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
        # goleft!(offset, length(view1), view1)
        goleft!(view(arr, a:m1))
        println("goRight: offset = ", offset, " length(view2) = ", length(view2))
        # goright!(offset, length(view2), view2)
        goright!(view(arr, m1:b))

        ##instead of
        #effect(a, m1, arr)
        #effect(m1, b, arr)
    elseif isWhole == false
        #m1, m2 = unpackM(m)
        #  view2 = view(arr, m2:b) #ReIndex #view2 is only local (errors out) nothing
        #effect(a, m1, view1) #passing a view # was arr (should be  # view())
        #effect(firstindex(view2),length(view2),view2)  #m2, b, view2)

        #OR

        # goleft!(view1[offset], length(view1), view1) #view

        #goleft!(offset, length(view1), view1)

        #goright!(offset, length(view2), view2) #to call cause , twice? m2,b &

        println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
        goleft!(view(arr, a:m1))

        println("goRight: offset = ", offset, " length(view2) = ", length(view(arr, m2:b)))
        goright!(view(arr, m2:b))

        #else
    end# uncommentMe
    #println("goLeft: view1[offset] = ", view1[offset], " length(view1) = ", length(view1))
    #goleft!(view1[offset], length(view1), view1)

end

function checkCond(a::Int64, m1::Int64, m2::Int64, b::Int64, isWhole::Bool, _view::SubArray) #error in bounds, please check again # need to use view?
    a != m1 ? view1 = view(_view, a:m1) : return #correct result #index [3:4] #true
    println("_view ", _view)
    println("a:m1 = ", a:m1)
    println("b =", b)

    if isWhole == true
        #m region
        #compare content (of 3-Fractal: a, m, b )
        compareTriad(a, m1, b, _view) #issue: arr [should be view ] #hillarious was b1 instead of b   #<-----

        #Do:
        # view1 = view(arr, a:m1) #correct result #redundant, same as in line 1 of function
        #view2 = view(arr, m1:b) #<----- errors out
        #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))   #by luck this works

        # effect(view1[offset], length(view1),view1)  # effect(firstindex(view1[offset]),length(view1), view1)
        #instead of: effect(m1, b, view2) #<---------- # 3:5 #problem here : Solution: update indicies to cover the newly view view2
        #Do: effect(offset, length(view2), view2) # effect(firstindex(view2), length(view2), view2)

        #  goleft!(view1[offset], length(view1), view1)
        println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
        # goleft!(offset, length(view1), view1)
        goleft!(view(_view, a:m1))
        println("goRight: offset = ", offset, " length(view2) = ", length(view2))
        # goright!(offset, length(view2), view2)
        goright!(view(_view, m1:b))

        ##instead of
        #effect(a, m1, arr)
        #effect(m1, b, arr)
    elseif isWhole == false
        #m1, m2 = unpackM(m)
        #  view2 = view(arr, m2:b) #ReIndex #view2 is only local (errors out) nothing
        #effect(a, m1, view1) #passing a view # was arr (should be  # view())
        #effect(firstindex(view2),length(view2),view2)  #m2, b, view2)

        #OR

        # goleft!(view1[offset], length(view1), view1) #view

        #goleft!(offset, length(view1), view1)

        #goright!(offset, length(view2), view2) #to call cause , twice? m2,b &

        println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
        goleft!(view(_view, a:m1))
        #remap?
        m2, b = remap(m2, b)
        println("goRight: offset = ", offset, " length(view2) = ", length(view(_view, m2:b)))
        goright!(view(_view, m2:b))

        #else
    end# uncommentMe
    #println("goLeft: view1[offset] = ", view1[offset], " length(view1) = ", length(view1))
    #goleft!(view1[offset], length(view1), view1)

end

m1 = 5;
#b = 9;
arr
m1, m2, isWhole = callMiddle(firstindex(arr), lastindex(arr))
firstindex(arr) #a
m1 #5
#BoundsError: attempt to access 9-element Vector{Int64} at index [1, 5] {where problem actually is }
#workaround:  use unitRange (:) t notation, to express intervals i.e. view(arr, a: m1)
view1 = view(arr, firstindex(arr):m1) #correct

# want to encapsulate the view
#view2 = view(arr, m1:b)
m1
effect(firstindex(arr), m1 - 1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
view1
view2
# effect(offset, length(view2), view2)# <-----------

println("goRight: offset = ", offset, " length(view2) = ", length(view2))

# goleft!(view1[offset], length(view1), view1) #view
println("goLeft: view1[offset] = ", offset, " length(view1) = ", length(view1))
goleft!(view1)
goright!(view2)
# goleft!(offset, length(view1), view1) #error: first spotted here (left-side )
# goright!(offset, length(view2), view2) #to call cause , twice? m2,b &


goleft!(offset, length(arr), arr)
goright!(offset, length(arr), arr) #to call cause , twice? m2,b &


a = 1 #not defined
a
b
m1, m2, isWhole = callMiddle(a, b)

# if m2 ==
checkCond(a, m1, m2, b, isWhole, arr) #TODO: want to use arr here  # no method matching iterate(::Nothing)

#do: #TODO: elaborate on the cause-> effect model
#no proportioning: Normal (behavior: below average )
effect(a, m1, arr) #Correct #false (yet another range to come) #error: kills terminal !
effect(m1, b, arr)
#----

typeof(view1)


#experimental: to be deleted
function newView{T,N}(a::Array{T}, dims::NTuple{N,Int64}; start=1::Int64)
    # pointer_from_objref()
end



view(collect(1:5), 1:5)  #correct syntax # 1 5
view(arr, 1:2) # 1 2
#---
#test
arr = [3, 2, 1]
a = 1;
b = 3;
arr = [1, 2, 3]
#before callMiddle #calcVerteciesLeft! = 1
currentValue = calcVerteciesLeft!(arr, getIsWhole(arr)) #correct value appearantly

m1, m2, isWhole = callMiddle(a, b)

# getSubtractedValue(get)
#After callMiddle
currentValue = calcVerteciesLeft!(arr, getIsWhole(arr), currentValue)
#if currentValue < 0 currentValue = 0
isStop(currentValue) #value is 1

#checkCond

checkCond(a, m1, m2, b, isWhole, arr) # <-------------------- works #m1 m2 are lost (not retrieved )-> isStop2 cannot be used in this context #not working

arr

#compare here, if you will
a
b
#next stop ? # review: why are you evaluating next stop & not the current one ?
# maybe we are "previewing the next step"
#isStop(a, b - 1, arr[a:b-1]) #returns 0 #working #correct #ture #OR
# isStop2(a,m1,m2,b)
# isStop2(a,m1,m2,b-1)
# isStop2(a, m1, m2, b) #a!=m1 as 1!=2 -> there's still an Interval

#2 valid stopping conditions

function calcTotalMiddles(arr) #dislike this name
    return length(arr) - 2
end


#B: getSubtractedValue
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
#[1,2,3]
length(arr)
x = 1
y = 3
x + y - 1

function intervalLength(a, b)
    return a + b - 1
end

""" called after function Criteria """ # scaffold #light #Best
function calcVerteciesLeft!(a::Int64, b::Int64, currentValue=nothing) # ,formula)
    msg = "Unexpected Error"
    try
        totalLength = copy(intervalLength(a, b)) #a+b -1
        sum = totalLength + 1
        isWhole = isEven(sum)

        if currentValue === nothing # or ===
            currentValue = intervalLength(a, b) - 2  # #A()= length(arr) - 2
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B()
            currentValue -= getSubtractedValue(isWhole)
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

function calcVerteciesLeft!(a::Int64, b::Int64, isWhole::Bool, currentValue=nothing::Int64) # ,formula)
    # great subtle error detected
    try
        msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = intervalLength(a, b) - 2 # calcTotalMiddles(arr) # #A()= length(arr) - 2
            println("currentValue = intervalLength(a, b) - 2 " * currentValue)
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B()
            currentValue -= getSubtractedValue(isWhole)
            println("currentValue -= getSubtractedValue(isWhole) " * currentValue)
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

function calcVerteciesLeft!(arr::Array{Int64,1}, isWhole::Bool, currentValue=nothing::Int64) # ,formula)
    #
    try
        msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = calcTotalMiddles(arr) # #A()= length(arr) - 2
        elseif currentValue !== nothing  # subtract from currentValue (1 or 2 ) , subtract B()
            currentValue -= getSubtractedValue(isWhole)
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

""" checks if function has reached a stopping condition
At any rate, this is a fine function that will expose any further `Hidden Deformalities`, in the function Implementation:
possible common Issues:
1. More cycles (recursions)
2. Less cycles (than anticipated) """

function isStop(currentValue) #scaffold
    try
        msg = "UnexpectedError Occured"
        if currentValue == 0  #|| currentValue == 1
            return true # function exits successfully
        elseif currentValue > 0 #1
            return false # error in the logic
        else
            throw(error(msg)) # severe Error
        end

    catch
    end
end

#=function calcUnexplored()
     if calcTotalMiddles(arr) - getSubtractedValue(isWhole) == 0 #useful for a recursion #check if done
        #stoppage condition
        return
     end
end
=#

"""for a given vector, calculate currentValue"""
function checkCurrentValue!(a::Int64, b::Int64, currentValue=nothing) #vital

    currentValue = calcVerteciesLeft!(a, b, currentValue)
    return currentValue
end


function checkCurrentValue!(arr::Array{Int64,1}, currentValue=nothing) #vital
    isWhole = getIsWhole(arr)
    currentValue = calcVerteciesLeft!(arr, isWhole, currentValue)
    return currentValue
end

""" for a given view, calculate currentValue"""
function checkCurrentValue!(_view::SubArray, currentValue=nothing) #vital
    isWhole = getIsWhole(_view)
    currentValue = calcVerteciesLeft!(_view, isWhole, currentValue)
    return currentValue
end


currentValue = checkCurrentValue!(1, 3)

"""before kernel: callMiddle (cause): checks isStop """

function init(a::Int64, b::Int64) #vital
    currentValue = checkCurrentValue!(a, b)
    return currentValue
end

function init(arr::Array{Int64,1}) #vital
    currentValue = checkCurrentValue!(arr)
    return currentValue
end

"""after kernel function: callMiddle: checks isStop """ #input: 3 numbers
function isStoppingCondition(a::Int64, b::Int64, currentValue) #vital
    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function
    println(currentValue)
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = checkCurrentValue!(a, b, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    #calcUnexplored
    if isStop(currentValue) == 0 #useful for a recursion #check if done
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


function isStoppingCondition(arr::Array{Int64,1}, currentValue) # =2::Int64) #vital
    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function
    print(currentValue)
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = checkCurrentValue!(arr, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    #calcUnexplored
    if isStop(currentValue) == 0 #useful for a recursion #check if done
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

function isStoppingCondition(_view::SubArray, currentValue) #vital
    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function
    println(currentValue)
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = checkCurrentValue!(_view, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    #calcUnexplored
    if isStop(currentValue) == 0 #useful for a recursion #check if done
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

#=
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

function stoppingCondition(a, b, _view)#depreciate
    m1, m2, isWhole = callMiddle!(a, b, _view)
    #calcUnexplored
    if calcTotalMiddles(_view) - getSubtractedValue(isWhole) == 0 #useful for a recursion #check if done
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

#-----
if isWhole == true
    #m region
    #compare content (of 3-Fractal: a, m, b )
    compareTriad(a, m1, b, arr) #issue: arr [should be view ] #hillarious was b1 instead of b   #<-----

    #Do:
    # view1 = view(arr, a:m1) #correct result #redundant, same as in line 1 of function
    #view2 = view(arr, m1:b) #<----- errors out
    #effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))   #by luck this works

    # effect(view1[offset], length(view1),view1)  # effect(firstindex(view1[offset]),length(view1), view1)
    #instead of: effect(m1, b, view2) #<---------- # 3:5 #problem here : Solution: update indicies to cover the newly view view2
    #Do: effect(offset, length(view2), view2) # effect(firstindex(view2), length(view2), view2)

    #  goleft!(view1[offset], length(view1), view1)
    println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
    # goleft!(offset, length(view1), view1)
    goleft!(view(arr, a:m1))
    println("goRight: offset = ", offset, " length(view2) = ", length(view2))
    # goright!(offset, length(view2), view2)
    goright!(view(arr, m1:b))

    ##instead of
    #effect(a, m1, arr)
    #effect(m1, b, arr)
elseif isWhole == false
    #m1, m2 = unpackM(m)
    #  view2 = view(arr, m2:b) #ReIndex #view2 is only local (errors out) nothing
    #effect(a, m1, view1) #passing a view # was arr (should be  # view())
    #effect(firstindex(view2),length(view2),view2)  #m2, b, view2)


    compareQuartet(a, m1, m2, b, arr)
    #OR

    # goleft!(view1[offset], length(view1), view1) #view

    #goleft!(offset, length(view1), view1)

    #goright!(offset, length(view2), view2) #to call cause , twice? m2,b &

    println("goLeft: offset = ", offset, " length(view1) = ", length(view1))
    goleft!(view(arr, a:m1))

    println("goRight: offset = ", offset, " length(view2) = ", length(view(arr, m2:b)))
    goright!(view(arr, m2:b))
end
#-----test
#1. totalExplorablesLeft 1 op , 2 fun calls (which 1 is bulit-in)
totalExplorablesLeft = length(arr) - 2 #1
subtract = getSubtractedValue(isWhole)
# general formulation
totalExplorablesLeft = length(arr) - 2 - subtract # getSubtractedValue(isWhole) # subtrand # left 2 unex #0 #correct
stoppingCondition(arr)
#effect(a, b-1, arr[a:b-1])
#isStop(a, b - 1, arr[a:b-1]) #false #working
isStop(a, b - 1, view(a:b-1, [1, 2, 3]))#this form didn't run
isStop(a, b, view(a:b, [1, 2]))#this form didn't run
isStop(a, b, view(a:b, [1, 2]))#this form didn't run
isStop(a, b, view(a:b, [1, 2]))#this form didn't run

# isStop(a, b-1, view([a:b-1], a:b-1)) #1, 2, 3

n, m = remap(1, 2)
v1 = view([1, 2, 3], n:m)
v2 = view(max(n:m, [1, 2, 3]), min(n:m, [1, 2, 3]))
v1 == v2 #equal in value

n, m = remap(1, 1)
v1 = view([1, 2, 3], n:m)
v2 = view(max(n:m, [1, 2, 3]), min(n:m, [1, 2, 3]))
v1 == v2 #equal in value

theEnd = b - 1 #2

isStop(a, b - 1, arr[a:b-1]) #returns 0 #working
arr
view(arr, a:b)
b > 3 ?
view([a:b-3], a:b) : 0
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
a = 1;
b = 9;
m1, m2, isWhole = callMiddle(1, 9)

arr
checkCond(a, m1, m2, b, isWhole, arr) #BoundsError #<-------------------------
view(arr, a:m1)
arr
#---easiest arr
a = 1;
b = 3;
arr = [1, 2, 3]
m1, m2, isWhole = callMiddle(a, b)

# checkCond(a, m1, m2, b, isWhole, arr) #pass-in whole #uncommentMe
view1 = (arr, a:m1)  # a, m1

view(arr, a:m1)

view1 = view(arr, a:m1) #correct result
m1
a = 1
b
if isWhole == true
    #m region

    # if isWhole == false # 4 compares

    # elseif isWhole == true  # 3 compares
    compareTriad(a, m1, b, arr) #compare contents

    view1 = view(arr, a:m1) #correct result
    effect(a, m1, view1) # here arr (should be  # view())
    #Insteadof:
    m1, b = remap(m1, b)
    view2 = view(arr, m1:b)
    effect(m1, b, view2)

    # effect(a, m1, view1) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
    ##effect(m1, b, view2)
    #Do
    # effect(a, m1, arr[a:m1])

elseif isWhole == false
    #m1, m2 = unpackM(m)
    compareQuartet(a, m1, m2, b, arr)

    # arr[a:b-1]

    effect(a, m1, view1) # here arr (should be  # view())
    m2, b = remap(m2, b)
    view3 = view(arr, m2:b)
    effect(m2, b, view3)
else
    throw(error("UnexpectedError occured"))
end
#return 0
#
arr
# effect(a, m1, arr[a:m1])
# all views are done

""" where to go after calculating a middle? Hence, it's important to check condition of isWhole ,
     picking right bounds for the next Intervals
```input:
a
m1
m2
b
whole Bool flag if current middle is a whole number
arr
```

```output:
```
"""
#= uncommentMe
function checkCond(a, m1, m2, b, whole, arr) #error in bounds, please check again
    if whole == true
        #m region
        effect(a, m1, arr) #  effect(a, m, view(,a,b))  isStop(1, 2, view([1, 2], 1:2))
        effect(m1, b, arr)
    elseif whole == false
        #m1, m2 = unpackM(m)
        effect(a, m1, arr) # here arr (should be  # view())
        effect(m2, b, arr)
    end
end
=#

# 0-dimensional view(::Array{Vector{Int64}, 0}) with eltype Vector{Int64}:
# [1, 2, 3, 4, 5]


_length = copy(length(arr))

# if a <= _length # && b >= m2
aContent = arr[a]
bContent = arr[b]

contentSwapped = nothing
# try
# Base.@propagate_inbounds
if aContent > bContent # arr[a] > arr[b]
    #Base.@propagate_inbounds
    a,b ,contentSwapped = swapContent(arr[a], arr[b], arr)  #oldSchoolSwap(arr[a], arr[b], arr)  #an inbounds swap #actual array swap
    #contentSwapped = true   #arr[a], arr[b]
else
end
#  end
arr
function calcMiddles(arr::Array{Int64,1})
    return length(arr) - 2
end

if calcMiddles(arr) != 0

    m1, m2, isWhole = calcMiddle(arr)

else
    return

end

#---test
#a, b, m1, m2 = compareQuartet(1, 2, 3, 4, [1 2 3 4]) #correct #UncommentMe

arr = [1, 2, 3, 4]
calcMiddle(a, b, arr)
a = 1
b = 2
m1 = 3
m2 = 4
view(collect(a:b), a:b)
view(arr, a:b)
view(collect(1:2), 1:2)

#testing compareQuartet logic
m1, m2, _isSwapped = doCompare(m1, m2, arr) #view(arr, a:b)) #compare twinMiddles' content
#push!(contentSwapped,_isSwapped)

a, b, _isSwapped = doCompare(a, b, arr) #compare bounds' content

a, m1, _isSwapped = doCompare(a, m1, arr)

m2, b, _isSwapped = doCompare(m2, b, arr)   # Interpretation: context-based  # there is no m2 for
#here you are passing an arr (isWhole : having whole middle) & testing it for a quartet 4-Fractal
# the choice of test is erroneous: only testing compareQuartet if its mid is not isWhole (hence fractional, so that need to floor & ceil )


m1, m2, isWhole = callMiddle(a, b)



#= #UncommentMe
function compareTriad(a, m1, b, arr)
    try
        a, b = doCompare(a, b, view(arr, a:b)) #compare bounds
        a, m1 = doCompare(a, m1, view(arr, a:m1))
        m1, b = doCompare(m1, b, view(arr, m1:b))
        push!(Middles, m1)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end
=#
if isWhole == false # 4 compares
    a, b, m1, m2 = compareQuartet(a, m1, m2, b, arr) # view(arr, a:b)

elseif isWhole == true  # 3 compares
    a, b, m1, m2 = compareTriad(a, m1, b, arr)
end
view(arr, a:b)
getIsWhole(arr)
a, b = doCompare(a, b, arr) #view(arr, a:b)) #compare bounds
a, m1 = doCompare(a, m1, arr) #view(arr, a:m1))
m1, b = doCompare(m1, b, arr) #iew(arr, m1:b))
push!(Middles, m1)

#optional :
deleteat!(Middles, 1) #delete function

middle(a, b)

#Experimental
function middle2!(a::Int64, b::Int64)

    if a != b
        m1, m2, isWhole = middle(a, b)

        ma1, ma2, isWhole_a = middle(a, m1) #left  #make interval: in relation  to a, b
        middle2!(a, m1)
        if isWhole == false
            if m2 != b
                println(euclidDist(m2, b))
                mb1, mb2, isWhole_b = middle(m2, b) #right
                middle2!(m2, b)
            end
        elseif isWhole == true
            if m1 != b
                println(euclidDist(m1, b))
                mb1, mb2, isWhole_b = middle(m1, b)
                middle2!(m1, b)
            end

        else
            return
        end
    elseif a == b
        return a, b
    end

end

middle2(1, 3)
middle2(1, 9) #
middle2!(1, 90)

#Experimental -  Warning!
function callMiddle!(a::Int64, b::Int64, arr::Array{Int64,1})

    m1, m2, isWhole = middle(a, b)

    if isWhole == true  #1 middle

    elseif isWhole == false # 2 middles
        if m2 != b


        else # m2 == b

        end
    end
end


cause(1, 9, 1:9)

ar = [5, 4, 3, 2, 1]
cause(firstindex(ar), lastindex(ar), ar)
ar


ar1 = [3, 2, 1]
cause(firstindex(ar1), lastindex(ar1), ar1)

#---------
#start

currentValue = init(firstindex(ar1), lastindex(ar1)) # 2 i.e.
numMiddles = currentValue #- 1 #FYI

m1, m2, isWhole1 = callMiddle!(firstindex(ar1), lastindex(ar1), ar1) #should be true #true  # odd members have an actual middle

m1, m2, isWhole2 = callMiddle!(1, 4, [1, 2, 3, 4]) # should be false #false #reasoning: Even members don't have actual middle

#find a way to make the following true
xor(isWhole1, isWhole2) == true #close (inverse values ) #now it's correct : correct formula

#---euclidDist

euclidDist(1, 3) # 2 == 3-1  #true
euclidDist(4, 2) # 2 == 4-2 # true

#TODO: Equivalent distances
euclidDist(1, 3) === euclidDist(4, 2) #correct

#------
#Finalize:

ar1
# init(a::Int64, b::Int64)
x = firstindex(ar1)
y = lastindex(ar1)
currentValue = init(x, y) # algorithm knows Apriori number of middles (iterations)
cause(x, y, ar1)
isStop(currentValue)
currentValue #TODO: implement the decrement of currentValue inside
euclidDist(1, 2) #1

endAlgorithmSafely(_view::SubArray)

function getMiddleInterval(a, b) #,_view::SubArray)
    isWhole = getIsWhole(a, b)
    if isWhole == true  #1middle m1
        return endAlgorithmSafely(_view[m1])

    elseif isWhole == false #2middles m1,m2
        #return m1,m2
        return endAlgorithmSafely(_view(m1:m2))

    end
end

#---------
#start
ar1
currentValue = init(firstindex(ar1), lastindex(ar1)) # 1 i.e.
numMiddles = currentValue # 1 #FYI

stopFlag = isStoppingCondition(a, b, currentValue)

m1, m2, isWhole = callMiddle!(firstindex(ar1), lastindex(ar1), ar1) #should be true #true  # odd members have an actual middle
stopFlag = isStoppingCondition(a, b, ar1)
#update currentValue

#checkCurrentValue!(a, b, currentValue)
calcVerteciesLeft!(a, b, isWhole, currentValue)


#TODO: increment currentValue `Accordingly`
b=3

checkCond2(a, m1, m2, b, view(ar1, a:b)) #check & sort content
explore(a, m1, m2, b, view(ar1, a:b))
#correct return [1] , [3]
