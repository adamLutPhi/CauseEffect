#unused functions

# no More #iterative function # TODO

#cause meeded to be called, on the next interval (iteratively )
#cause!() that does all: calls itself to proceed, further , into the next interval,
# where you record it's return (next lowerBound,upperBound
#1. in general : there aren't no right or left, only 1 function (2 subsequent effects
# 1.1. for the rigth -> calls cause right [m1, upperBound, OR m2,upperBound ])
#1.2.  another left ->calls cause left pts (lowerBound,m1 always )

#2. makeVector -> collect [built-in]

#3. disccovered: append!(vector1, vector2)

#4. use
# collect
lowerbound = 8; upperbound= 9
v = collect((lowerbound: upperbound)) # [8,9]
    # v = collect((1:_length))  #collect((1:_length))

    #collect((1:_length))

#collect((a, _mop - 1))
collect((lowerbound: upperbound - 1)) # [4,7]
collect((first(v): last(v))) # [8,9]
#newV = collect((lowerboundValue, upperboundValue-1)) # 4 #same as input interval
#newV = collect((lowerbound, upperbound))
newV = collect((lowerbound: upperbound)) # 4

#say we calculated the next kernel value = 5
_next = 5
collect((a: _next - 1)) # vector [1,3] #now gives [2,3]

newV = collect((a, _next))  #- 1)) #[1,3] #experimential : warning
newV = collect((lowerbound: upperbound))  # commit this one  #uncommentMe

lowerbound = [1,4,8][1]
#upperbound = copy(findNext([1, 4, 8], 1)) #+ nextUpperbound #
collect((lowerbound: upperbound)) #define: collect()
"""
nextLowerbound= upperbound + 1
nextUpperbound= findNext([1, 4, 8], firstindex(nextLowerbound))
new = nextLowerbound + nextUpperbound

collect((nextLowerbound, new))
"""
v2=[8,9]
println(v1) #[3, 4, 5, 6, 7]
v = append!(v1,v2) #[first(v2),last(v2)]) # compiles

println("v = ", v)
#v = tuple(v1).push( v2) # LoadError: DimensionMismatch: dimensions must match: a has dims (Base.OneTo(2),), b has dims (Base.OneTo(5),), mismatch at 1
println(a) # a = 1
#v = collect((firstindex([1, 4, 8], lowerbound), lastindex([1, 4, 8], upperbound)))
#v = collect((firstindex([1, 4, 8], lowerbound), firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3]
# collect(([1,4,8][lowerbound],([1,4,8][upperbound])))
# a should be a =[1,2], then _first should be _first = 2
_first = 2 # feed in vector
_n1= append!(a:_first) # compiles

#handle last item
#issue arr ends at 8
# moved to upper scope of the function
#  v = collect((firstindex([1,4,8],nextLowerbound), firstindex([1,4,8],nextLowerbound+1))) #[8,9]

# ========================
# Unknown Function f2
#to be named Meaningfully # uses collect #successs
function f2(i, ar=[1, 4, 8]) #,_first=nothing)#,lst=[])

    if i > ar[1] && i <= length(ar)  #b # i = 2 [4]
        # ar[i]  # 4
        # ar[i]-1 #3 (to be collected with its pair 1)
        if a == 2 # _first === nothing #side correct
            #  _first = ar[i]  # collect((a,_first))
            newV = collect((a, ar[i] - 1)) #secured the first
            # push!(lst, newV)
            #i += 1
            return newV # , i
        end
        #the meat
        # ar[i]  # 8
        ar[i] - 1 # 7

        ar[i-1] # 4
        #println("ar[i-1]=", ar[i-1]) #4
        #println("ar[i]-1=", ar[i]-1)
        #i += 1
        newV = collect((ar[i-1], ar[i] - 1))
        # push!(lst, newV)
        return newV #, i

    else
        return
    end
end

f2(2)
"""
#https://stackoverflow.com/questions/39586830/concatenating-arrays-in-julia
use the
Use the vcat and hcat functions:

# Example
julia> a, b = [1;2;3], [4;5;6]
julia> vcat(a, b)
6-element Array{Int64,1}:
 1
 2
 3
 4
 5
 6
"""
#----------
ar = [1, 4, 8] # collection of cut points
b = 9 # b was set to 2

ar

_lst = vcat(last(ar),b) # [8,9] (Expected) [now last vector is glued]
#_lst = tuple(_lst)
lst = vcat(_1st,lst)
println("_lst",_lst) # #Vector{Int64} # [8,9]

#=
lst = []
#TODO: Inspect this function
for i = 2:3 #starts from 2 , length(ar)
    push!(lst, f2(i))
end
=#
println("lst = ",lst) #  1st =Any[[1, 3], [4, 7]] # Expected
# println("typeof(lst[1]) = ",typeof(lst[1]))  #Vector{Int64}
#concatenate(_1st,_lst)
lst = vcat(lst,_lst)
println("lst = ",lst)

#_1st = push!(ar, b) [8, 9]
println("_lst = ", _lst)
#E(x) = ar  = Any[[1, 3], [4, 7], [8,9]]
#result = vcat(last(_1st),_lst ) # collect(_1st:_lst) #
#result = pushlast(_1st,_lst)

result = vcat(last(_1st),_lst )   #collect(_1st:_lst)

println("result = ",result)
println("ar = ",ar)

#push!(lst, collect(last(ar), b))
println("\nlast(ar) = ",last(ar)) # 8
#ar2 =  collect(last(ar): b) # [8,9]
#lst = append!(lst,ar2)
print("\n1st =",lst) # compiles

#  remapCompare
function remapCompare(m2, upperBound, _view::SubArray)

    m2, upperBound = remap(m2, upperBound)
    println(" m2,upperBound = ", m2, upperBound)
    _view = collect(m2:upperBound) |> v-> view(v, firstindex(v):lastindex(v))
    m2, upperBound = doCompare(m2, upperBound, view(_view, m2:upperBound))

end

#1 function implementation
function cause!(_stack, kernel)
    if _stack > 0
        interval = pop!(_stack)
        lowerBound = interval[1]
        upperBound = interval[2]
        effect!(lowerBound, upperBound, kernel)
    end

end
#helpers of Util file:

    #unused
    """returns the element, at lowerBound specific index"""
function elementOf(arr, n::Int64)
    return first(arr, n)[n] #return the first n elements i.e. 2nd: [1:4] , [1:4][2] = 4
end

#--------

#=
function makeView(ab::UnitRange)#compiles
    lowerBound = ab[1]
    upperBound = ab[2]
    println("upperBound = ", upperBound)
    v = collect(lowerBound:upperBound)
    return view(v, firstindex(v):lastindex(v))
    # return view(collect(ab), (ab)[1]:(ab)[length(ab)])
end

v = collect(1:2)
view(v, 1:2)#done
=#
#=
function makeView(_view::SubArray, range) # Bug # this is not the  the way

    v = @view _view[range]
    return v
end
=#
# ========================
# checkNextView #(question its integrity)

