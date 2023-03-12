#= to solve the old problem, Programmer may have
to create another  problem & fix it ,
Hence the solution of the original problem lies in the difference between them

=#
module novelApproach

include("./Utils.jl")


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
    #eqn f: f(a,b,n) =  b - (n * a)
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
            #Then do nothing
    #end
    end

    while res >= lower # 1

        if limit < 5 #geometric Criteria: if an Interval is less than the available engineered structure (i.e. 4 or 3) && count >0
            count = i #copy(i)

            nonLinearPart = count * lower # a * i
            println("count: ", count, " upper = ", upper, " count * lower  = ", nonLinearPart, " ")# ok
            #lastres

            res = upper - nonLinearPart #1 # update res [process new value ] # possibility for a negative res ( count * lower)

            #TODO: use upper Values
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

                #=res = i # give res
                #at this point we're done, consider finalizing
                #   if upper > 1 # if you af = i.e. >= does this increase the uncertainty?
                # count = upper - 1
                #break
                #elseif upper == 1 # last value
                #    count = 0
                #  else
                #println("upper is negative ", upper)
                #  end=#
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
end #ends with errors


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


#first
(first(arr, 3), 3)


#----------
#=UncommentMe
local  addition = 0
local count = 0
while addition < b  # cruical #Check #unless function is event driven (called each time )

    #for i = 1 :b
    #count += 1
    #println("count = ", count) uncommentMe
    # if count % 2 == 0 #if #if even return 1
    if addition ==0
        count = addition
    else
        count += 1 #should be +=

        #1: [1,3] + addition (1) = [4,_]
        # 2: [4,6] + 1 = [7,_]
        #3:[] #except last one : no addition

        println("with addition =1 ")#, addition) #" with addition = 1"
        #println("even, with addition = 0")
        # elseif count % 2 != 0 # if odd
        #     addition = 0
        #     println("odd, with addition = 1")
        # end
        #count += 1 #uncommentMe
    end
end
=#

#---------- modifyInterval
#
addition = 1
nextStart = nothing # nullable

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
global addition = 1
global nextStart = nothing

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
# _stack[1][2] #not works as expected  #UncommentMe
#---------

#println("newBound index = ", newBound)



#last added function
#=
[a b]
arr = [1,2,3,4,5,6]
index1 = 1
index2 = 1
ans = 0
if idx <= length(arr) - 1

    index1 = findfirst(x -> x == arr[idx], arr) # 2
    index2 = index1 + 1 # 3   # isn't this unethically wrong
    ans = arr[index2] - arr[index1] #-1 # 8-4 = 4
end
=#

#= idea: if I have some index
    """ calculates the distance of nearest neighbor
    note: assumes values ordered, in an Ascending order"""
    function findNext(arr::Array{Int64,1}, idx::Int64) #compiles
        # a = findfirst(arr[idx])
        # a = []

        index1 = 1
        index2 = 1
        ans = 0
        if idx <= length(arr) - 1

            index1 = findfirst( x -> x == arr[idx], arr) # 2
            index2 = index1 + 1 # 3   # isn't this unethically wrong
            ans = arr[index2] - arr[index1] #-1 # 8-4 = 4
        end

        return ans
    end # corrected return

    =# # unCommentMe
#end

mainstack = []
_mop = findNext([1, 4, 8], 1) # 3  = 4 -1
_mop = findNext([1, 4, 8], 2) #4 = 8- 4

# index([1, 4, 8][2], [1, 4, 8][])

maxLength = length([1, 4, 8]) - 1

#startHere
#requires min
#for i in 1:maxl

mainstack = []
v = nothing

maxLength = 2

arr = [1, 4, 8]
i = 1
nextLowerbound = nothing

#lowerbound #UncommentMe
#upperbound
#----------
#Q.how to deal with the last item?
#---idea
lowerbound = 1
upperbound = 8
v1 = view([1, 4, 8], firstindex([1, 4, 8], 4) ) #ERROR: LoadError: BoundsError: attempt to access 3-element Vector{Int64} at index [[1, 4, 8]]
println("v1  = ",v1) # fill(1)

#ERROR: LoadError: ArgumentError: invalid index: (1, 3) of type Tuple{Int64, Int64}
#v1 = view([1, 4, 8], firstindex([1, 4, 8]),lastindex([1,4,8]) ) #ERROR: LoadError: BoundsError: attempt to access 3-element Vector{Int64} at index [1, 3]

#v1 = view([1, 4, 8], firstindex([1, 4, 8]),4) # ERROR: LoadError: BoundsError: attempt to access 3-element Vector{Int64} at index [1, 4]

