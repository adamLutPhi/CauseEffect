
#unused function

#so: no More #iterative function 

#cause meeded to be called, on the next interval (iteratively )
#cause!() that does all: calls itself to proceed, further , into the next interval,
# where you record it's return (next lowerBound,upperBound
#in general : there aren't no right or left, only 1 function (2 subsequent effects
# 1.1 1 for the rigth -> calls cause right [m1, upperBound, OR m2,upperBound ]) 
#1.2.  another left ->calls cause left pts (lowerBound,m1 always )

# """ called after compare Quartet """
#=
function remapCompare(m2, upperBound, _view::SubArray)

    m2, upperBound = remap(m2, upperBound)
    println(" m2,upperBound = ", m2, upperBound)
    _view = collect(m2:upperBound) |> v-> view(v, firstindex(v):lastindex(v))
    m2, upperBound = doCompare(m2, upperBound, view(_view, m2:upperBound))

end
=#

#helpers of Util file:

#=
    #unused 
    """returns the element, at lowerBound specific index"""
function elementOf(arr, n::Int64)

    return first(arr, n)[n] #return the first n elements i.e. 2nd: [1:4] , [1:4][2] = 4

end
=#
#--------

#=
function makeView(ab::UnitRange)#compiles
    lowerBound = ab[1]
    upperBound = ab[2]
    println("upperBound = ", upperBound)
    v = collect(lowerBound:upperBound)
    return view(v, firstindex(v):lastindex(v))
    # return view(collect(ab), (ab)[1]:(ab)[length(ab)])
end

v = collect(1:2)
view(v, 1:2)#done 
=#
#=
function makeView(_view::SubArray, range) # Bug # this is not the  the way

    v = @view _view[range]
    return v
end
=#


function calcTotalMiddles(lowerBound, upperBound) #name displays what it supposed to do 

    res = intervalLength(lowerBound, upperBound) - 2
    println("currentValue (from bound pts to middles left)  = intervalLength(lowerBound, upperBound) - 2 =", res)
    # res >=0 ? return res;  : return nothing 
    if res > 0
        return res
    elseif res <= 0
        return 0 #-1
    end
end


#1 function implementation

function cause!(_stack, kernel)
    if _stack > 0
        interval = pop!(_stack)
        lowerBound = interval[1]
        upperBound = interval[2]
        effect!(lowerBound, upperBound, kernel)
    end

end





arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#= =#
#------------

### A:  calcTotalMiddles

#Depreciate 
#=
function calcTotalMiddles(arr) #name displays what it supposed to do 

    res = length(arr) - 2
    println("init calcTotalMiddles; currentValue (from bound pts to middles left) = length(arr) - 2= ", res)
    # res >=0 ? return res;  : return nothing 
    if res > 0
        return res
    elseif res <= 0
        return 0 # -1 
    end
end
=#



#------
#compareSort 
#advanced: define lowerBound _stack of inputs #TODO: Check 
group = 1 # given group
# TODO pass (or define) lowerBound `_stack` [for recursion operator ]
if group == 1 # only 1 per item 
    #complete Triad : [lastB, interval[1], interval[2]

    #GET Last upperBound = currentA #pop!
    interval = length(_stack) > 0 ? pop!(_stack) : return  #<-------
    #form lowerBound view from lastB, & interal (midpoint newInterval[1] becomes implicit)
    #view(lastB,interval[2]))
    #lastb = pts[length(pts)-1 #erroneous part
    # _view = view(pts[length(pts)-1]:interval[2], [lastb, interval[1] , interval[2]] )
    #_view = view([lastb, interval[1], interval[2]], [lastb, interval[1], interval[2]])# acceptable? 
    # interval = union(last, interval) #<---------
    lowerBound = interval[1]
    upperBound = interval[2]

    lowerBound, m, upperBound = inferLocation(lastB, lowerBound, upperBound)
    interval = union(lowerBound, m, upperBound)

    _view = collect(interval) |> _view -> view(_view, firstindex(_view):lastindex(_view))

    #create view with points of lastb, lastrange 
    # Compare(lowerBound, upperBound, _view) #
    #sort
    res = compareTriad(lowerBound, m, upperBound, _view) #CompareSort(lastb, interval[2], _view) #compareTriad # <----
    return res
    # group = 0
elseif group == 2
    #Calls compare Quartet
    #sth useful
    #TODO: make arguments in relation to pts i.e. pts[length(pts)-1]

    #  _view = view(lastA:interval[2], [lastA,lastB, interval[1], interval[2]])
    #_view = ptsToViews(pts[length(pts)-1-1])
    #union()
    #_view = view([pts[length(pts)-1-1], pts[length(pts)-1], interval[1], interval[2]],
    #    pts[length(pts)-1-1]:interval[2])
    collection = collect(length(pts)-1-1:interval[2])
    _view = collection |> _view -> view(_view, firstindex(_view):lastindex(_view))
    _view = collect(length(pts)-1-1:interval[2]) |> _view -> view(_view, firstindex(_view):lastindex(_view))
    # _view = view(pts[length(pts)-1-1]:interval[2], [pts[length(pts)-1-1],  pts[length(pts)-1], interval[1], interval[2]])
    Collection
    _length = copy(length(collection))
else
    _view = collect(firstindex(_length):lastindex(_length)) |> _view -> view(_view, firstindex(_view):lastindex(_view))
    lowerBound = firstindex(_length)
    upperBound = lastindex(_length)
    if _length == 4
        compareQuartet(lowerBound, lowerBound + 1, upperBound - 1, upperBound, _view)
    elseif _length == 3
        compareTriad(lowerBound, upperBound - 1, upperBound, _view)
    elseif _length == 2
        doCompare(lowerBound, lastindex(upperBound), _view)
    end
end
# ArgumentError: array must be non-empty