## next View, from lowerBound view, alont
"""main:  checks from only lowerBound view """
function checkNextView(_view)
    if length(_view) === Nothing
        return #-1
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
function checkNextView(_view, lowerBound, upperBound)
    if length(_view) === Nothing
        return # -1 # -1 is part of the old thinking patter
        #but lowerBound view can be at least 3(makes senselength  3->1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) >= 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed))
        println("firstindex(x)+1:lastindex(x)-1", firstindex(x)+1:lastindex(x)-1)
        x = collect(lowerBound:upperBound)

        return view(x, firstindex(x)+1:lastindex(x)-1)
    end
end

""" checks the next view, of type `naive`, via lowerBound function call, recursively

```input:
_view: current, selected view
lowerBound: current Lower Bound
upperBound: current Upper Bound
```

```output:
if

```
"""
function checkNextView!(_view, lowerBound, upperBound) # warning: lowerBound,upperBound unused
    if length(_view) === Nothing
        return #-1
    elseif length(_view) == 1
        #TODO: Contemplate the usefulness of including lowerBound different dataType ( i.e. scalar typeof _view[1] )
        return _view[1]  #scalar: either lowerBound, or upperBound

    elseif length(_view) == 2
        #only return the current _view
        #return
        v = collect(lowerBound:upperBound) #|>
        _view = view(_view, firstindex(v):lastindex(v))
        #TODO: comparebounds
        lowerBound, upperBound, isSwapped = doCompare(lowerBound, upperBound, _view)# compare & sort

        return _view
        #but lowerBound view can be at least 3(makes senselength  3->1 ) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) == 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed)) # can be 3 (3->1 )
        #1 do something useful with new input fetch input
        v = collect(lowerBound:upperBound) # |>

        _view = view(v, firstindex(v):lastindex(v))
        #TODO: compareTriad

        println("firstindex(x)+1:lastindex(x)-1", firstindex(_view)+1:lastindex(_view)-1)
        #2 calculate the next output : using lowerBound naive Algorithm
        lowerBound = first(_view)
        upperBound = last(_view)

        #x = collect(lowerBound:upperBound)
        if lowerBound + 1 <= upperBound - 1 #  boundcheck is required
            #return view(x, firstindex(x)+1:lastindex(x)-1)
            return checkNextView!(_view, lowerBound + 1, upperBound - 1)
        end
    elseif length(_view) == 2 * 2 #
        lowerBound = first(_view)
        upperBound = last(_view)
        m1 = _view[firstindex(_view)+1]
        m2 = _view[lastindex(_view)-1]

        compareQuartet(lowerBound, m1, m2, upperBound, _view)

    elseif length(_view) > 4
        #Subdivide further
    end

end
#=
function checkNextView!(_view)
    if length(_view) # === Nothing isa nothing  #isa nothing
        return #-1
    elseif length(_view) == 1
        #TODO: Contemplate the usefulness of including lowerBound different dataType ( i.e. scalar typeof _view[1] )
        return _view[1]  #scalar: either lowerBound, or upperBound

    elseif length(_view) == 2
        #only return the current _view
        lowerBound = firstindex(_view)
        upperBound = lastindex(_view)
        return _view = collect(lowerBound:upperBound) |> _view -> _view -> view(_view, lowerBound:upperBound)
        #but lowerBound view can be at least 3(makes sense; length  3->1) , or even 2 FOR 1 VIEW (We are finding the nextView )
    elseif length(_view) >= 2 * 2 - 1 # at least the currrent count must be 4 = 2 * 2 (minimum bounds count(to be removed)) # can be 3 (3->1 )
        #1 do something useful with new input fetch input
        lowerBound = firstindex(_view)
        upperBound = lastindex(_view)
        _view = collect(lowerBound:upperBound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        println("firstindex(x)+1:lastindex(x)-1", firstindex(_view)+1:lastindex(_view)-1) #<-------
        #2 calculate the next output : using lowerBound naive Algorithm
        lowerBound = firstindex(_view)
        upperBound = lastindex(_view)

        #x = collect(lowerBound:upperBound)
        if lowerBound + 1 <= upperBound - 1 # m1(/m2)  boundcheck is required
            #return view(x, firstindex(x)+1:lastindex(x)-1)
            return checkNextView!(_view, lowerBound + 1, upperBound - 1)
        end
    end
end
=#
#TODO: CheckNextView: check this Implementation: #note: needcheckNextView to to recursive i.e.
#checkNextView!(_view) #<----------
_view = nothing # TODO: replace with checkNextView!
_view = _view -> checkNextView(_view) #TODO: Complete CheckNextView()  # checks CheckNextView (returns the nextView )

# =================
#-------

function traverse(_stack, lowerBound, upperBound) # traverse , lowerBound,upperBound  #warning lowerBound,upperBound not used #TODO:

    l = length(_stack)
    if l == 1 #evaluate interval
        interval = pop!(_stack) # first Interval [lowerBound,upperBound]
    #do cause
    #        callCause(lowerBound, upperBound, interval) #, _stack)

    elseif l == 2 #works best with 2

        interval = pop!(_stack) # [lowerBound,upperBound]
        #TODO: makeView
        _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view)) |> x -> checkNextView(_view) # TODO check: checkNextView
    #       callCause(lowerBound, upperBound, interval)#, _stack)
    else

        #TOOO: compare : lowerBound[a1,b1], upperBound,# [a2,b2]
       # compareQuartet(lowerBound[1], [2], upperBound[1], upperBound[2])
        ##Create lowerBound view for each interval Point
        lowerBound = popat!(lowerBound, _stack) # [a1,b1]
        _view = collect(lowerBound) |> x -> view(_view, firstindex(_view):lastindex(_view))
        upperBound = popat!(upperBound - lowerBound, stack) # [a2,b2]
        _view = collect(upperBound) |> x -> view(_view, firstindex(_view):lastindex(_view))

        #Hint: better to function call traverse! accepting lowerBound _view for each of lowerBound & upperBound

    end
end

function traverse2!(_stack, kernel)

    l = length(_stack)
    if l == 1 #evaluate interval
        interval = pop!(_stack) # first Interval [lowerBound,upperBound]
        lowerBound = indexOf(interval, interval[1])
        upperBound = indexOf(interval, interval[2])
        #do cause , instead call lowerBound kernet function
        #kernelfunction call
        kernel(lowerBound, upperBound, interval) #, _stack) #TODO: complete: q. what is its  return( should be inner _stack) - with new points

    #cause(interval[id][1], interval[id][upperBound], view(_stack, interval[id][1]:interval[id][upperBound]))
    #end endAlgorithmSafely

    else # >= 2 (i.e. 3, 4, or more )
        #odd/even: divisibility by 2
        isItEven = nothing
        isEven(l) ? isItEven = true : isItEven = false

        # traverse()
        if isItEven == true  # divide by 2 (always )- as it's an Even integer
            n = l // 2 # returns an integer #- turnsout to be the middle # A trivial step (from checking even )
            #idea: generalize to lowerBound partition function
            #(based on lowerBound partition criteria)
            #---- n + n = 2n #-------------
            # _stack[0] # first
            #_stack[n] #middle  # ---- pop this

            ## Fetch from the _stack list, at that new, particular index
            res = popat!(_stack, n) # after pop = 2*n -1 = odd
            res[1] # lowerBound
            res[2] # upperBound
            #call kernet
            # lowerBound,upperBound, at their index location
            kernel(1, res, middle) #TODO: How to finish it (place lowerBound finish condition ) - _stack == [] otherwise redo that
        # fetches lowerBound newer, smaller _stack of rest of the points
        #if index = idx then res[offset],

        #todo: what to do with value (call special kernel function )
        #_stack[2n] # last
        # _stack[length(_stack)]
        # traverse(0, length(_stack), _stack)
        #done on lowerBound higher level:

        #for i in 1:length(_stack)
        #    traverse!(i, _stack)
        # end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is lowerBound middle
            #TODO: traverse middle
        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has lowerBound symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals) , & 1 interval
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right()
        #or can we call directly cause (lowerBound la toute suite)

    end

