
#-----testing
msg = "ERROR: Unexpected Error Occured"
currentValue = nothing
arr = [1, 4, 8]
#middle!(1, 3)

import causeEffect

causeEffect.
""" catches an error with a specified error, and displaying elaboration message """
function writeError(msg,_error= UnexpectedError, elaboration=": please check then try again ")
    catch _error # UnexpectedError
        @error msg * elaboration exception = (UnexpectedError, catch_backtrace())
    end
end

function isTrue(valor) #TODO:debug
    valor == true
        return true
    valor == false
        return false
    else
        writeError(msg) #,_error , elaboration
    end

end


function isNothing(valor) #TODO:debug
    try
        response = nothing
        if valor === nothing
            response = true
        elseif valor !== nothing
            response = false
        else
            writeError(msg )
        end
        return currentValue
    end
end

#------

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
#------


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

#----------------

println("lowerBound",lowerBound)
println("upperBound", upperBound)
println("currentValue",currentValue)


#----------------

#---
# Cause



#TODO:

lowerBound = 1;
upperBound = 9;

view(collect(lowerBound:upperBound), (lowerBound:upperBound))
#cause(lowerBound, upperBound, view(collect(lowerBound:upperBound), lowerBound:upperBound), middle) #TODO:uncomment Me

#currentValue
# init
#before first cause, call init
function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1})#, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #(lowerBound, upperBound, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = callMiddle!(lowerBound, upperBound, arr) # arr)
        checkCond(lowerBound, m1, m2, upperBound, isWhole, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end
#strategy pass-in an arr, for now  #

#------------# infinite loop (no StackOverflowError)
#=
#experimental passing consumed function as input argument parameter # calling kernel in the body
function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    currentValue = isStoppingCondition(arr, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    condition = handleC - urrentValue(currentValue)
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, arr, consumedFunction) #middle)
        #callMiddle!(lowerBound, upperBound, arr) # arr) #TODO: replace with middle + isEven
        checkCond(lowerBound, m1, m2, upperBound, arr) #includes: compare values #<---- #checkCond2
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end
=#

#new : use of kernel as input  #TODO:
function cause(pts, _view::SubArray, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        lowerBound = pts[1]
        upperBound = pts[2]
        m1, m2, isWhole = kernel(lowerBound, upperBound, _view) # arr) #correct
        # checkCond(lowerBound, m1, m2, upperBound, _view) #includes: compare values #<---- #checkCond2
        # compareBounds(lowerBound,upperBound,_view)
        #Pts...sth #TODO: recheckc

        #TODO: traverse(pts)
        if isEven(lowerBound, upperBound) == true #1 middle m1
            compareBounds(lowerBound, m1, upperBound, _view)

            #  compareBounds(lowerBound, m1)
        else
            #return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
            #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
            # isStop(1, 2, view([1, 2], 1:2)) #was
        end
    end
end

#-------------


#effect #depreciate
""" from arr , get the view(arr, lowerBound:upperBound)"""
function effect(lowerBound::Int64, upperBound::Int64, _view::SubArray) # = view(_view, lowerBound, upperBound))

    #to subarray the view
    #=
    condition = isStop(lowerBound, upperBound, _view)
    if condition == true
        return
    elseif condition == false
    =#
    #lowerBound != upperBound ?
    #cause(offset, length(_view), _view) #view(_view, lowerBound:upperBound)) #: return  # cause(lowerBound, upperBound, view(_view, lowerBound:upperBound))  #<-------
    cause(lowerBound, upperBound, _view)
    #end
end
#cause

#check both funcs below are identically equal
#Rule: cause must always get the updated lowerBound & upperBound (of the current view )

function cause(lowerBound::Int64, upperBound::Int64, _view::SubArray) #in: _view  #uses view #error #no isStop(lowerBound,upperBound,view) ==false
    ##if isStop(lowerBound, upperBound, view) == false # continue processing  #callMiddle #checkCond #sub-interval #UncommentMe
    #isStop(lowerBound, upperBound, view) #Error here
    #isStop(lowerBound, upperBound, view(collect(lowerBound:upperBound), lowerBound:upperBound))
    condition = stoppingCondition(lowerBound, upperBound, _view) #isstop(lowerBound, upperBound, _view) #depreciate this  #TODO Questionale change it

    if condition == true # the actual utility of function #out: view : arr , lowerBound:upperBound
        return #0 #last return #correctChoice
    elseif condition == false
        #elseif condition == false
        # return callMiddle(lowerBound, upperBound) # m1,m2,isWhole
        m1, m2, isWhole = callMiddle(lowerBound, upperBound) # arr) #new range new middle
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
# experimental
function effect!(lowerBound, upperBound, _stack, kernel=middle)

    if _stack > 0
        m1, m2, isWhole = kernel(lowerBound, upperBound)
        #haandling # traverse

    end
    # cause!(lowerBound, upperBound, _stack, kernel)
end


currentValue
#  cause
# init
#before first cause, call init
function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1})#, currentValue) #working  #uses arr only *Warning*
    condition = stoppingCondition(lowerBound, upperBound, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = callMiddle(lowerBound, upperBound) # arr)
        checkCond(lowerBound, m1, m2, upperBound, isWhole, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end
#strategy pass-in an arr, for now  #

function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1}, currentValue) #working  #uses arr only *Warning*
    condition = isStoppingCondition(arr, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = callMiddle(lowerBound, upperBound) # arr)
        checkCond2(lowerBound, m1, m2, upperBound, arr) #includes: compare values #<----
        return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end
#effect
""" from arr , get the view(arr, lowerBound:upperBound)"""
function effect(lowerBound::Int64, upperBound::Int64, _view::SubArray) # = view(_view, lowerBound, upperBound))
    #to subarray the view
    #=
    condition = isStop(lowerBound, upperBound, _view)
    if condition == true
        return
    elseif condition == false
    =#
    #lowerBound != upperBound ?
    #cause(offset, length(_view), _view) #view(_view, lowerBound:upperBound)) #: return  # cause(lowerBound, upperBound, view(_view, lowerBound:upperBound))  #<-------
    cause(lowerBound, upperBound, _view)
    #end
end

#------
# cause
"""Event-Driven function  """
function cause(lowerBound::Int64, upperBound::Int64, _view, kernel, currentValue, i) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, _view, i) # arr) #correct
        # checkCond(lowerBound, m1, m2, upperBound, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2

        checkCondition(lowerBound, m1, m2, upperBound)

    end
