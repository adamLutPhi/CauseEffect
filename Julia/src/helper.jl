import Base: copy

msg = "ERROR: Unexpected Error Occured"
UnexpectedError = "UnexpectedError"
# set exception exceptionParameter to `UnexpectedError`
exceptionParameter = UnexpectedError
""" Catch an error on the `backtrace` with specified error, and display elaboration message, by default """
function writeError( msg :: String; _error= UnexpectedError :: String, elaboration :: String = ": please check then try again " )

    @error msg + elaboration + exception = (UnexpectedError, catch_backtrace())

end

""" Catch an error on the `backtrace` with specified error, and display elaboration message, by default """
function writeError(msg; _error= UnexpectedError)
    @error msg + exception = (UnexpectedError, catch_backtrace())
    #@error "Unexpected error" exception = (UnexpectedError, catch_backtrace())
end

#lvl 1
""" handleNullCount """
function handleNullCount( count :: Int64 )

    #0. Init variables
    _isNothing  = handleNull(count) #isNothing(count)
    #correctAnswer = true
    #condition = Nothing(count)
    #1. Check if condition is `Nullable`
    if _isNothing == false
        _isNothing = false #
    elseif _isNothing == true
        println("count is Nothing,setting count = 1 ...")
        #2. Set `count` to 1
        count = 1
        # turn off `_isNothing` flag
        _isNothing = false # set nulla flag to `false`
        #return count = 0
    end
    #3. Return count with _isNothing (whatever value of `count` is)
    #count, false
    count, _isNothing #  flag (`_isNothing` isa `false`) is returned with the count
end

# lvl 2
""" handles a nullable object & its count (number of occurences) """
function handleNullObject( count :: Int64 ; defaultvalue :: Int64 = 1 ,  exceptionParameter = UnexpectedError)

    count, _isNothing  = handleNullCount(count) #isNothing(count)
    #correctAnswer = true

    if _isNothing == false
    println("count has a defined value ,setting count = 1 ...")
    count = incrementCounter(count)

    elseif _isNothing == true
        println("count is Nothing,setting count = 1 ...")
        # Handle null object: Set `object` to it default value `1`
        count = 1
        # transfomr flag `_isNothing` from `false` to `true`
        _isNothing = false # always becomes false
        #return count = 0
    else
        raise( exception( exceptionParameter) )
    end
    count,  _isNothing # remove unnecessary
end


function setCondition(_condition)
    condition = _condition
    correctAnswer = true

    condition, correctAnswer
end

function isSame( lowerBound :: Int64 , upperBound :: Int64 , _length :: Int64 )

    if lowerBound == _length || upperBound == _length

      return lowerBound, upperBound, nothing
    end
    #TODO: include other conditions , if possible (I don't recommmend doing that for this one, in particular) 
end