end

#experimental
function traverse2!(_stack)

    l = length(_stack)
    if l == 1 #evaluate interval
        interval = pop!(_stack) # first Interval [lowerBound,upperBound]
        lowerBound = indexOf(interval, interval[1])
        upperBound = indexOf(interval, interval[2])

        #TODO: use lowerBound, upperBound

        #do cause
        #kernelfunction call
        #  callCause(lowerBound, upperBound, interval) #, _stack) #TODO:

        #cause(interval[id][1], interval[id][upperBound], view(_stack, interval[id][1]:interval[id][upperBound]))
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
            res[1] # lowerBound
            res[2] # upperBound
            # lowerBound,upperBound, at their index location
            kernel(1, res, middle)
            #if index = idx then res[offset],

            #todo: what to do with value (call special kernel function )
            #_stack[2n] # last
            # _stack[length(_stack)]
            # traverse(0, length(_stack), _stack)
            #done on lowerBound higher level:

            #for i in 1:length(_stack)
            #    traverse!(i, _stack)
            # end

        elseif isItEven == false  #odd : 3, 5, 7, 9
            #there is lowerBound middle
            #TODO: traverse middle
        end
        #odd : 3, 5, 7, 9 (  9/3) #least common divison  #lcm

        #via middle implementation : 3=2+1, 5=4+1, 7 = 6+1, 9 = 8+1

        # 5, 7 are Prime : can't be divided
        # 5 has lowerBound symmetry [left] [left] [middle] [right][right]
        #idea: ask, isEven(3) can we divide 3 into 2 (intervals), & 1 interval
        # idea2 [odd]: 3 using three ranges : figure out mid (middle) left , & right ! [Better!]

        #Even: 4,6,8 10 (4/2=2 6/2=3 8/2 =4 10/2=5)
        # idea: for 4 items /2 (2*2 or is it 2^2 ) Evenly divde Into 2 [seperate intervals]
        # so next time, 2 intervals would be Evaluated  (compared) directly
        #(checked if atomic, or not ) [& 2 / 2 = 1 ]
        #maybe left calls left(), right calls right()
        #or can we call directly cause (lowerBound la toute suite)

    end

end
# =================
# remap
function remap(a::Int64, b::Int64) # 1 2  abs(max(a, b) - min(a, b)) + 1 ; 2 -1 = 1 + 1 = 2
    b = euclidDist(a, b) + 1 # + 1 #warning you added 1 to the end: recheck new bounds (are all ranges fit) - some got to be out
    a = 1 #always start at this #or offset
    return a, b
end

remap(1, 10) #missing 1 at last  +1 #fixed
remap(5, 10) # correct
# ================
# requires remap
function compareTriad(a, m1, b, _view) #applied remap
    try

        a, b, _isSwapped = doCompare(a, b, view(_view, a:b)) #compare bounds' content
        a, m1, _isSwapped = doCompare(a, m1, view(_view, a:m1))

        m1, b = remap(m1, b)
        println("@view: m1, b = ", m1, b)
        m1, b, _isSwapped = doCompare(m1, b, view(_view, m1:b)) #<------- remap is required

        #push!(Middles, m1)
        println("a, m1, b = ", a, m1, b)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end

function compareTriad(a, m1, b, arr) #applied remap
    try

        a, b, _isSwapped = doCompare(a, b, arr) #view(_view, a:b)) #compare bounds' content
        a, m1, _isSwapped = doCompare(a, m1, arr) #view(_view, a:m1))

  #      m1, b = remap(m1, b)
  #      println("@view: m1, b = ", m1, b)
  # classical doCompare [--no remap]
        m1, b, _isSwapped = doCompare(m1, b, arr)  #view(_view, m1:b)) #<------- remap is required

        #push!(Middles, m1)
        println("a, m1, b = ", a, m1, b)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end

# =============

# mappedIndex

#newRow = view(arr, mappedIndex:newBound) # want to access sth larger than the () itself
#=UncommentMe
mappedIndex = firstindex(arr) +2  #+ 3 - 1 # firstindex(arr) + intervalBound1 -1
(first(arr, mappedIndex), mappedIndex)

# mappedIndex not defined

#collect(arr, mappedIndex:newBound)
#view(arr, mappedIndex:newBound)

mappedIndex = firstindex(arr) + intervalBound1 - 1 #3
#  if mappedIndex > a && mappedIndex < b
newBound = +(mappedIndex, +1) # add either 0 if count not even, 1 if count is even
mappedIndex = +(mappedIndex, addition) # both equal half the time:
=#
# ---------

#=UncommentMe
if @assert newBound === mappedIndex
    return true
end
if newBound === mappedIndex
    return true
end
println("newMapped index = ", mappedIndex)
=#
# ----
"""arr[mappedIndex]+1 """
function evaluateValue(arr::Array{Int64,1}, mappedIndex::Int64; op=+)
    return op(firstindex(arr, mappedIndex), 1) #,addition) ) #warning: Unassigned operation
end

#Intent: reach last index
mappedIndex = firstindex([1, 4, 8]) # + 2 # -1 # line: for view (only)
mappedIndex = lastindex([1, 4, 8]) # + 2 # -1 # line: for view (only)

# newBound = mappedIndex + 1 # arbitrary function #ERROR: index value is outside the array function
view([1, 4, 8], firstindex([1, 4, 8]): lowerbound) #correct
# v = collect((firstindex([1, 4, 8], lowerbound), firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3] # [1,1]
view([1, 4, 8], (firstindex([1, 4, 8]): lastindex([1,4,8])) ) #1
# newRow = view(arr, mappedIndex:newBound) # want to access sth larger than the () itself
arr = collect(1:9)
newRow = view(arr, mappedIndex-1:mappedIndex) # this works  #[4 8] # Does not Work # Use ObjBounds


#return newRow

# ============================


# ==========================================================

# findSubIntervals