end

"""Event-Driven function  """
function cause(lowerBound::Int64, upperBound::Int64, arr, kernel, currentValue, i) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, arr, i) # arr) #correct
        # checkCond(lowerBound, m1, m2, upperBound, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2

        checkCondition(lowerBound, m1, m2, upperBound)

    end
end

function cause(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1}, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(arr, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, arr) # arr) #correct
        # checkCond(lowerBound, m1, m2, upperBound, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2

        checkCondition(lowerBound, m1, m2, upperBound)

    end
end

#preferred
function cause(lowerBound::Int64, upperBound::Int64, _view::SubArray, kernel, currentValue) #working  #uses arr only *Warning*

    condition = isStoppingCondition(_view, currentValue) #isStop(lowerBound, upperBound, arr) # view #TODO: change to lowerBound practical & tested working function (Erroneous function) #untrustworthy #<--------
    if condition == true
        return #0
    elseif condition == false
        m1, m2, isWhole = kernel(lowerBound, upperBound, _view) # arr) #correct
        # checkCond(lowerBound, m1, m2, upperBound, _view) #includes: compare values #<---- #checkCond2
        #check new bounds m1 m2
        cond = copy(isEven(lowerBound, upperBound))
        if cond == true  #2 middle m1: next check bounds lowerBound,m1 m1, upperBound

            v, _view = newView(lowerBound, m1)
            compareBounds(v[1], v[2], _view)

            #v, _view = newView(m1, m2)
            #compareBounds(v[1], v[2], _view)

            v, _view = newView(m2, upperBound)
            compareBounds(v[1], v[2], _view)

        elseif cond == false  #isEven(lowerBound,upperBound) == #twin middles
            # 1,3  4, 7 , 8, 9

            if lowerBound < m - 1
                v, _view = newView(lowerBound, m1 - 1) #  lowerBound != m1-1 or lowerBound< m -1
                compareBounds(v[1], v[2], _view)
            end
            v, _view = newView(m1, m2) # 4, 7
            compareBounds(v[1], v[2], _view)

            if m2 + 1 < upperBound
                v, _view = newView(m2 + 1, upperBound) # 8, 9
                compareBounds(v[1], v[2], _view)
            end
        end

        #return m1, m2, isWhole #simulates returning sth vvaluable # idea: isFinishedFlag ::Bool
        #isStop(lowerBound, upperBound, view(arr, lowerBound:upperBound))  #working  #correct use of view (on arr, from lowerBound, to upperBound) #view(collect(lowerBound:upperBound), lowerBound:upperBound)) #atomic operation only allowed
        # isStop(1, 2, view([1, 2], 1:2)) #was

    end
