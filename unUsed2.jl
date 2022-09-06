
#-----testing
msg = "ERROR: Unexpected Error Occured"
currentValue = nothing
arr = [1, 4, 8]
#middle!(1, 3)

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

#TODO: t
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
#==#

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
