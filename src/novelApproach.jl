#= to solve the old problem, Programmer may have
to create another  problem & fix it ,
Hence the solution of the original problem lies in the difference between them

=#
include("./Utils.jl")
#import "Utils.jl"
#using "Utils.jl"
"""a trivial way in which as we're getting closer

```input:
limit: the max length, of a possible to processing
 (based on geometric significance of compareQuartet)
```

```output:
```
"""
_stack = []
""" novel nonlinear progressive function """
function trivialPartitionFunction(a=1::Int64, b=4::Int64; limit=4) #1 limit should be const

    # _stack2=[]
    #eqnf f(a,b,n) =  b - (n *a)
    lower = copy(a)
    upper = copy(b)
    res = b
    count = 1 #nothing

    i = 1
    lastres = 0
    #for i in a:b
    #loop presupposes that : res stays above lower: goal : res Decreases
    # q1 is res
    count= i
if res >= lower  && if limit < 5

     nonLinearPart = count * lower # a * i
      res = upper - nonLinearPart #1 # update res [process new value ] # possibility for a negative res ( count * lower)
     elseif res <= 0 # negative: last iteration

     end

end
    while res >= lower # 1
        if limit < 5 #geometric Criteria: if an Interval is less than the available engineered structure (i.e. 4 or 3) && count >0
            count = i #copy(i)

            nonLinearPart = count * lower # a * i
            println("count: ", count, " upper = ", upper, " count * lower  = ", nonLinearPart, " ")# ok
            #lastres

            res = upper - nonLinearPart #1 # update res [process new value ] # possibility for a negative res ( count * lower)
            #TODO:use upper Values
            if res >= lower  # 0 # if res is im an acceptable ramge # res is acceptable # questionable  condition: # <= upper(b) # reason: function of it  # as res increase, ensure we's still below upper
                println("count: ", count, " count * lower ", count * lower, " res = ", res)
                #push!(point, _stack)
                push!(_stack, (count, res))
                upper = res #load value for next iteration cycle
                lastres = res
                i += 1
                #TODO: possibility to apply other conditions


            elseif res <= 0 # entering last iteration
                # elseif upper <= count automatically
                println("entered special case ", "count ", count)
                #res = i # give res
                #at this point we're done, consider finalizing
                #   if upper > 1 # if you af = i.e. >= does this increase the uncertainty?
                # count = upper - 1
                #break
                #elseif upper == 1 # last value
                #    count = 0
                #  else
                #println("upper is negative ", upper)
                #  end
                #what if lastres == lower
                if lastres != lower # if  lower wasn't added (here: always 1), add it please
                    push!(_stack, (count, lower))
                end
                break #breaks out of loop
            end

        end
    end #while
    println("congratz you're done!")
    #lastpoint = abs(upper - (count * lower))  # =1
    #if lastres != lower # if  lower wasn't added (here: always 1), add it please
    #   push!(_stack, (count, lower))
    #end
    #return _stack2
end

#----
#from here

"""Event-driven function: for a given bound, Calculate the other bound, only using arithmetic operation

Example:
initialize arr bounds a =1 , b = 9
 for a given intervalBound1 = 3, or 6, or 7
    process intervalBound2 = 4, or 6, or 8

    ```
    output:
    ```
    returns _stack = [ [1,3], [4,6], [7,8], [8,9] ]

"""
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr = [5, 4, 3, 2]
#or
#--test
mappedIndex = firstindex(arr) + 3 - 1 # firstindex(arr) + intervalBound1 -1
#first
(first(arr, 3), 3)
(first(arr, mappedIndex), mappedIndex)

#----------
count = 1
while count < b  # cruical #Check #unless function is event driven (called each time )
    #for i = 1 :b
    #count += 1
    println("count = ", count)
    # if count % 2 == 0 #if #if even return 1
    addition = 1
    #1: [1,3] + addition (1) = [4,_]
    # 2: [4,6] + 1 = [7,_]
    #3:[] #except last one : no addition

    println("with addition = 1")
    #println("even, with addition = 0")
    # elseif count % 2 != 0 # if odd
    #     addition = 0
    #     println("odd, with addition = 1")
    # end
    count += 1
end