end

#--------
#preferred
function effect(lowerBound::Int64, upperBound::Int64, arr::Array{Int64,1}, kernel, currentValue)

    cause(lowerBound, upperBound, arr, kernel, currentValue)
end

function effect(lowerBound::Int64, upperBound::Int64, _view::SubArray, kernel, currentValue)

    cause(lowerBound, upperBound, _view, kernel, currentValue)
end


function effect(a, b, view = view(arr, a, b))
    cause(a, b, view)
end

# ==================================================
#applied space: Materialized

function goleftVector(a, b, arr) #tobeRemoved
    #fix a , decrease b
    #condition = areInbounds(a, b, arr)
    # if areInbounds(a, b, arr) == true
    return cause(a, b - 1, arr) #causeVector(a, b - 1, arr)   #or is it effect?  #<------
end

function gorightVector(a, b, arr)
    #fix b, increase a

    return cause(a+1, b, arr) #causeVector(a + 1, b, arr) #or is it effect?

end


#compareTriad functions : doCompare ,  push!(Middles, m1)
""" returned structure would be m1 in the middle, a on the left (min), b on the right (max)"""
#_type = typeof(arr)

# =========================
function compareTriad(a, m1, b, arr::Array{Int64,1})
    try

        a, b, _isSwapped = doCompare(a, b, arr)#view(arr, a:b)) #compare bounds
        a, m1, _isSwapped = doCompare(a, m1, arr) #view(arr, a:m1))

        #no need for remap, (context: arr is giiven, & not altered in this one - remap not needed at all )
        m1, b, _isSwapped = doCompare(m1, b, arr) #view(arr, m1:b))

        # push!(Middles, m1)
        println("a, m1, b = ", a, " ", m1, " ", b)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end



function compareTriad(a, m1, b, _view)
    try
        #instead of these
        # compareTriad(a, m1, b, arr)

        a, b, _isSwapped = doCompare(a, b, _view)#view(arr, a:b)) #compare bounds #<----
        a, m1, _isSwapped = doCompare(a, m1, _view) #view(arr, a:m1))
        m1, b, _isSwapped = doCompare(m1, b, _view) #view(arr, m1:b))

        #push!(Middles, m1) # TODO: push _isSwapped
        println("a, m1, b = ", a, " ", m1, " ", b)
        return a, b, m1
    catch UnexpectedError
        @error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
    end
    #return a, b, m1
end
# =========================

m1, m2, isWhole = callMiddle(1, 1) #issue: this returns 2 , while main function expects 3 return arguments

#demo:

m1, m2, isWhole = callMiddle(firstindex(arr), lastindex(arr)) #was callMiddle(a, b, arr) #old thinking


#----

# 5 6 7 8 9 0
# 1 2 3 4 5 6

#-------

arr #where b is 9
#a=firstindex(arr)#1
#b=lastindex(arr)# 9
a = 1
b = 8
arr = [1, 2, 3, 4, 5, 6, 7, 8]
m1, m2, isWhole = callMiddle(a, b) #, arr) #TODO: callmiddle with arr

#-------


## ranges on lowerBound vector array
"""Recursive function : compares lowerBound bounds in ranges of lowerBound Vector arr """
function boundComparisonCondition(ranges, arr) # promising
    try
        # for i in 1:length(ranges)
        _length = legnth(arr)
        i = _length #  # i is inferred by the length of arr
        if i == 1
            return
        end
        _last = copy(length(ranges) - 1)

        lowerBound = max(ranges[i-1][_last])
        upperBound = min(ranges[i][1])
        contentSwapped = nothing
        if i >= 2 && lowerBound < upperBound # max(lastRange) # if i>=1
            lowerBound, upperBound, contentSwapped = doCompare(lowerBound, upperBound, arr) # <-----------
        #  return lowerBound, upperBound, contentSwapped

        else
            throw(error(msg))
        end
        _view = view(collect(1:_length-1), 1:_length-1)
        return boundComparisonCondition(ranges, _view) #lowerBound, upperBound, contentSwapped
    catch UnexpectedError
        @error msg exception = (UnexpectedError, catch_backtrace())
    end

