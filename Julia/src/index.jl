#define cartesian index

using Base:  LinearIndices, CartesianIndices #LinearIndex, CartesianIndex #,

# Pyramid #1

##1. Unit Range (::Int64 : ::Int64)
##2. Array
##3. View
##4. SubArray

##Pyramid #2

##1. Unit Range (::Int64 : ::Int64)

##3.Index

##3.1. LinearIndices
println("LinearIndices(1:9) = ", Base.LinearIndices(1:9) )

global a=1 :: Int64
global b=9 :: Int64
unitRange = a:b
##3.2. cartesianIndex
function getCartesianIndex( unitRange  ) #::Base.AbstracUnitRange)
    CartesianIndex(unitRange )
end

cartesianIndex(index::Integer...) = Base.CartesianIndex(index)

#l
#  :: Base.CartesianIndices
function getIndex(inds, arr)

    # LinearIndices(inds ) -> R
     iter = Base.CartesianIndices(axes(arr))
     #NI = inc(i.I, iter.indices)
     #I = #Base.inc
     #I = (iter.I, CartesianIndices.indices) # caretesian has no field I
     #I = (iter, CartesianIndices.indices) #UnionAll
     I = iter 
     I
end
function getindices2(a :: Int64 , b :: Int64, arr )

    firstIndex = getIndex(a , arr ) #firstIndex(findall(x -> x == a, arr ))
    lastIndex = getIndex(b , arr ) #lastindex(findall(x -> x == b, arr ))

    idxA, idxB = firstIndex, lastIndex
    idxA, idxB
end
ar = [3,2,1]
println(  CartesianIndices(axes(ar) ))
