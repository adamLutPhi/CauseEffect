
#unused function

#so: no More #iterative function 

#cause meeded to be called, on the next interval (iteratively )
#cause!() that does all: calls itself to proceed, further , into the next interval,
# where you record it's return (next a,b
#in general : there aren't no right or left, only 1 function (2 subsequent effects
# 1.1 1 for the rigth -> calls cause right [m1, b, OR m2,b ]) 
#1.2.  another left ->calls cause left pts (a,m1 always )

# """ called after compare Quartet """
#=
function remapCompare(m2, b, _view::SubArray)

    m2, b = remap(m2, b)
    println(" m2,b = ", m2, b)
    _view = collect(m2:b) |> v-> view(v, firstindex(v):lastindex(v))
    m2, b = doCompare(m2, b, view(_view, m2:b))

end
=#

#helpers of Util file:

#=
    #unused 
    """returns the element, at a specific index"""
function elementOf(arr, n::Int64)

    return first(arr, n)[n] #return the first n elements i.e. 2nd: [1:4] , [1:4][2] = 4

end
=#
#--------

#=
function makeView(ab::UnitRange)#compiles
    a = ab[1]
    b = ab[2]
    println("b = ", b)
    v = collect(a:b)
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


#1 function implementation

function cause!(_stack, kernel)
    if _stack > 0
        interval = pop!(_stack)
        a = interval[1]
        b = interval[2]
        effect!(a, b, kernel)
    end

end

#middle!(1, 3)

function effect!(a, b, _stack, kernel=middle)

    if _stack > 0
        m1, m2, isWhole = kernel(a, b)
        #haandling # traverse 

    end
    # cause!(a, b, _stack, kernel)
end


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

#-----testing
currentValue = nothing
arr = [1, 4, 8]
#calcVerteciesLeft! calls calcTotalMiddles
if currentValue === nothing # or ===
    currentValue = calcTotalMiddles(arr) # #A()= length(arr) - 2  #<------
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

calcVerteciesLeft!(1, 3, nothing) #1 #not correct  #checkCurrentValue!(1,3) #erroneous 
a
b
currentValue
currentValue = calcVerteciesLeft!(a, b, currentValue)

#---
# Cause 


#preferred # d
function cause(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning* # Depreciate 

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
        #       v = collect(a:b) # overdone 
        #_view = view(arr,v)
        #        _view = view(_view,v)

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
        #       v = collect(a:b)
        #_view = view(arr,v)
        #        _view = view(_view,v)

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
a = 1;
b = 9;
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

#------------# infinite loop (no StackOverflowError)

#experimental passing consumed function as input argument parameter # calling kernel in the body
function cause(a::Int64, b::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    currentValue = isStoppingCondition(arr, currentValue) #isStop(a, b, arr) # view #TODO: change to a practical & tested working function (Erroneous function) #untrustworthy #<--------
    condition = handleC - urrentValue(currentValue)
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
#==#


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#= =#
#------------

### A:  calcTotalMiddles

#Depreciate 
#=
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
=#



#------
#compareSort 
#advanced: define a _stack of inputs #TODO: Check 
group = 1 # given group
# TODO pass (or define) a `_stack` [for recursion operator ]
if group == 1 # only 1 per item 
    #complete Triad : [lastB, interval[1], interval[2]

    #GET Last b = currentA #pop!
    interval = length(_stack) > 0 ? pop!(_stack) : return  #<-------
    #form a view from lastB, & interal (midpoint newInterval[1] becomes implicit)
    #view(lastB,interval[2]))
    #lastb = pts[length(pts)-1 #erroneous part
    # _view = view(pts[length(pts)-1]:interval[2], [lastb, interval[1] , interval[2]] )
    #_view = view([lastb, interval[1], interval[2]], [lastb, interval[1], interval[2]])# acceptable? 
    # interval = union(last, interval) #<---------
    lowerBound = interval[1]
    upperBound = interval[2]

    a, m, b = inferLocation(lastB, lowerBound, upperBound)
    interval = union(a, m, b)

    _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))

    #create view with points of lastb, lastrange 
    # Compare(a, b, _view) #
    #sort
    res = compareTriad(a, m, b, _view) #CompareSort(lastb, interval[2], _view) #compareTriad # <----
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
    a = firstindex(_length)
    b = lastindex(_length)
    if _length == 4
        compareQuartet(a, a + 1, b - 1, b, _view)
    elseif _length == 3
        compareTriad(a, b - 1, b, _view)
    elseif _length == 2
        doCompare(a, lastindex(b), _view)
    end
end
# ArgumentError: array must be non-empty

#------


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
#effect #depreciate
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


# isStoppingCondition

function isStoppingCondition(a::Int64, b::Int64, currentValue) #vital

    #m1, m2, isWhole = callMiddle(a, b) #Occurs before this function 
    println("isStoppingCond...  currentValue passed")
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = calcVerteciesLeft!(a, b, currentValue) #checkCurrentValue!(a, b, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    return currentValue #handleCurrentValue(currentValue)


end#----
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

function cause(a::Int64, b::Int64, arr::Array{Int64,1}, currentValue) #working  #uses arr only *Warning*
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

""" A custom counter: an event driven, self-decrementing function  
called upon progess with any  Function Criteria )
initialized automatically, since first run, hence it goes at least once 

checks 
""" # scaffold #light #Best #TODO: depreciate 
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
#------

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