end

## ranges on lowerBound _view

"""Recursive function : compares lowerBound bounds in ranges of lowerBound Vector _view """
function boundComparisonCondition(ranges, _view) # promising

    try
        # for i in 1:length(ranges)
        _length = legnth(_view)
        i = _length  # i is inferred by the length of lowerBound _view
        if _length == 1
            return
        end
        _last = copy(length(ranges) - 1)

        lowerBound = nothing
        upperBound = nothing

        contentSwapped = nothing
        if i >= 2 && lowerBound < upperBound # max(lastRange) # if i>=1
            lowerBound = max(ranges[i-1][_last])
            upperBound = min(ranges[i][1])
            lowerBound, upperBound, contentSwapped = doCompare(lowerBound, upperBound, _view) # <-----------
        #  return lowerBound, upperBound, contentSwapped

        else
            throw(error(msg))
        end

        _view = view(collect(1:_length-1), 1:_length-1)
        return boundComparisonCondition(ranges, _view) #lowerBound, upperBound, contentSwapped
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

    lowerBound = _unsortedInterval[1]
    upperBound = _unsortedInterval[2]
    #1. sort lowerBound,upperBound , locally , so that lowerBound : local min, upperBound: local max
    lowerBound, upperBound, contentSwapped = doCompare(lowerBound, upperBound, _unsortedInterval)

    # locally sort _unsortedInterval elemts pairwise with their sorted counterparts
    lowerBound, _sortedInterval1[2], _sortedInterval2[2] = compareTriad(lowerBound, _sortedInterval1[2], _sortedInterval2[2], arr)

    upperBound, _sortedInterval1[1], _sortedInterval2[1] = compareTriad(upperBound, _sortedInterval1[1], _sortedInterval2[1], arr)


end

"""combines 2 different locally sorted, intervals, with an unsorted Interal """
function minimax(_sortedInterval1, _sortedInterval2, _unsortedInterval, arr) #Warning : arr is unused # depreciate

    # unsorted component underquested
    #1. locally sort the unsorted Interval
    lowerBound = _unsortedInterval[1] #aContent  (min of first interval )
    upperBound = _unsortedInterval[2]# bContent  (max of 2nd interval )

    #1. sort lowerBound,upperBound , locally , so that lowerBound : local min, upperBound: local max
    lowerBound, upperBound, contentSwapped = doCompare(lowerBound, upperBound, _unsortedInterval)

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
    lowerBound, _sortedInterval1[2], _sortedInterval2[2] = compareTriad(lowerBound, _sortedInterval1[2], _sortedInterval2[2], _arr)

    upperBound, _sortedInterval1[1], _sortedInterval2[1] = compareTriad(upperBound, _sortedInterval1[1], _sortedInterval2[1], _arr)

    # P.s: compareTriad: returns an index

    # or, as an online learner About Location, we can , logically infer location,correctly
    #how: by inferring (invoke: infer location , for any three indices : output returs the sorted )
    lower = _sortedInterval1[1] # lowerContent
    upper = _sortedInterval2[2]# upperContent
    lowerBound = _arr[lowerBound]

    lower, upper, lowerBound = inferLocation(lower, upper, lowerBound) # compare contents
    upperBound = _arr[upperBound]
    lower, upper, upperBound = inferLocation(lower, upper, upperBound)

end

#=
either we compare the 3 contents on their on, once & for all [classic]
or, we can online learn x's location from already mde predicates [dynamic]
=#



# we don't knowif lowerBound , upperBound are the actual bounds
# what we know for sure: lowerBound,upperBound are sorted and in the right order
#=
each item has to be replaced: lowerBound upperBound c

each move transition from oldIndexlocation, to lowerBound new onr

given that we already inferred

new location is rithre

lowerBound upperBound x

lowerBound x upperBound

x lowerBound upperBound
=#

#Note: requires: indexOf


# handleMultipleIndicies

