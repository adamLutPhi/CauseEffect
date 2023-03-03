using Test
include("helper.jl")

#include("./unUsed2.jl")

@test 2 === 1+1

function doSubtract(isWhole)
    #0. Initialize
    subtract :: Int64 = 1

    #1. Check if `isWhole` is `false` (2 Middles)
    #=if isWhole == false
        subtract = 2
    #2. Check number `isWhole`  (1 Middle)
    elseif isWhole == true
        subtract = 1 =#

    #3. isWhole is true
    if isWhole == true
        # subtract = 1

    elseif isWhole == false
        subtract = 2

    #4. raise an `exceptionParameter` [default]
    else
        raise(UnexpectedError)
    end

    #4. Return `subtract` value
    return subtract

end

# getSubtractedValue(::Bool, ::String)

function getSubtractedValue( isWhole :: Bool , msg :: String = msg; exceptionParameter :: String = UnexpectedError )

    try
        #0. Initialize
        subtract :: Int64 = 1

        #1.checks if  `isWhole` is `true` (1 Middle)
        if isWhole == true
            # subtract = 1

        #2. Check if `isWhole` is `false` (2 Middles)
        elseif isWhole == false
            subtract = 2

        #3. raise an `exceptionParameter` [default]
        else
            raise(exceptionParameter)
        end

        #4. Return `subtract` value
        subtract

    catch UnexpectedError
        writeError( msg, exceptionParameter)
    end
end

isWhole = true
Test.@test getSubtractedValue(false, msg) == 2 # true
Test.@test getSubtractedValue(false) == 2 # true
#Test.@test getSubtractedValue(true) == 1 # false
isWhole = false
Test.@test getSubtractedValue(true,msg) == 1 # true
Test.@test getSubtractedValue(true) == 1 # true
#Test.@test getSubtractedValue(false) == 2 # false

function calcTotalMiddles(arr=[1,2,3,4,5])
    return length(arr) #5
end
print( calcTotalMiddles() )

#TODO: Demo below
lowerBound1  :: Int64 = 1;
upperBound1 :: Int64 = 9;

view(collect(lowerBound1 : upperBound1 ), (lowerBound1 : upperBound1 ))