#---------- modifyInterval
addition = 1
nextStart = nothing
for i = 1:length(_stack)  # = b-1 #should be
    # addition = 1
    #TODO: apply addition on the interval
    println("last interval bound = ", _stack[1][2])
    nextStart = _stack[i][2] + addition #3 ->4 , 6 ->7,
    #1: [1,3] + addition (1) = [4,_]
    # 2: [4,6] + 1 = [7,_]
    #3:[8,9] #except last one : no addition needed
    println("with addition = 1")
    println("nextStart = ", nextStart)
    #either push to pts
    push!(pts, nextStart)
end
#---------
addition = 1
nextStart = nothing


for i = 1:length(_stack)  # = b-1 #should be
    # addition = 1
    #TODO: apply addition on the interval
    println("last interval bound = ", _stack[1][2])
    nextStart = _stack[i][2] + addition #3 ->4 , 6 ->7,
    #1: [1,3] + addition (1) = [4,_]
    # 2: [4,6] + 1 = [7,_]
    #3:[8,9] #except last one : no addition needed
    println("with addition = 1")
    println("nextStart = ", nextStart)
    #either push to pts
    push!(pts, nextStart)
end
#--------Done
_stack
_stack[1][2]
#---------
intervalBound1 = _stack[1][2]
mappedIndex = firstindex(arr) + intervalBound1 - 1 #3
#  if mappedIndex > a && mappedIndex < b
newBound = +(mappedIndex, +1) # add either 0 if count not even, 1 if count is even
mappedIndex = +(mappedIndex, addition) # both equal half the time:

if @assert newBound === mappedIndex
    return true
end
if newBound === mappedIndex
    return true
end
println("newMapped index = ", mappedIndex)
println("newBound index = ", newBound)


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
    #=
        if intervalBound1 >=a  && count ==1
            push!(lista, [a, intervalBound1]) #push first interval

       #= elseif intervalBound1 <= b
            push!(lista, [intervalBound1,b]) =# #redumdant with intervalBound2
        end
        =#

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

l = copy(length(_stack))
l.*2 #if vector i.e. d=1 : 2 *2

#----------------
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
        if intervalBound2 === nothing
        elseif intervalBound2 !== nothing && intervalBound2< b
        end =#

    #Ch eckBouh
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

function findSubIntervals3(arr::Array{Int64,1}, intervalBound1::Int64; op=+) #op can be - too
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
            addition = 0
        end
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

#----
"""arr[mappedIndex]+1 """
function evaluateValue(arr::Array{Int64,1}, mappedIndex::Int64; op=+)
    return op(firstindex(arr, mappedIndex), 1) #,addition) ) #warning: Unassigned operation
end