## handleMultipleIndicies of lowerBound vector array
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
   #  newXIndex = lastindex(newXIndex)
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
function updateLocation(lowerBound, upperBound, X, arr) #sophisticated #TODO: test

    #aIndex = indexOf(arr, lowerBound)[1] # arr[indexOf(arr, lowerBound)[1]] # == lowerBound
    aIndex = firstindex(findall((x -> x == arr[lowerBound]), arr)) #[1]

    #bIndex = indexOf(arr, upperBound)[1] #arr[indexOf(arr, upperBound)[1]]
    bIndex = lastindex(findall((x -> x == arr[upperBound]), arr)) # [1]
    XIndex = nothing
    X < length(arr) ? XIndex = arr[X] : nothing

    #logically:  lowerBound <upperBound & arr is sorted (i.e contentA < contentB )
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
    #indexOf(arr, lowerBound)
end

"""update location, given an Index X """
function updateLocation(lowerBound, upperBound, _XContent, arr) #sophisticated #TODO: test

    #aIndex = indexOf(arr, lowerBound)[1] # arr[indexOf(arr, lowerBound)[1]] # == lowerBound
    aIndex = findall((x -> x == arr[lowerBound]), arr)[1]

    #bIndex = indexOf(arr, upperBound)[1] #arr[indexOf(arr, upperBound)[1]]
    bIndex = findall((x -> x == arr[upperBound]), arr)[1]
    #logically:  lowerBound <upperBound & arr is sorted (i.e contentA < contentB )
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
    #indexOf(arr, lowerBound)
end
#arr
#[1 7 ] = [lowerBound upperBound ]
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
    lowerBound = nothing
    upperBound = nothing
    count = 0
    popped = -1

    if _stack == []
        return
    elseif _length > 0

        count += 1  #increment count
        popped = popfirst!(_stack)

        lowerBound = firstindex(popped)
        upperBound = popped[length(popped)]

        # _view = view(collect(lowerBound:upperBound), lowerBound:upperBound) #main _view  #generatef
        m1, m2, isWhole = kernel(lowerBound, upperBound)#, _view)
        # conquer(m1,m2,isWhole,_view)
        conquer(popped, kernel) # partitions & sorts
        fRecurse(_stack, kernel)

    else
        throw(error(msg))
    end
    #TODO: add Catch (for lowerBound try statement)

end

#------

# Conquer function with Conquer function
function conquer(interval, kernel=middle)

    #  count = 0
    lowerBound = firstindex(interval)
    upperBound = interval[length(interval)]

    #_view = view(collect(lowerBound:upperBound), lowerBound:upperBound)

    # count += 1
    m1, m2, contentSwapped = kernel(lowerBound, upperBound) #, _view)
    # handle: m1,m2
    #-------

    #---------
    res = doCompare(m1, m2, ptsToView(m1, m2))
    if res === nothing
        return
    end
    #handle lowerBound m1
    if euclidDistDifference(lowerBound, m1) > 0 #1 #?
        kernel(lowerBound, m1) #, view(collect(lowerBound:m1), lowerBound:m1)) #: return
    end
    leftDist = euclidDistDifference(lowerBound + 1, m1 - 1)
    if leftDist > 1
        2 # ?
        conquer(collect(lowerBound+1:m1-1), kernel) # : return 0

    elseif leftDist == 1
        compareQuartet(lowerBound, lowerBound + 1, m1 - 1, m1, view(collect(lowerBound:m1), lowerBound:m1))

    elseif leftDist == 0 # scalar # pick any one of two indicies
        compareTriad(lowerBound, lowerBound + 1, lowerBound + 2, view(collect(lowerBound:lowerBound+2), lowerBound:lowerBound+2)) # compare its Nearest neighborhood

    end

    #this part exactly
    if euclidDist(m1, m2) == 1
        compareQuartet(m1 - 1, m1, m2, m2 + 1, view(collect(m1-1:m2+1), m1-1:m2+1))
        # kernel(m1, m2, view(collect(m1:m2), m1:m2))
    end
    rightDist = euclidDist(m2, upperBound)
    if rightDist > 1 #?
        kernel(m2, upperBound) #, view(collect(m2:upperBound), m2:upperBound)) #: return
    end

    if euclidDist(m2 + 1, upperBound - 1) > 2 #?
        conquer(collect(m2+1:upperBound-1), kernel) #: return
    elseif euclidDist(m2 + 1, upperBound - 1) == 1
        compareQuartet(m2, m2 + 1, upperBound - 1, upperBound, collect(m2:upperBound))
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
            if euclidDist(m2 + 1, upperBound - 1) > 2 #?
                conquer(collect(m2+1:upperBound-1), kernel) #: return
            elseif euclidDist(m2 + 1, upperBound - 1) == 1
                compareQuartet(m2, m2 + 1, upperBound - 1, upperBound, collect(m2:upperBound))
            else
                throws(error(msg))
                #og
            end
 =#

