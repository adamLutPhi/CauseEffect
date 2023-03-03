using Test #: @test
#from Test import: @test

_null   :: Nothing  = nothing
_val    :: Int64    = -1
counter :: Int64    = 0
include("helper.jl")

# In Julia
# No need for a return keyword
#Q. What is not ||  ?
#A. ! ( || )

#Q. Do we return inside of `if` statement ?
#A. No, never (because we use the trinity: if elseif , else )

#

function isCondition( args :: Nothing; exceptionParameter = UnexpectedError )

    try
        answer = true
        if args == true

        elseif args == false
            answer = false
        else
            writeError(msg)
        end
        answer
    catch exceptionParameter
        writeError(msg, exceptionParameter)
    end
end

#Condition Handling
#=
The following condition is not preferred:

    if condition
    elseif ! condition

    else
        raise(exception )
    end
which is replaced by:

    if condition == true

    elseif condition == false

    else
        raise(exception )
    end
=#

# nill

#=
Every raise, should have an equivalent catch

=#
UnexpectedError = "UnexpectedError"
function isNothing( _obj  :: Nothing ; correctAnswer= "nothing", exceptionParameter = UnexpectedError )

    try
        condition = _obj == nothing || _null isa Nothing
        if condition == true

            println("_obj == " + correctAnswer)

        elseif  condition == false
            println("_obj != " + correctAnswer)
        else
            raise( exception(exceptionParameter)) #(exception(exceptionParameter))
        end
    catch exceptionParameter
        writeError(msg, exceptionParameter)
    end
end


# ! nill
function isNNothing( _obj :: Nothing ; exceptionParameter =  UnexpectedError )

    correctAnswer = true
    condition =   _obj == nothing || _null isa Nothing

    if condition == true #_obj == nothing || _null isa Nothing
        correctAnswer = false
        println("_obj == nothing")
    # check is not null
    elseif  condition == false  #! ( _obj == nothing || _null isa Nothing )
        println("_obj != nothing")
    else
        raise( exception(exceptionParameter) )
    end
    correctAnswer
    #otherwise: null
    #println("_obj == nothing")
    # end
end


""" Handles Null value in `count` """
function  handleNull( count :: Int64 ; exceptionParameter :: String = UnexpectedError )

    try
        _isNothing  = isNothing(count)
        correctAnswer = true

        if _isNothing == false
            correctAnswer = false
            println(" _isNothing == false ")
        elseif_isNothing == true
            println(" _isNothing == true ")

        else
            raise(exception( exceptionParameter ))
        end
    _isNothing
    catch exceptionParameter
            writeError(msg, exceptionParameter)
    end
end




""" isNEqual """
function isNEqual( _obj1 , _obj2 ; count = counter, exceptionParameter = UnexpectedError )

    count, _isNothing  = handleNullObject(count) #isNothing(count)

#    if _isNothing == false

    #correctAnswer = true
    condition, correctAnswer = setCondition( obj1 != obj2  ) # obj1 == obj2)
    #condition = Nothing(count)

    if condition == false # obj1 != obj2   #_isNothing == false #_obj1 == _obj2
        correctAnswer  = false
        println( "try " + count + ": " + _obj1 +" != "+_obj2+"" )

    elseif condition == true #  obj1 == obj2  #_isNothing == true
        println( "try " + count + ": " + _obj1 +" == "+_obj2+"" )

    #if Nothing(count) == true

    #end
    # current
    #elseif Nothing(count) == false  # true
    #    _isNothing = false
        #handle not null
    else
        raise(exception(exceptionParameter))
    end
    count = incrementCounter(count) #count + 1 #increment count (for next time)
    correctAnswer, count #return currectAnser with the new count

    #if isNNothing(count) == true
    #    counter = count + 1
    #end
end


#   ==
"""" isEqual """
function isEqual( _obj1 , _obj2 ; count = counter )

    count,  _isNothing = handleNullObject(count)
    #_isNothing = handleNullCount
    condition, correctAnswer = setCondition(_obj1 == _obj2)

    if condition == true   #  _obj1 == _obj2

        println( "try " + count + ": " + _obj1 +" == "+_obj2+"" )


    elseif condition == false
        correctAnswer = false
        println( "try " + count + ": " + _obj1 +" != "+_obj2+"" )
    end

    # current

    count = incrementCounter(count) # count + 1

    correctAnswer, count

end


#   ===

function isEEqual( _obj1 , _obj2 ; count = counter )

    condition = _obj1 === _obj2
    if condition == true
    println("try "+ count +": "+ _obj1 +" == "+_obj2+"")
    counter = count + 1
elseif condition

    end
end


#   !==
function incrementCounter(count = counter )


    handleNull(count)

    count = count + 1
    count
end