## findSubIntervals
"""event driven function """
function findSubIntervals(arr::Array{Int64,1}, intervalBound1::Int64; op=+) #op can be - too
    #0. init: define variables
    a = firstindex(arr) #unrequired
    b = lastindex(arr)
    count = 0 #1
    lista = []
    intervalBound2 = nothing

    #suggest : another function to handle main bounds :
    #1. checkBound1 logic

        if intervalBound1 >=a  && count ==1
            push!(lista, [a, intervalBound1]) #push first interval

       # elseif intervalBound1 <= b
       #     push!(lista, [intervalBound1,b]) =# #redumdant with intervalBound2
        end

    #2 processing: ADD a new item

    # arr[a] #uncommentMe
    #op(arr[a],a)
    intervalBound2 = op(a, intervalBound1 - 1)
    #intervalBound2 = op(intervalBound1, 1)  #TODO: (,arr[a])  #  increment

    #TODO: if we know distances till the next neighboring number
    #OK

    #=
        if intervalBound2 === nothing
        elseif intervalBound2 !== nothing && intervalBound2< b
        end =#

    #CheckBound
    # index(lista,intervalBound1)
    #if count> 1
    #------
    #---modifyInterval
    if intervalBound2 < b  # cruical #Check #<  as intervalBound2 = intervalBound1-1 default
        count += 1
        print("count = ", count)
        if count % 2 == 0 #if #if even return 1
            addition = 1
        elseif count % 2 != 0 # if it's  odd
            addition = 0
        end
        #--------

        #  push!(lista, [intervalBound2, intervalBound1])
        #tmp = [intervalBound1, intervalBound2]
        # if tmp != [] #!== nothing
        mappedIndex = a + intervalBound1 - 1 # firstindex(arr) + intervalBound1 - 1 #3
        #  if mappedIndex > a && mappedIndex < b
        newBound = op(mappedIndex, +1) # add either 0 if count not even, 1 if count is even

        mappedIndex = op(mappedIndex, addition)
        println("newMapped index = ", mappedIndex)
        println("newBound index = ", newBound)

        #handling scalars i.e. if newBound === mappedIndex

        newRow = arr[mappedIndex:newBound]
        #newRow = [first(arr,mappedIndex), mappedIndex]
        push!(lista, newRow)
        #count += 1
        # else
        #     return
        #elseif tmp === nothing
        #    println("nothing found")
        #end
        # end
    end
    #end

    #3. finalize : if (bound2) is last item
    #=
     elseif intervalBound2 == b
         return lista
         # push!(lista, [b b])
         #push!(lista, [b b])
         #return lista
     end =#
    return lista
end

# index(3,)

#synthetic subinterval
findSubIntervals([1, 2, 3], 1)# [1,2]
findSubIntervals([1, 2, 3], 2)# [2,3]
findSubIntervals([1, 2, 3], 3)# last subinterval (uncalculated) , Done # n#1 thing

_stack = [[1,3],[4,7],[8,9]]
l = copy(length(_stack))
l.*2 #if vector i.e. d=1 : 2 *2

#----------------


#=
r == [] #when return an empty array  this is true
typeof(r)
=#
ar = [4, 5, 3, 6]
tmp = findSubIntervals(ar, 2)
ar = [3, 6, 8] #
ar = sort(ar) # check index 1,2,3
mainstack = []
for i in 1:3
    tmp = findSubIntervals(ar, i) #ar[i])
    if tmp != [] # = nothing
        #typeof(tmp)
        push!(mainstack, tmp)
    end
end

mainstack

# ==========================================================

## findSubIntervals2

function findSubIntervals2(arr::Array{Int64,1}, intervalBound1::Int64; op=+) #op can be - too
    #0. init: define variables
    a = firstindex(arr) #unrequired
    b = lastindex(arr)
    count = 1
    addition = 0
    lista = []
    #intervalBound2 = nothing

    #suggest : another function to handle main bounds :
    #1. checkBound1 logic
    #=
        if intervalBound1 >=a  && count ==1
            push!(lista, [a, intervalBound1]) #push first interval

       #= elseif intervalBound1 <= b
            push!(lista, [intervalBound1,b]) =# #redumdant with intervalBound2
        end
        =#

    #2 processing: ADD a new item

    # arr[a]

    #op(arr[a],a)
    # first Bound
    intervalBound0 = op(firstindex(arr), intervalBound1 - 1) #whats the Utility value of this action:0
    #intervalBound2 = op(intervalBound1, 1)  #TODO: (,arr[a])  #  increment

    #OK
    #=
        if intervalBound2 === nothing # correct condition
        elseif intervalBound2 !== nothing && intervalBound2< b
        end =#

    #Check (Bouh (back?)
    # index(lista,intervalBound1)
    #if count> 1
    if intervalBound1 < b  # cruical #intervalBound0

        count += 2
        if count % 2 == 0
            addition = 1
        elseif count % 2 != 0
            addition = 0
        end
        #  push!(lista, [intervalBound2, intervalBound1])
        #tmp = [intervalBound1, intervalBound2]
        # if tmp != [] #!== nothing
        mappedIndex = op(firstindex(arr), intervalBound1 - 1) #3 d(a,idx)
        #  if mappedIndex > a && mappedIndex < b

        #arr[map]
        newBound = op(mappedIndex, addition)
        # mappedIndex #op(mappedIndex, +1) # add either 0 if count not even, 1 if count is even

        # mappedIndex = # op(mappedIndex, addition)

        println("newMapped index = ", mappedIndex)
        println("newBound index = ", newBound)


        # newRow = arr[mappedIndex:newBound]
        if mappedIndex < b && newBound < b
            newRow = view(arr, mappedIndex:newBound)
            #newRow = [first(arr,mappedIndex), mappedIndex]
            push!(lista, newRow)
        end
        #count += 1
        # else
        #     return
        #elseif tmp === nothing
        #    println("nothing found")
        #end
        # end
    end
    #end

    #3. finalize : if (bound2) is last item
    #=
     elseif intervalBound2 == b
         return lista
         # push!(lista, [b b])
         #push!(lista, [b b])
         #return lista
     end =#
    return lista
end

""" find the subinterval, of an array """
## findSubIntervals3