fRecurse([[1, 3], [4, 7], [8, 9]], middle)
#=
lowerBound,upperBound =1 3
sum = 4
iseven  = true
mid( sum / 2) = 2.0

=#
length([1, 2])
[1, 2][length([1, 2])]

p = popfirst!([[1, 3], [4, 7], [8, 9]])
p[1]
#creating lowerBound view
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
lowerBound = firstindex(interval)
upperBound = interval[length(interval)]

#_view = view(collect(lowerBound:upperBound), lowerBound:upperBound)
m1
m2
ptsToView(m1, m2)
ptsToView(m1, m1)#nothing # it should be single 1 element view
# count += 1
m1, m2, contentSwapped = middle(lowerBound, upperBound) #, _view)
# handle: m1,m2
collect(m1:m2)
doCompare(m1, m2, ptsToView(m1, m2))
#handle lowerBound m1
lowerBound
m1
euclidDist(1, 3)
#--------

#TODO: Reflect changes in lowerBound corresponding function
if euclidDistDifference(lowerBound, m1) > 1 #?
    middle(lowerBound, m1) #, view(collect(lowerBound:m1), lowerBound:m1)) #: return
end
leftDist = euclidDistDifference(lowerBound + 1, m1 - 1) # 0 : scalar
if leftDist > 2 # ?
    conquer(collect(lowerBound+1:m1-1), kernel) # : return 0

elseif leftDist == 1
    compareQuartet(lowerBound, lowerBound + 1, m1 - 1, m1, view(collect(lowerBound:m1), lowerBound:m1))

elseif leftDist == 0 # scalar #pick any one of two indicies

    doCompare(lowerBound, lowerBound + 1, ptsToView(lowerBound, lowerBound + 1))
    # compareTriad(lowerBound, lowerBound + 1, lowerBound + 2, view(collect(lowerBound:lowerBound+2), lowerBound:lowerBound+2)) # compare its Nearest neighborhood

end
#this part exactly
m1
m2
euclidDist(m1, m2)
euclidDistDifference

#----------------------------
#compiles

# euclidDistDifference
#added compareBounds




# End Reached function


#-------

if isEndReached(1, 3) == false
    return false
end
isEndReached(1, 1)

#---------------------------

if euclidDistDifference(m1, m2) == 1 #TODO: chage inside the function
    return true
else
    compareQuartet(m1 - 1, m1, m2, m2 + 1, view(collect(m1-1:m2+1), m1-1:m2+1))
    # kernel(m1, m2, view(collect(m1:m2), m1:m2))
end

m2
m2 = upperBound - 2
upperBound
firstindex(v)
lastindex(v)
v
v = collect(m2:upperBound)
_view = view(v, firstindex(v):lastindex(v))
#------
#TODO: Apply in lowerBound function
#check the Right Side
rightDist = euclidDistDifference(m2, upperBound)

if rightDist > 1 #?
    middle(m2, upperBound) #, view(collect(m2:upperBound), m2:upperBound)) #: return

elseif rightDist == 1
    v = collect(m2:upperBound)
    _view = view(v, firstindex(v):lastindex(v))

    doCompare(m2, upperBound, _view)

end

#3 #TODO: try out  #Error

n, m = nothing, nothing  #MethodError: no method matching iterate(::Nothing)#thrown when 2 (or more) vars has recieved null return -nothing
n
m

m2
m2 + 1
upperBound - 1
upperBound

#Note: m2 == upperBound-1 ==4 ; m2+1 ==upperBound ==5  then its only 2 points m2, m2+1

# m1, m2 relation
v = collect(m2:m2+1)
_view = view(v, firstindex(v):lastindex(v)) # BoundsError: attempt to access 2-element Vector{Int64} at index [1, 2] #lesson learned [x1 x2]

# m2,upperBound-1 ||
if m2 == upperBound - 1 && m2 + 1 == upperBound
    doCompare(m2, m2 + 1, _view)
else
    compareQuartet(m2, m2 + 1, upperBound - 1, upperBound, _view)
end
