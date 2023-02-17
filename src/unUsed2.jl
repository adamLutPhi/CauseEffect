using Base.@propagate_inbounds , @error 
#-----testing
msg = "ERROR: Unexpected Error Occured"
elaboration = "UnexpectedError Occured: please check stackTrace, then try again later";

currentValue = nothing
arr = [1, 4, 8]
#middle!(1, 3)

import causeEffect 

# --- Q. Is It True, or Nothing? 

# isTrue 

function isTrue(_value) #TODO:debug
    
    try

    _value == true
        return true
    _value == false
        return false
    else
        
        return writeError(msg) #,_error , elaboration
    end
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end
end


# isNothing 
function isNothing(_value) #TODO:debug
    try
        response = nothing
        if _value === nothing
            response = true
        elseif _value !== nothing
            response = false
        else
            writeError(msg )
        end
        return currentValue
    catch UnexpectedError
        @error msg * ": please check then try again" exception = (UnexpectedError, catch_backtrace())
    end
end


""" catches an error with a specified error, and displaying elaboration message """
function writeError(msg,_error= UnexpectedError, elaboration=": please check then try again ")
    catch _error # UnexpectedError
        @error msg * elaboration exception = (UnexpectedError, catch_backtrace())
    end
end


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


"""Another variation of intervalLength (): this intervalLength is vaid , under context of sum """
function intervalLength2(lowerBound, upperBound)

    return lowerBound + upperBound  #- 1
end


function handleNegativevalue(_value)
    
    if currentValue <= 0 #  the last step
        _value = 0 #-100 #0
    end

    _value
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
            println("currentValue = ", currentValue) # = [1, 3] #<--------- the issue not one value (same as interval)
            # println("typeof(currrentValue) = ", typeof(currentValue))

            println("getSubtractedValue(isWhole) = ", getSubtractedValue(isWhole))
            # println("typeof (getSubtractedValue(isWhole)) = ", typeof(getSubtractedValue(isWhole)))
            currentValue = handleNegativevalue(currentValue)
            #=
            if currentValue <= 0 #  the last step
                currentValue = 0 #-100 #0

            end =#
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
# calcVerteciesLeft

## calcVerteciesLeft with a _view & a currentValue
function calcVerteciesLeft!(_view::SubArray{Int64,1}, currentValue) # ,formula)

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
# calcVerteciesLeft! #depreciate
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


function calcVerteciesLeft!(_view::SubArray{Int64,1}, currentValue) # ,formula)

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


calcVerteciesLeft!(1, 3, nothing) #1 #not correct  #checkCurrentValue!(1,3) #erroneous

println("lowerBound",lowerBound)
println("upperBound", upperBound)
println("currentValue",currentValue)
currentValue = calcVerteciesLeft!(lowerBound, upperBound, currentValue)
#----------------

#---
# Cause

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


#TODO: t..
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


#DEMO:
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


#New : use of kernel as input  #TODO:
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


function effect!(lowerBound, upperBound, _stack, kernel=middle)

    if _stack > 0
        m1, m2, isWhole = kernel(lowerBound, upperBound)
        #haandling # traverse

    end
    # cause!(lowerBound, upperBound, _stack, kernel)
end


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


currentValue
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

#strategy: to  pass-in an arr, for now


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


# isStoppingCondition


function isStoppingCondition(lowerBound::Int64, upperBound::Int64, currentValue) #vital

    #m1, m2, isWhole = callMiddle(lowerBound, upperBound) #Occurs before this function
    println("isStoppingCond...  currentValue passed")
    #isWhole = getIsWhole(arr)
    #currentValue = calcVerteciesLeft!(arr, isWhole)
    currentValue = calcVerteciesLeft!(lowerBound, upperBound, currentValue) #checkCurrentValue!(lowerBound, upperBound, currentValue) #decrements 1 from current value (isWhole) or 2 (!isWhole)

    return currentValue #handleCurrentValue(currentValue)
end#----


#---------
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


#uses calcVerteciesLeft
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
        compareBounds(lowerbound, upperbound, _view1)
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


function effect(a, b, view = view(arr, a, b))
    cause(a, b, view)
end

#applied space: Materialized

function goleftVector(a, b, arr) #tobeRemoved
    #Todo: fix a , decrease b
    #condition = areInbounds(a, b, arr)
    # if areInbounds(a, b, arr) == true
    return causeVector(a, b - 1, arr)   #or is it effect?  #<------
end

function gorightVector(a, b, arr)
    #Todo: fix b, increase a

    return causeVector(a + 1, b, arr) #or is it effect?
end


#depreciate
"""stopping function for comparison """

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


#depreciate #re-consider 
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


#compareTriad functions : doCompare ,  push!(Middles, m1)
""" returned structure would be m1 in the middle, a on the left (min), b on the right (max)"""
#_type = typeof(arr)

#==
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
=#
#--------


#experimental : TODO: Complete Skip for now
@propagate_inbounds function callMiddle!(a::Int64, b::Int64, arr::Array{Int64,1})
    try
        # Reviewr#2: removed distance() should be here ( distance is only in isStop )
        #distance = euclidDist(a,b) # response = isStop(a, b, arr)

        if a != b && a > 0 && b > 0 # only condition we require
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


#demo:
m1, m2, isWhole = callMiddle(1, 1) #issue: this returns 2 , while main function expects 3 return arguments
m1, m2, isWhole = callMiddle(firstindex(arr), lastindex(arr)) #was callMiddle(a, b, arr) #old thinking


#----
function remap(a::Int64, b::Int64) # 1 2  abs(max(a, b) - min(a, b)) + 1 ; 2 -1 = 1 + 1 = 2
    b = euclidDist(a, b) + 1 # + 1 #warning you added 1 to the end: recheck new bounds (are all ranges fit) - some got to be out
    a = 1 #always start at this #or offset
    return a, b
end

remap(1, 10) #missing 1 at last  +1 #fixed
remap(5, 10) # correct
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

#kernel #is passed
#isStoppingCondition #is passed (either stop, or continue)
#=
remap(1, 10) #missing 1 at last  +1 #fixed
remap(5, 10) # correct

#requires compareQuartet, compareTriad
#lowerBound ::Int64, m1::Int64, m2::Int64, upperBound::Int64, ::Bool, ::Vector{Int64})
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

#---------
# custom Kernel functions

## kernel: of Two Point
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
kernel(lowerBound, upperBound, view(v, v), middle!)
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

#todo: remapping function from indicies to values
#checkCond(1, m1, m2, 3, isWhole, [1, 2, 3]) #deprecate