function findSubIntervals3(arr::Array{Int64,1}, intervalBound1::Int64; op=+) #op can be - too

    #0. init: define variables
    a = firstindex(arr) #unrequired
    b = lastindex(arr)
    count = 1
    addition = 0
    lista = []
    #intervalBound2 = nothing

    #suggest : Another function,  to handle main bounds :
    #1. checkBound1 logic
    #=
        if intervalBound1 >=a  && count ==1
            push!(lista, [a, intervalBound1]) #push first interval

       #= elseif intervalBound1 <= b
            push!(lista, [intervalBound1,b]) =# #redumdant with intervalBound2
        end
        =#

    #2 processing: ADD a new item

    # arr[a]

    #op(arr[a],a)
    # first Bound
    intervalBound0 = op(a, intervalBound1 - 1) #whats the Utility value :0  #depreciate
    #intervalBound2 = op(intervalBound1, 1)  #TODO: (,arr[a])  #  increment
    #OK
    #=
        if intervalBound2 === nothing
        elseif intervalBound2 !== nothing && intervalBound2< b
        end =#

    #CheckBound
    # index(lista,intervalBound1)
    #if count> 1
    if intervalBound1 < b  # cruical #intervalBound0

        count += 2
        if count % 2 == 0
            addition = 1
        elseif count % 2 != 0
        end
            addition = 0
        #  push!(lista, [intervalBound2, intervalBound1])
        #tmp = [intervalBound1, intervalBound2]
        # if tmp != [] #!== nothing
        mappedIndex = op(a, intervalBound1) #3 d(a,idx)
        #  if mappedIndex > a && mappedIndex < b
        #---

        arr[mappedIndex]
        op(firstindex(arr, mappedIndex), 1) #,addition) ) #warning: Unassigned operation

        #preferable DistanceNext
        #newBound = op(mappedIndex, addition)

        #count % 2 == 0 ? newBound = op(mappedIndex, addition) : newBound = op(mappedIndex, 1)
        #---
        #arr[map]
        newBound = op(mappedIndex, addition + 1)
        # mappedIndex #op(mappedIndex, +1) # add either 0 if count not even, 1 if count is even

        # mappedIndex = # op(mappedIndex, addition)

        println("newMapped index = ", mappedIndex)
        println("newBound index = ", newBound)


        # newRow = arr[mappedIndex:newBound]
        if mappedIndex < b && newBound < b
            newRow = view(arr, mappedIndex:newBound)
            #newRow = [first(arr,mappedIndex), mappedIndex]
            push!(lista, newRow)
        end
        #count += 1
        # else
        #     return
        #elseif tmp === nothing
        #    println("nothing found")
        #end
        # end
    end
    #end

    #3. finalize : if (bound2) is last item
    #=
     elseif intervalBound2 == b
         return lista
         # push!(lista, [b b])
         #push!(lista, [b b])
         #return lista
     end =#
    return lista
end
# ==========================================================