findSubIntervals([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) #  Any[[1, 2, 3], 3] # [3, 4]
findSubIntervals([1, 2, 3, 4, 5, 6, 7, 8, 9], 6) # Any[[1, 2, 3, 4, 5, 6], 6] # [6, 7]

findSubIntervals2([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) #  Any[[1, 2, 3], 3] # [3, 4]
findSubIntervals2([1, 2, 3, 4, 5, 6, 7, 8, 9], 6) # Any[[1, 2, 3, 4, 5, 6], 6] # [6, 7]

r = findSubIntervals2([1, 2, 3, 4, 5, 6, 7, 8, 9], 8) # [8, 9]

findSubIntervals3([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) #  Any[[1, 2, 3], 3] # [3, 4]
findSubIntervals3([1, 2, 3, 4, 5, 6, 7, 8, 9], 6) # Any[[1, 2, 3, 4, 5, 6], 6] # [6, 7]

r = findSubIntervals3([1, 2, 3, 4, 5, 6, 7, 8, 9], 8) # [8, 9]
typeof(r)
r == [] #when return an empty array  this is true

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

# idea: if I have some index
""" calculates the distance of nearest neighbor
note: assumes values ordered, in an Ascending order"""
#last added function
[a b]
function findNext(arr::Array{Int64,1}, idx::Int64) #works
    # a = findfirst(arr[idx])
    # a = []
    index1 = 1
    index2 = 1
    ans = 0
    if idx <= length(arr) - 1

        index1 = findfirst(x -> x == arr[idx], arr) # 2
        index2 = index1 + 1 # 3   # isn't this unethically wrong
        ans = arr[index2] - arr[index1] #-1 # 8-4 = 4
    end

    return ans
end # corrected return
#end
mainstack = []
_mop = findNext([1, 4, 8], 1) # 3  = 4 -1
_mop = findNext([1, 4, 8], 2) #4 = 8- 4

# index([1, 4, 8][2], [1, 4, 8][])

maxLength = length([1, 4, 8]) - 1

#startHere
#requires min
#for i in 1:maxl
#=
lowerbound = [1,4,8][1]
    upperbound = copy(findNext([1, 4, 8], 1)) #+ nextUpperbound
    makeVector((lowerbound, upperbound)) #define: makeVector()

    nextLowerbound= upperbound + 1
   nextUpperbound= findNext([1, 4, 8], firstindex(nextLowerbound))
   new = nextLowerbound + nextUpperbound

 makeVector((nextLowerbound, new))
=#
mainstack = []
v = nothing

maxLength = 2

arr = [1, 4, 8]
i = 1
nextLowerbound = nothing

lowerbound
upperbound
#----------
#Q.how to deal with the last item?
#---idea

v1 = view([1, 4, 8], firstindex([1, 4, 8], 4))
v2 = view([1, 4, 8], 4, lastindex([1, 4, 8]))
#------

v1 = view([1, 4, 8], firstindex([1, 4, 8], lowerbound))
v2 = view([1, 4, 8], lastindex([1, 4, 8], upperbound))
v = makeVector(v1, v2)
while i < maxLength #2 not working (as expected )
    #i+=1
    if nextLowerbound === nothing
        lowerbound = [1, 4, 8][i]
        upperbound = findNext([1, 4, 8], i) #+ nextUpperbound #findNext except the last (needs carefulnedss)

        println("lowerbound ", lowerbound)
        println("upperbound ", upperbound)

        ([1, 4, 8], [1, 4, 8][lowerbound])

        (firstindex([1, 4, 8]), [1, 4, 8][upperbound])
        #change this line view()

        v1 = view([1, 4, 8], firstindex([1, 4, 8], lowerbound))
        v2 = view([1, 4, 8], lastindex([1, 4, 8], upperbound))
        v = makeVector(v1, v2)
        #v = makeVector((firstindex([1, 4, 8], lowerbound), lastindex([1, 4, 8], upperbound)))
        #v = makeVector((firstindex([1, 4, 8], lowerbound), firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3]

        println("findNext = upperbound = (lowerbound + _next) = ", upperbound)
        push!(mainstack, v)
        #4

    else # if !(nextLowerbound isa nothing)   #nextLowerbound has a value  # enters
        if upperbound < lowerbound
            break # break the loop, we've finished processing
        end
        println("entering else statement")
        lowerbound = nextLowerbound
        _next = findNext([1, 4, 8], i)
        println("next = ", _next)
        upperbound = lowerbound + _next
        println("findNext = upperbound = (lowerbound + _next) = ", upperbound)

        v = makeVector((firstindex([1, 4, 8][lowerbound]), firstindex([1, 4, 8][upperbound]))) #
        # makeVector(([1,4,8][lowerbound],([1,4,8][upperbound])))
        push!(mainstack, v)
        # nextLowerbound = upperbound + 1 # last =8
    end
    nextLowerbound = upperbound + 1
    i += 1
end

#handle last item
#issue arr ends at 8
# moved to upper scope of the function
#  v = makeVector((firstindex([1,4,8],nextLowerbound), firstindex([1,4,8],nextLowerbound+1))) #[8,9]
# push!(mainstack, v)
mainstack

#--------
# i = lastindex # stuck here

lowerbound = [1, 4, 8][i]
upperbound = copy(findNext([1, 4, 8], i)) #+ nextUpperbound 8 ,
#infer: if upperbound < lowerbound  break ; return # by using findNext its algorithm returns 0 if next aintt found
#this line means if we reached the end (marked by uppoerbound = 0 < lowerbound = 8)
#then safel return - as no further processing is required
#break : the loop coverning control statements , to end processing

println("lowerbound ", lowerbound)
println("upperbound ", upperbound)
#TODO:
#break;
#lowerbound = lowerbound # lasat value it reaached (end of arr) # 8
# upperbound = b  # 9
# add last interval [8, 9]

mappedIndex = firstindex([1, 4, 8]) + 2 # -1
# newBound = mappedIndex + 1 # arbitrary function #ERROR: index value is outside the array function
view([1, 4, 8], firstindex([1, 4, 8], lowerbound)) #correct
# v = makeVector((firstindex([1, 4, 8], lowerbound), firstindex([1, 4, 8], upperbound))) #upperbound))  [1, 3] # [1,1]
view([1, 4, 8], firstindex([1, 4, 8], upperbound)) #1
# newRow = view(arr, mappedIndex:newBound) # want to access sth larger than the () itself
newRow = view(arr, mappedIndex-1:mappedIndex) # this works  #[4 8]

return newRow
#TODO: see if you can place them in pts array


view([1, 4, 8], 2:3) #[4 8]

push!(mainstack, v)
nextLowerbound = upperbound + 1 #4
#-------
#try 2
maxLength = 2
i = 1
if i <= maxLength
    i += 1 #fixed
    nextLowerbound = _mop + 1
    nextUpperbound = [1, 4, 8][i]
end
#special case: at the end final item

#Calculate for the Iteration [requires: findNext(arr, i)]:

#given a  as an InputArgument
#simple iteration for i
#i=1 #uncommentMe
a = 1 #say a=1

_next = findNext([1, 4, 8], i)# 0 # 4 [infer: i=2; current=4, nextDistance(i=3)]
makeVector((a, _next - 1)) # vector [1,3] #now gives [2,3]
#todo: add to intervals stack
lowerboundValue = [1, 4, 8][i] #1  # 8
upperboundValue = lowerboundValue + _next - 1  #a + map #  0 = 1 (not 9) = lastValue # 8
#---------------------------

#[4,8] #now # can become [4,7]
#----in-Depth

_next = findNext([1, 4, 8], 1) #finds difference between first & next # 3
#
#newV = makeVector((lowerboundValue, upperboundValue))
#newV = makeVector((a, _next))  #- 1)) #[1,3] #experimential : warning
lowerboundValue = a #newV[1]#[1, 4, 8][1] #1  # 8
upperboundValue = lowerboundValue + _next - 1  #a + map #  0 = 1 (not 9) = lastValue # 8
newV = makeVector((lowerboundValue, upperboundValue))  # commit this one  #uncommentMe
#todo: push newV
#a=lowerboundValue
#----------
#nextLowerboundValue = upperboundValue +1 # unneeded potentially
a = upperboundValue + 1  #1
lowerboundValue = a
# if i < length(arr)

_next = findNext([1, 4, 8], 2) #2 #starting from i=2 whats the next distance
#[4,_]
upperboundValue = lowerboundValue + _next - 1 #3
#[4,7]
newV = makeVector((lowerboundValue, upperboundValue)) # 4
#todo: push newV = [4,7]

_next = findNext([1, 4, 8], 3)
if _next == 0
    return
end #end condition
#------- great now implement a function
#input: count i, lowerboundValue, upperboundValue
_last = copy(lastindex([1, 4, 8]))
newV = nothing
if _next == 0
    return
end
#else
if upperboundValue < _last  #lastindex([1, 4, 8])
    a = upperboundValue + 1  #1
    lowerboundValue = a
    # if i < length(arr)
    _next = findNext([1, 4, 8], i) #2 #starting from i=2 whats the next distance
    #[4,_]
    upperboundValue = lowerboundValue + _next - 1 #3
    #[4,7]
    newV = makeVector((lowerboundValue, upperboundValue)) # 4
end

#init upperbound (input arg ) [1,3] -next interval-> [4,7]
upperboundValue = 3
a = 1 # = first index of a given Index ar
lowerboundValue = a

#-----
lst = []
a = upperboundValue + 1  #1

#----- #start loop

# if i < length(arr)
_next = findNext([1, 4, 8], 2) #2 #starting from i=2 whats the next distance
#[4,_]
upperboundValue = lowerboundValue + _next - 1 #3
#[4,7] = upperboundValue, upperboundValue + _next
newV = makeVector((upperboundValue, upperboundValue + _next - 1)) # [4,7]
#newV = makeVector((lowerboundValue, upperboundValue-1)) # 4 #same as input interval
push!(lst, newV)
#----
# return newV
#given a = 1, b = 9
length(ar)
lst = []
a = 1;
b = 9;
# [1,[3] ], [4, [7]], [8, 9]
ar = [1, 4, 8]
_first = nothing
i = 2
#focus on the meat
if i > a && i <= length(ar)  #b # i = 2 [4]
    # ar[i]  # 4
    # ar[i]-1 #3 (to be collected with its pair 1)
    if _first === nothing
        _first = ar[i]  # makeVector((a,_first))
        newV = makeVector((a, _first - 1)) #secured the first
        push!(lst, newV)
        i += 1
        return lst, i
    end
    #the meat
    # ar[i]  # 8
    ar[i] - 1 # 7

    ar[i-1] # 4
    newV = makeVector((ar[i-1], ar[i] - 1))
    i += 1
    push!(lst, newV)
    return lst, i
else #i=1
    return
end


#to be named Meaningfully # uses makeVector #successs
function f2(i, ar=[1, 4, 8]) #,_first=nothing)#,lst=[])

    if i > ar[1] && i <= length(ar)  #b # i = 2 [4]
        # ar[i]  # 4
        # ar[i]-1 #3 (to be collected with its pair 1)
        if a == 2 # _first === nothing #side correct
            #  _first = ar[i]  # makeVector((a,_first))
            newV = makeVector((a, ar[i] - 1)) #secured the first
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
        newV = makeVector((ar[i-1], ar[i] - 1))
        # push!(lst, newV)
        return newV #, i
    else
        return
    end
end
f2(2)

#----------
ar = [1, 4, 8]
lst = []
for i = 2:3 #starts from 2 , length(ar)
    push!(lst, f2(i))
end
lst
push!(lst, makeVector(last(ar), b))
lst

#-------- # checkpoint
#Objectives: do stack ops - recursively
_lst = copy(lst) # have a list of interval, waiting to be called by a function recursively

intervalVector = pop!(_lst)
cause!(intervalVector)

#popfirst!(_lst)
if _lst == []
    return
else
    intervalVector = popfirst!(lst) # [1, 3]
    cause(intervalVector)

end

4 - 1 = 3

4, 8 - 1 = 7 -> [4, 7]
# global a = nothing

"""gets net intervasl from the current one """
function f1(lowerboundValue, upperboundValue, indexArray, i; a=nothing)
    #input: count i, lowerboundValue, upperboundValue
    _last = copy(lastindex(indexArray))
    newV = nothing
    # if _next == 0
    #    return
    #else
    if a === nothing
        a = lowerboundValue #assign it
    end
    #else
    if upperboundValue < _last # otherwise,
        a = upperboundValue + 1  #1
        lowerboundValue = a
        # if i < length(arr)
        _next = findNext([1, 4, 8], i) #2 #starting from i=2 whats the next distance
        if _next == 0
            return
        end
        #i=2: [4,_]
        #upperboundValue = lowerboundValue + _next - 1 #3
        #[4,7]
        # newV = makeVector((lowerboundValue, upperboundValue)) # 4
        println("low = ", lowerboundValue, " high =", upperboundValue)

        upperboundValue = lowerboundValue + _next - 1 #3
        #[4,7] = upperboundValue, upperboundValue + _next
        newV = makeVector((upperboundValue, upperboundValue + _next - 1)) # [4,7]
        #newV = makeVector((lowerboundValue, upperboundValue-1)) # 4 #same as input interval
        push!(lst, newV)
    end
    return newV
end
_stack[1][2]
f1(_stack[1][1], _stack[1][2], [1, 4, 8], 1)


#if nextLowerboundValue !== nothing
# lower
#end

# [4,7]
#makeVector((a, _mop - 1))
makeVector((lowerboundValue, upperboundValue - 1)) # [4,7]

#check valid interval (e.g. if upperbound < lowerbound break #loop)
#finally add the trailing part , provided b= 9
upperboundValue = 8
makeVector((upperboundValue, 9)) # [8,9]

#the main point: on how to add & fetch iterval items (using stack) using push! & pop!

#preload values:
_stack = []
push!(_stack, ([1, 3]))
push!(_stack, [4, 7])
push!(_stack, [8, 9])

#now what to do? #Main Objective: evaluate Mainarray content, at thise locations (positions)
## new problem : each stack row(vector) has only 2 items
#Ideal idea: if we pop 2  together it forms a Quesrter
# possible issue :
# what if we have an orphaned 1 vector with 2 items at the end (with no given structure to it) ?
#potential A: does comparing last 2 with one side of the created stucture (via compareTriad) suffice?

#q2.Golden Question: ( Would we be able to guarantee it?) how could we compare & order items at the same time, in one shot?




#--- one liner fix
b = 9 # for a given bound
upperbound = b # lowerbound +1 # upper is the bound    # 9

v = makeVector((lowerbound, upperbound)) # [8,9]