function isNEEqual( _obj1 , _obj2 ; count = counter, exceptionParameter = UnexpectedError )


    condition =  _obj1 !== _obj2
    correctAnswer = true

    if condition == true
        println("try " + count  +": "+ _obj1 +" == "+_obj2+"")


    elseif  condition == false
        correctAnswer = false
    else
        raise(exception( exceptionParameter ))
    end
    count = incrementCounter(count) #count + 1

end


#   !=

function isNEqual( _obj1, _obj2 ; count = counter)

    try
        correctAnswer = true
        condition = _obj1 != _obj2

        if condition == false
            println("try "+ count +": "+ _obj1 +" != "+_obj2+"")
            correctAnswer = false
        elseif condition == true
            println("try "+ count +": "+ _obj1 +" == "+_obj2+"")
            count = incrementCounter(count) #count + 1
        #    elseif condition == false
        #    println("try "+ count +": "+ _obj1 +" != "+_obj2+"")

        else
            raise(exception(exceptionParameter))
        end

    correctAnswer, count
    catch exceptionParameter
        writeError(msg, exceptionParameter)

    end
end


#   !==

function isNEqual( _obj1, _obj2 ; count = counter)

    condition = _obj1 !== _obj2
    correctAnswer = true


    if condition == false

    elseif condition == true
        println("try "+ count +": "+ _obj1 +" == "+_obj2+"")
        count = incrementCounter(count) #count + 1
    elseif condition == false

    else exceptionParameter

    end
end


#   >

function islgt( _obj1, _obj2 ; count = counter, exceptionParameter = UnexpectedError)


    try
        condition =  _obj1 > _obj2
        correctAnswer = true
        if !condition
            correctAnswer = false
        elseif condition

            println("try "+ count +": "+ _obj1 +" == "+_obj2+"")
            count = incrementCounter(count) #counter + 1

        else exceptionParameter
            raise(exception( exceptionParameter ) )
        end
    correctAnswer, count

    catch exceptionParameter
            writeError(msg, exceptionParameter)
    end


end


#   >=

function islgte( _obj1 , _obj2 ; count = counter , exceptionParameter =  exceptionParameter)


    try
        condition, correctAnswer = setCondition(_obj1 >= _obj2)

        if condition == false
            correctAnswer = false
        elseif condition == true
            println("try "+ count +": "+ _obj1 +" == "+_obj2+"")
        count = incrementCounter(count)  #counter + 1

        else
        raise( exception( exceptionParameter))
        end

        correctAnswer, count
    catch exceptionParameter
        writeError(msg, exceptionParameter)
    end
end


#   <

function islst( _obj1, _obj2 ; count = counter )

    condition, correctAnswer = setCondition(_obj1 < _obj2)
    #condition = _obj1 < _obj2

    if condition == false
        correctAnswer = false
    elseif condition == true
        println("try "+ count +": "+ _obj1 +" < "+_obj2+"")
        count = incrementCounter(count) #count + 1
    elseif condition == false
         println("try "+ count +": "+ _obj1 +" >= "+_obj2+"")
    end

end


#   <=

""" islste: is less than, or equals """
function islste(_obj1, _obj2 ; count = counter)

    if _obj1 <= _obj2
    println("try "+ counter +": "+ _obj1 +" == "+_obj2+"")
    counter = counter + 1
elseif_obj1 > _obj2 #<---- #TODO: recheck
     println("try "+ count +": "+ _obj1 +" >= "+_obj2+"")
    end
end


# isa
## isa nothing

## isa Nothing

# ==
# == nothing true # works

if _null == nothing
    println("try1: _null == nothing") # _val
end

if _null == ""
    println("try2 : _null == ''")
end
# == Nothing false

if _null == Nothing
    println("try3: _null == nothing")
    # return _val
end

#isa

## nothing

## Nothing
if _null isa Nothing

    println("try4: _null isa Nothing ")
#end
    # return _val
end
## ''
#if _null isa "" # potenial # ERROR: isa, expected Type, got a value of type String

#println("try5: _null isa '' ")
#end

if _null === Nothing
    println("try6: _null === nothing")
    # return _val
end


function swapContent(aContent, bContent, arr)# compiles #; offset=1) #new! # lowerBound,upperBound,indicies in arr

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

        println(arr[lowerBoundIndex]," ", arr[upperBoundIndex]," ",contentSwapped)

    elseif aContent <= bContent

        contentSwapped = false
        println(arr[lowerBoundIndex]," ", arr[upperBoundIndex]," ", contentSwapped)
    end

    return lowerBoundIndex, upperBoundIndex, contentSwapped #returns index (more practical)
end


ar1 =  [3,2,1]

a,b,isSwapped = swapContent(3,2,ar1)

+(0,1) + 1
#euclidDist IntervalLength4(a,b)
-(0,1)
#Test.
Test.@test 1 === 1
#@test -(0,1)+1   ==  +(0,1) +1
#-1 -1 = -2

#euclidDistDifference
#-(0,1)