#the following is erroneous:
#v2 = view([1, 4, 8], 4, lastindex([1, 4, 8])) #LoadError: BoundsError: attempt to access 3-element Vector{Int64} at index [4, 8]
#println("v2 = ",v2)
#------
#import test
v1 = view([1, 4, 8], firstindex([1, 4, 8], lowerbound));println("v1= ",v1)
v2 = view([1, 4, 8], lastindex([1, 4, 8], upperbound));println("v2= ",v2)

v = vcat(v1,v2) # v(v1: v2)
b = view([1, 0, 0], 1:2) #view(UInt8[0, 0, 0], 2:2)
println("b = ",b)
#@test String(b) == "a"
b = view([0, 0, 1], 2:3) #view(UInt8[0, 0, 0], 2:3)
println("b= ",b)
m = 1; n  = 3

a = collect(1:10)
s = view(a, 1:10); println("s= ",s) #s = view(a, 1, [2,3,5]); println("s= ",s)

#r = reshape(s, length(s)); println("r = ",r)
#= #unCommentMe
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
        v = collect(v1: v2)

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

        v = collect(firstindex([1, 4, 8][lowerbound]): firstindex([1, 4, 8][upperbound]))#

        push!(mainstack, v)
        # nextLowerbound = upperbound + 1 # last =8
    end
    nextLowerbound = upperbound + 1
    i += 1
end
=#

#Handle last item
#issue arr:  ends at 8 (not 9) [missing 1 ]
# moved to upper scope of the function
#  v = collect((firstindex([1,4,8] : nextLowerbound), firstindex([1,4,8],nextLowerbound+1))) #[8,9]
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

#todo: add to intervals stack
lowerboundValue = [1, 4, 8][i] #1  # 8
upperboundValue = lowerboundValue + _next - 1  #a + map #  0 = 1 (not 9) = lastValue # 8
#---------------------------

#[4,8] #now # can become [4,7]
#----in-Depth

_next = findNext([1, 4, 8], 1) #finds difference between first & next # 3


lowerboundValue = a #newV[1]#[1, 4, 8][1] #1  # 8
upperboundValue = lowerboundValue + _next - 1  #a + map #  0 = 1 (not 9) = lastValue # 8

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
newV = collect(lowerboundValue: upperboundValue) # 4
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
    newV = collect(lowerboundValue : upperboundValue) # 4
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
newV = collect(upperboundValue: upperboundValue + _next - 1) # [4,7]

push!(lst, newV)
#----return newV
#given a = 1, b = 9
# length(ar)
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
        _first = ar[i]  # collect((a:_first))
        newV =  collect(a:_first - 1)
        push!(lst, newV)
        i += 1
        return lst, i
    end
    #the meat
    # ar[i]  # 8
    ar[i] - 1 # 7

    ar[i-1] # 4
    newV = collect(ar[i-1] : ar[i] - 1)
    i += 1
    push!(lst, newV)
    return lst, i
else #i=1
    return
end


#-------- # checkpoint
#Objectives: do stack ops - recursively
_lst = copy(lst) # have a list of interval, waiting to be called by a function recursively

#intervalVector = pop!(_lst) # test (unintended)
#cause!(intervalVector) # unCommentMe
#popfirst!(_lst)


if _lst == []
    return
else
    intervalVector = popfirst!(lst) # [1, 3]
    println("intervalVector = ",intervalVector)
    cause(intervalVector)

end

@assert 4 - 1 == 3

# 4, 8 - 1 == 7 -> [4, 7] # what  a creativity # ERROR: 7 not a function
# global a = nothing

_stack = [[1,3],[4,7],[8,9]] # hard-coded _stack
println("_stack[1][2] = ",_stack[1][2])

#f1(_stack[1][1], _stack[1][2], [1, 4, 8], 1) #unCommentMe
#if nextLowerboundValue !== nothing
# lower
#end
# [4,7]

#check valid interval (e.g. if upperbound < lowerbound break #loop)
#finally add the trailing part , provided b= 9
upperboundValue = 8


#the main point: on how to add & fetch iterval items (using stack) using push! & pop!
#preload values:
_stack = []
push!(_stack, ([1, 3]))
push!(_stack, [4, 7])
push!(_stack, [8, 9])

#Now what to do? #Main Objective: evaluate Mainarray content, at these locations (positions)
## new problem : each stack row(vector) has only 2 items
#Ideal idea: if we pop 2  together it forms a Quartet (4) hence, can use compareQuartet

# Possible issue :
# What if we have an orphaned 1 vector with 2 items at the end (with no given structure to it) ?
# Potential A: does comparing last 2 with one side of the created stucture (via compareTriad) suffice?

#Q2.Golden Question: ( Would we be able to guarantee it?)
#How could we Compare & Order items at the same time, in one shot?
#Hence the use of `Event-Driven functions`

#--- one liner fix
b = 9 # for a given bound
upperbound = b # lowerbound +1 # upper is the bound    # 9

end  # module novelApproach