findSubIntervals([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) #  Any[[1, 2, 3], 3] # [3, 4]
findSubIntervals([1, 2, 3, 4, 5, 6, 7, 8, 9], 6) # Any[[1, 2, 3, 4, 5, 6], 6] # [6, 7]

#notdefined

findSubIntervals2([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) #  Any[[1, 2, 3], 3] # [3, 4]
findSubIntervals2([1, 2, 3, 4, 5, 6, 7, 8, 9], 6) # Any[[1, 2, 3, 4, 5, 6], 6] # [6, 7]

r = findSubIntervals2([1, 2, 3, 4, 5, 6, 7, 8, 9], 8) # [8, 9]

findSubIntervals3([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) #  Any[[1, 2, 3], 3] # [3, 4]
findSubIntervals3([1, 2, 3, 4, 5, 6, 7, 8, 9], 6) # Any[[1, 2, 3, 4, 5, 6], 6] # [6, 7]

r = findSubIntervals3([1, 2, 3, 4, 5, 6, 7, 8, 9], 8) # [8, 9]

# ==========================================================
# calcTotalMiddles
""" calculate total Middles , between a `lowerBound` & an `upperBound` """

function calcTotalMiddles(lowerBound, upperBound) #name displays what it supposed to do

    res = intervalLength(lowerBound, upperBound) - 2
    println("currentValue (from bound pts to middles left)  = intervalLength(lowerBound, upperBound) - 2 =", res)
    # res >=0 ? return res;  : return nothing
    if res > 0
        return res
    elseif res <= 0
        return 0 #-1
    end
end






arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#= =#
# ==================================

### A:  calcTotalMiddles

#Depreciate

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


# ==================================
# calcVerteciesLeft

## calcVerteciesLeft with a _view & a currentValue
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
    #TODO
end


## calcVerteciesLeft  with an arr
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

# calcVerteciesLeft! #depreciate

#------

""" A custom counter: an event driven, self-decrementing function
called upon progess with any  Function Criteria )
initialized automatically, since first run, hence it goes at least once

checks
""" # scaffold #light #Best #TODO: depreciate

## calcVerteciesLeft  with an arr

function calcVerteciesLeft!(arr::Array{Int64,1}, currentValue) # ,formula)

    #
    # msg = "Unexpected Error"
    isWhole = isEven(length(arr))
    try
        # msg = "Unexpected Error"
        if currentValue === nothing # or ===
            currentValue = calcTotalMiddles(arr) # #A()= length(arr) - 2  #correct move #
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

## calcVerteciesLeft  with a view

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
#=
#requires checkCurrentValue!
calcVerteciesLeft!(1, 3, nothing) #1 #not correct  #checkCurrentValue!(1,3) #erroneous


currentValue = calcVerteciesLeft!(lowerBound, upperBound, currentValue)


# isStoppingCondition

function isStoppingCondition(lowerBound::Int64, upperBound::Int64, currentValue) #vital

    #m1, m2, isWhole = callMiddle(lowerBound, upperBound) #Occurs before this function
    println("isStoppingCond...  currentValue passed")
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = calcVerteciesLeft!(lowerBound, upperBound, currentValue) #checkCurrentValue!(lowerBound, upperBound, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    return currentValue #handleCurrentValue(currentValue)


end
=#
#----

#Vital #contains effect: Depreciate
function traverse(lowerBound, upperBound, _view) #, i)

    #length(_stack) > 1
    # length(_view) !==
    if euclidDistDifference(lowerBound, upperBound) >= 1  # that cindition is too classical
        #the only plac wher we can check the euclid distance
        effect(lowerBound, upperBound, _view)

    end
end

#uses isStoppingCondition, calcVerteciesLeft!, handleCurrentValue
function traverse!(lowerBound, upperBound, _view, currentValue=nothing)  # , i) #TODO: Depreciate #reason: has oldfunction: effect

    currentValue = copy(isStoppingCondition(lowerBound, upperBound, currentValue))
    currentValue = calcVerteciesLeft!(_view, currentValue)
    #calcUnexplored
    ## return handleCurrentValue(currentValue)

    cond = handleCurrentValue(currentValue)
    if cond == false
        effect(lowerBound, upperBound, _view)
    elseif cond == true
        return

    end
    #length(_stack) > 1
    # length(_view) !==
    #if euclidDistDifference(lowerBound, upperBound) >= 1
    #the only place for checking the euclid distance


end

# ============
#kernel #is passed
#isStoppingCondition #is passed (either stop, or continue)



remap(1, 10) #missing 1 at last  +1 #fixed
remap(5, 10) # correct

#Hard-coded values:
lastB = 7
# collect interval
interval = [8,9] # the last one
v = collect(lastB: last(interval) )

#v = collect(min(lastB,last(interval)): max(lastB, last(interval))) #interval[2]) )
#v = collect((lastB:interval[2]))

# checkCond
#checkCond(1, m1, m2, 3, isWhole, [1, 2, 3]) #deprecate
#requires compareQuartet, compareTriad
#lowerBound ::Int64, m1::Int64, m2::Int64, upperBound::Int64, ::Bool, ::Vector{Int64})

# checkCond
function checkCond(lowerBound::Int64, m1::Int64, m2::Int64, upperBound::Int64, arr::Array{Int64,1})
    isWhole = copy(getIsWhole(arr))

    if isWhole == true

        #m region
        #compare content (of 3-Fractal: lowerBound, m, upperBound )

        compareTriad(lowerBound, m1, upperBound, _view) #ok #issue: arr [should be view ] #hillarious : was b1 instead of upperBound    #compareTriad(..,_view)
        newView = view(_view, lowerBound:m1)
        println("CheckCond(): isWhole ==True, lowerBound = ", lowerBound, " m1= ", m1, " newView = ", newView)
        #Ideal return newView
        # goleft!(lowerBound, m1, newView) # middle om am Interval  #using subview  #was lowerBound,m1 #<----- then here (first left I see lowerBound:m1 the same i.e )

        #remap is required
        m1, upperBound = remap(m1, upperBound) #pts remap
        print("remapping m1, upperBound = ", m1, upperBound)
        _view = collect(m1:upperBound) |> v-> view(v, firstindex(v):lastindex(v))

        # view2 = view(_view, m1:upperBound) #issue: building proper view - subarray of an array #was m1,upperBound
        # goright!(view(_view, m1:upperBound)) # middle om am Interval

    elseif isWhole == false
        compareQuartet(lowerBound, m1, m2, upperBound, _view) #compare arr values at 4 index points: lowerBound,m1,m2,upperBound  #ok
        #view1 = view(arr, lowerBound:m1) #correct result
        #Index changes: need for Remapping: m2, upperBound
        #upperBound- m2 #difference
        #the fix for the following view:
        m2, upperBound = remap(m2, upperBound) #done

        _view = collect(m2:upperBound) |> v-> view(v, firstindex(v):lastindex(v))
        #adjust index for merging m1m2 step:
        #m2 -= 1
        #upperBound -= 1
        # upperBound = euclidDistDifference(m2, upperBound) #+1
        # m2 = 1
        view2 = view(_view, m2:upperBound)
        _view = collect(m2:upperBound) |> v-> view(v, firstindex(v):lastindex(v))

        goleft!(view(_view, lowerBound:m1)) #go left iteratively #
        # goright!(view2) ##go left iteratively #

        goright!(view2, remap(m2, upperBound))
    end
end

# ===============
# cause

#preferred # d (reason: uses CurrentValue  )
function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning* # Depreciate

    currentValue = isStoppingCondition(arr, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    condition = handleCurrentValue(currentValue)
    if condition == true
        return #0 #
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, arr, consumedFunction) #, middle)
        #callMiddle!(lowerBound, upperBound, arr) # arr) #TODO: replace with middle + isEven
        checkCond(lowerBound, m1, m2, upperBound, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end

## cause with a currentValue
#preferred
function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, arr) #, middle)
        #callMiddle!(lowerBound, upperBound, arr) # arr) #TODO: replace with middle + isEven
        checkCond(lowerBound, m1, m2, upperBound, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end

function cause(lowerBound::Int64, upperBound::Int64, _view::SubArray, kernel) #in: _view  #uses view #error #no isStop(lowerBound,upperBound,view) ==false


    #isStop(lowerBound, upperBound, view) #Error here
    #isStop(lowerBound, upperBound, view(collect(lowerBound:upperBound), lowerBound:upperBound))
    condition = isStoppingCondition(arr, currentValue) #(lowerBound, upperBound, _view) #isstop(lowerBound, upperBound, _view) #depreciate this  #TODO Questiona: change it ?

    if condition == true # the actual utility of function #out: view : arr , lowerBound:upperBound
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        #kernel function = callMiddle!(lowerBound,upperBound,arr )
        # return callMiddle(lowerBound, upperBound) # m1,m2,isWhole
        #       v = collect(lowerBound:upperBound) # overdone
        #_view = view(arr,v)
        #        _view = view(_view,v)

        m1, m2, isWhole = kernel(lowerBound, upperBound, _view) # arr) #new range new middle #<------------

        #--------
        # lowerBound,upperBound remapping
        #no need, in this context
        #why: the bounds lowerBound,upperBound haven't been updated
        #--------
        checkCond(lowerBound, m1, m2, upperBound, isWhole, _view) #includes: compare values #<----
        return m1, m2, isWhole #TODO: continue logic

    end

    #m1,m2,isWhole = callMiddle() #checkCond(lowerBound,m1,m2,upperBound,view) #is it acceptable to pass it lowerBound view?
end

function cause(lowerBound::Int64, upperBound::Int64, _view::SubArray, kernel) #in: _view  #uses view #error #no isStop(lowerBound,upperBound,view) ==false

    ##if isStop(lowerBound, upperBound, view) == false # continue processing  #callMiddle #checkCond #sub-interval #UncommentMe
    #isStop(lowerBound, upperBound, view) #Error here
    #isStop(lowerBound, upperBound, view(collect(lowerBound:upperBound), lowerBound:upperBound))
    condition = isStoppingCondition(arr, currentValue) #(lowerBound, upperBound, _view) #isstop(lowerBound, upperBound, _view) #depreciate this  #TODO Questiona: change it ?

    if condition == true # the actual utility of function #out: view : arr , lowerBound:upperBound
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        #kernel function = callMiddle!(lowerBound,upperBound,arr )
        # return callMiddle(lowerBound, upperBound) # m1,m2,isWhole
        #       v = collect(lowerBound:upperBound)
        #_view = view(arr,v)
        #        _view = view(_view,v)

        m1, m2, isWhole = kernel(lowerBound, upperBound, _view) # arr) #new range new middle #<------------

        #--------
        # lowerBound,upperBound remapping
        #no need in this context
        #why: the bounds lowerBound,upperBound haven't been updated
        #--------
        checkCond(lowerBound, m1, m2, upperBound, isWhole, _view) #includes: compare values #<----
        return m1, m2, isWhole #TODO: continue logic

    end

    #m1,m2,isWhole = callMiddle() #checkCond(lowerBound,m1,m2,upperBound,view) #is it acceptable to pass it lowerBound view?
end

# =================
""" quantitatively, compare values , returns lowerBound qualitative value """
function inferLocation(lowerBound, upperBound, x)

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
            throw(error("Different Bounds are equal "))
        end
    catch EqualBoundsError
        @error "EqualBoundsError : Different Bounds,which should be different, are equal " (EqualBoundsError, catch_backtrace())
    end
end
#------
#compareSort
#advanced: define lowerBound _stack of inputs #TODO: Check
group = 1 # given group
# TODO pass (or define) lowerBound `_stack` [for recursion operator ]
if group == 1 # only 1 per item
    #complete Triad : [lastB, interval[1], interval[2]

    #GET Last upperBound = currentA #pop!
    interval = length(_stack) > 0 ? pop!(_stack) : return  #<-------
    #form lowerBound view from lastB, & interal (midpoint newInterval[1] becomes implicit)
    #view(lastB,interval[2]))
    #lastb = pts[length(pts)-1 #erroneous part
    # _view = view(pts[length(pts)-1]:interval[2], [lastb, interval[1] , interval[2]] )
    #_view = view([lastb, interval[1], interval[2]], [lastb, interval[1], interval[2]])# acceptable?
    # interval = union(last, interval) #<---------
    lowerBound = interval[1]
    upperBound = interval[2]

    lowerBound, m, upperBound = inferLocation(lastB, lowerBound, upperBound)
    interval = union(lowerBound, m, upperBound)

    _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))

    #create view with points of lastb, lastrange
    # Compare(lowerBound, upperBound, _view) #
    #sort
    res = compareTriad(lowerBound, m, upperBound, _view) #CompareSort(lastb, interval[2], _view) #compareTriad # <----
    return res
    # group = 0
elseif group == 2
    #Calls compare Quartet
    #sth useful
    #TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

    #  _view = view(lastA:interval[2], [lastA,lastB, interval[1], interval[2]])
    #_view = ptsToViews(pts[length(pts)-1-1])
    #union()
    #_view = view([pts[length(pts)-1-1], pts[length(pts)-1], interval[1], interval[2]],
    #    pts[length(pts)-1-1]:interval[2])
    collection = collect(length(pts)-1-1:interval[2])
    _view = collection |> _view -> view(_view, firstindex(_view):lastindex(_view))
    _view = collect(length(pts)-1-1:interval[2]) |> _view -> view(_view, firstindex(_view):lastindex(_view))
    # _view = view(pts[length(pts)-1-1]:interval[2], [pts[length(pts)-1-1],  pts[length(pts)-1], interval[1], interval[2]])
    Collection
    _length = copy(length(collection))
else
    _view = collect(firstindex(_length):lastindex(_length)) |> _view -> view(_view, firstindex(_view):lastindex(_view))
    lowerBound = firstindex(_length)
    upperBound = lastindex(_length)
    if _length == 4
        compareQuartet(lowerBound, lowerBound + 1, upperBound - 1, upperBound, _view)
    elseif _length == 3
        compareTriad(lowerBound, upperBound - 1, upperBound, _view)
    elseif _length == 2
        doCompare(lowerBound, lastindex(upperBound), _view)
    end
end
# ArgumentError: array must be non-empty

#---------
# partition

#uses calcVerteciesLeft
"""partition uses kernel, calcVerteciesLeft!, processRightSide, compareBounds, traverseLeft """
function partition(lowerBound::Int64, upperBound::Int64, currentValue, kernel=middle)

    m1, m2, isItEven = kernel(lowerBound, upperBound) # here, we dunno if it's singleMiddle or twinMiddles

    # currentValue = calcVerteciesLeft!(lowerBound, upperBound, currentValue) # valuable utility # errorneous# Unused
    #Infered Rule 1: left side is always lowerBound, m1

    # Inferred rule 2    right side upperBound is always last

    #Right-side Processing  #partitioning
    #depreciate
    # processRightSide(isItEven, m1, m2, upperBound)

    #finally,

    ##Left-side Processing
    _view1 = collect(lowerBound:m1) |> _view -> view(_view, firstindex(_view):lastindex(_view))


    compareBounds(lowerBound, m1, _view)
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
    traverseLeft(lowerBound, m1 - 1)
    #singleMiddle: m1
    if isItEven == true
        #nextInterval remapping: m1, upperBound
        # m1, upperBound = remap(m1, upperBound) # why remap here
        _view = collect(m1:upperBound) |> v -> view(v, firstindex(v):lastindex(v))
        #Todo: call
        lowerbound = 0
        upperbound = 0
        pts = []
        if lowerBound < m1 - 1 # 2 # lowerBound, m1-1
            lowerbound = lowerBound
            upperbound = m1 - 1
            traverseRight(lowerbound, upperbound)
            push!(pts, lowerbound)
            push!(pts, upperbound)

        elseif lowerBound == m1 - 1 # 1  # lowerBound
            lowerbound = lowerBound
            upperbound = lowerBound
            push!(pts, lowerbound)
            #upperBound is possible uncompared #TOOO: add lowerBound  bool flag
        end
        _view1 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        compareBounds(lowerbound, upperbound, _view1)
        # compare lowerBound, m1-1
        if m1 < upperBound # +2 : m1, upperBound
            lowerbound = m1
            upperbound = upperBound
            push!(pts, lowerbound)
            push!(pts, lowerbound)
        elseif m1 == upperBound # m1 == upperBound  # + 1  : upperBound
            lowerbound = upperBound
            upperbound = upperBound
            #upperBound is uncompared #TOOO: add bool flag
        end # m1 , upperBound
        _view2 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        compareTriad(lowerbound, upperbound, _view1)
        #compareBounds(lowerbound, upperbound, _view1)
        #TODO: finalize : check if there is lowerBound lowerBound true bool value i.e. there exists some uncompared bool flag
        # if ther is , then the sole point has got to be compared with with the other interval
        #
        #twinMiddle: m1 , m2
    elseif isItEven == false

        lowerbound = 0
        upperbound = 0
        if lowerBound < m1 - 1
            lowerbound = lowerBound
            upperbound = m1 - 1
            traverseRight(lowerbound, upperbound)
        else
            lowerbound = lowerBound
            upperbound = lowerBound

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

        if m2 + 1 < upperBound
            lowerbound = m2 + 1
            upperbound = upperBound
            traverseRight(lowerbound, upperbound)
            #  _view3 = collect(lowerbound:upperbound) |> x -> view(x, firstindex(x): lastindex(x))
        else
            lowerbound = upperBound
            upperbound = upperBound
        end
        _view3 = collect(lowerbound:upperbound) |> _view -> view(_view, firstindex(_view):lastindex(_view))
        #TODO: use _view3
    else
        throw(error(msg))
    end

end

#-------
# isStop

#depreciate
""" Calculate the Stopping Condition function, by  comparison """
# isStop
function isStop(a, b, arr::Array{Int64,1}; offset=1) #TODO :  euclidDist , doCompare  #review#2: in this instance, offset is valid  #review#2
    try
        safelyReturns = nothing
        distance = euclidDist(a, b) #; offset) #checks distance  <--potential error corrected
        if distance == 0
            #Scalar: register index as a leaf (in leaf index ?)
            #safelyReturns = true #TODO: place index in a leafIndex?  #uncommentMe
            safelyReturns = true #false #true
            return safelyReturns #0 # safelyReturns
        #endAlgorithmSafely() #returns 0
        elseif distance == offset # Pair(1 between): #+ 1 #2 default  #couple a,b, 1 interval #correct
            # doCompare(a, b, arr) #local sort #light #uncommentMe
            safelyReturns = true #false #true
            return endAlgorithmSafely(arr) # safelyReturns uncommentMe
            #endAlgorithmSafely(arr)#upon change show that part ! <-----review#2: errors out
            return safelyReturns
        elseif distance > offset #TODO: #a divsible Interval (2 or more )  # euclidDist(1,4) = 3 > 1 true
            safelyReturns = false #true #false
            return safelyReturns
            # explore!(a, b, arr) # copy / paste in the higher coding block where function calls it
        else
            throw(error("Unexpected Error occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace())
    end
end


"""stopping function for comparison """
function isStop(a, b, arr; offset=1) #TODO :  euclidDist , doCompare  #review#2: in this instance, offset is valid  #review#2
    try
        safelyReturns = nothing
        distance = euclidDist(a, b) #; #; offset) #checks distance  <--potential error corrected  # offset) #checks distance  <--potential error corrected
        if distance == 0
            #Scalar: register index as a leaf (in leaf index ?)
            #safelyReturns = true #TODO: place index in a leafIndex?  #uncommentMe
            safelyReturns = true #false #true
            return safelyReturns #0 # safelyReturns
        #endAlgorithmSafely() #returns 0
        elseif distance == offset # Pair(1 between): #+ 1 #2 default  #couple a,b, 1 interval #correct
            # doCompare(a, b, arr) #local sort #light #uncommentMe
            safelyReturns = true #false #true
            return endAlgorithmSafely(arr) # safelyReturns uncommentMe
            #endAlgorithmSafely(arr)#upon change show that part ! <-----review#2: errors out
            return safelyReturns
        elseif distance > offset #TODO: #a divsible Interval (2 or more )  # euclidDist(1,4) = 3 > 1 true
            safelyReturns = false #true #false
            return safelyReturns
            # explore!(a, b, arr) # copy / paste in the higher coding block where function calls it
        else
            throw(error("Unexpected Error occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace())
    end
end

#depreciate

# isStop for a view
function isStop(a, b, _view)
    try
        safelyReturns = nothing
        distance = euclidDist(a, b) #; offset) #checks distance  <--potential error corrected
        if distance == 0
            #Scalar: register index as a leaf (in leaf index ?)
            #safelyReturns = true #TODO: place index in a leafIndex?  #uncommentMe
            safelyReturns = true #false #true
            return safelyReturns #0 # safelyReturns
        #endAlgorithmSafely() #returns 0
        elseif distance == offset # Pair(1 between): #+ 1 #2 default  #couple a,b, 1 interval #correct
            # doCompare(a, b, _view) #local sort #light #uncommentMe
            safelyReturns = true #false #true
            return endAlgorithmSafely(_view) # safelyReturns uncommentMe
            #endAlgorithmSafely(_view)#upon change show that part ! <-----review#2: errors out
            return safelyReturns
        elseif distance > offset #TODO: #a divsible Interval (2 or more )  # euclidDist(1,4) = 3 > 1 true
            safelyReturns = false #true #false
            return safelyReturns
            # explore!(a, b, _view) # copy / paste in the higher coding block where function calls it
        else
            throw(error("Unexpected Error occured"))
        end
    catch UnexpectedError
        @error "Unexpected Error occured" exception = (UnexpectedError, catch_backtrace())
    end
end

# callMiddle!

## callMiddle! for an Array

#experimental : TODO: Complete Skip for now

@propagate_inbounds function callMiddle!(a::Int64, b::Int64, arr::Array{Int64,1})
    try
        # Reviewr#2: removed distance() should be here ( distance is only in isStop )
        #distance = euclidDist(a,b) # response = isStop(a, b, arr)

        if a != b && a > 0 && b > 0 # only required
            #contentSwapped = []  #nothing
            # _isSwapped = nothing
            m1, m2, isWhole = middle(a, b) #gets middle of a length (in rational positive integer ) <---ERROR: no iterate(Nothing)

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


## callMiddle! for a view

@propagate_inbounds function callMiddle!(a::Int64, b::Int64, _view::SubArray)
    try
        # Reviewr#2: removed distance() should be here ( distance is only in isStop )
        #distance = euclidDist(a,b) # response = isStop(a, b, arr)

        if a != b && a > 0 && b > 0 # only condition we require
            #contentSwapped = []  #nothing
            # _isSwapped = nothing
            m1, m2, isWhole = middle(a, b) #gets middle of a length (in rational positive integer ) <---ERROR: no iterate(Nothing)

            #check
            view1 = view(_view, a, b)

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
            #register as a leaf (binTree)
            return 0, 0, nothing # 0, 0, 0 # depends on Expected return return

        else
            throw(error("UnexpectedError occured"))
        end
    catch UnexpectedError
        @error "UnexpectedError occured" exception = (UnexpectedError, catch_backtrace())
    end
end

# ================
#=UncommentMe
compareBounds([1, 2], [3, 4], [1, 2, 3, 4]) # 1 4 2 3 # corrected

compareBounds([1, 2], [3, 4], [1, 2, 3, 4]) #compareQuartet: doCompare
=#
# checkCondition

function checkCondition(lowerBound::Int64, m1::Int64, m2::Int64, upperBound::Int64, arr::Array{Int64,1}) #error #subtle

    lowerbound = m1 - 1 #m1-1
    upperbound = nothing #m2+1
    if cond == true  #2 twin middles m1,m2: next check bounds lowerBound,m1 m1, upperBound
        upperbound = m1 + 1
        # doCompare(lowerBound,m1)
        doCompare(lowerBound, m2, arr) #uses arr
        #doCompare(lowerBound,upperBound)
        #docompare(m1,m2)
        compareQuartet(lowerBound, m1, m2, upperBound, arr)

        if lowerBound < lowerbound # m1 - 1 #
            v, _view = newView(lowerBound, lowerbound)
            compareBounds(v[1], v[2], _view)
            #=elseif lowerBound == m1 - 1
                v, _view = newView(lowerBound, m1)
                compareBounds(v[1], v[2], _view) =#
        elseif lowerBound == lowerbound # m1 - 1
            v, _view = newView(lowerBound, lowerBound)
            compareBounds(v[1], v[2], _view)
        end

        v, _view = newView(m1, m2)
        compareBounds(v[1], v[2], _view)

        if upperbound < upperBound
            v, _view = newView(upperbound, upperBound)
            compareBounds(v[1], v[2], _view)
        elseif upperbound == upperBound
            v, _view = newView(upperBound, upperBound)
            compareBounds(v[1], v[2], _view)
        end


    elseif cond == false  #isEven(lowerBound,upperBound) == #one middle m1 (with lowerBound,upperBound)
        # 1,3  4, 7 , 8, 9
        upperbound = m2 + 1
        if lowerBound < lowerbound  #m - 1
            v, _view = newView(lowerBound, lowerbound) #  lowerBound != m1-1 or lowerBound< m -1
            compareBounds(v[1], v[2], _view)
        elseif lowerBound == lowerbound
            v, _view = newView(lowerBound, lowerBound) #  lowerBound != m1-1 or lowerBound< m -1
            compareBounds(v[1], v[2], _view)
        end
        v, _view = newView(m1, m2) # 4, 7
        compareBounds(v[1], v[2], _view)

        if upperbound < upperBound
            v, _view = newView(upperbound, upperBound) # 8, 9
            compareBounds(v[1], v[2], _view)
        elseif upperbound == upperBound
            v, _view = newView(upperBound, upperBound) # 8, 9
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

#newView = view(collect((lastB, interval[2])), collect((lastB:interval[2]))) # view(pts[lastB], interval[1]: interval[2])
=#
