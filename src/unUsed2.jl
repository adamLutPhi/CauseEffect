
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
