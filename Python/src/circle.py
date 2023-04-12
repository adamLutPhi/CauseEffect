# -*- coding: utf-8 -*-
"""
Created on Tue Apr 11 14:16:11 2023

@author: Ahmad Lutfi

Assumption

a list's _min's index  is 0
a list's _max's index is (len(list) -1]) # -1: 
    as python starts from index=0, 
Hence, if we know the index of vital points, in a list ,
we can do the following computations:


"""
import random
# i.e. random.randint(l1[1])
res = random.randint(1, 2)


def genRandom(a=1, b=2):
    res = random.randint(1, 2)
    return res

def checkIdx(idx,x,lst):
    
    if idx == 0: # that's a min
        # update the min 
        pass
    elif idx == len(lst) -1:
        # update the max 
        pass

class struct:

    def __init__(self, _min, _max):

        self._min = _min
        self._max = _max
        # add a list, to the structure `struct`
        if not _min is _max:
           # 1.1. if they are 2 diffrent numbers, concatenate both
            self.lst = [_min, _max]
        elif _min is _max:
            # 1.2. if same number, append either, to the list
            self.lst = [_min]


        
        
    def add(self, x):
        # compare x, with the `struct` values
        # lvl 0: loop

        # at the end increment (render it valid, the next loop)
        #count +=1

        for item in self.lst:
            # get index
            idx1 = self.lst.index(item)

            idx2Dn = idx1 - 2
            idx2Up = idx1 + 2
            # what is an ideal condition to stop ?
            if self.lst[idx2Dn] < x < item:  # 0<1< 2

                # x would be at `item2`'s location
                # idx2=  #self.lst.index(item2)

                # x's new index would be item2's index(other items are shifted)
                self.lst.insert(idx2Dn, x)
                return idx2Dn

            elif item < x < self.lst[idx2Up]:   # i.e. 0 < 1 < 2 {+2 diff}

                # x would be at item1's location
                idx1 = self.lst.index(item)
                self.lst.insert(idx1, x)

                return idx1
                # at the end increment (render it valid, the next loop)
                #count +=1
            else:
                raise ValueError


def addAlt(lst, x):
    """ An alternative (longer) way to add x to a list, orderly """
    # having `self` allows us to access the instance's list
    for item1, item2 in lst:

        # what is an ideal condition to stop ?
        if item2 < x < item1:  # x> item:

            # x would be at `item2`'s location
            idx2 = lst.index(item2)

            # x's new index would be item2's index(other items are shifted)
            lst.insert(idx2, x)
            return idx2

        elif item1 < x < item2:

            # x would be at item1's location
            idx1 = lst.index(item1)
            lst.insert(idx1, x)
            return idx1
        else:
            raise ValueError


class Mins(struct):

    def __init__(self, _min, _max):
        super(Mins).__init__(_min, _max)

    # def add(x):
    #    return super(Mins).add(x)


class Mids(struct):

    def __init__(self, _min, _max):
        super(Mids).__init__(_min, _max)

    # def add(x):
    #    return super(Mids).add(x)


class Maxes(struct):

    def __init__(self, _min, _max):
        super(Maxes).__init__(_min, _max)

    # def add(x):
    #   return super(Maxes).add(x)


class circle:
    """
    a circle is an abstract idea of a more concrete example i.e. a pizza tray.
    Imagine:  ordered a pizza for your kid, and got a family size.
    the worker there unfortunately is on the first day, training; he was worried
    on how to cut the pizza !
    they were cut: thin at first 1 to 3 o'clock , medium  in the middle, 4 to 6 o'clock 
    large , near 9 to 12 O'clock
    your son's friends each takes a piece, but got busy with the new game
    as a parent, your mission to organize the household , including returning each pizza piece
    to the tray ( so that a you could reheat the pizza , as a whole)
    this means, you've got to stick the thin pieces at first
    the middle pieces next, 
    then the large ones, at last
    thus, the 3 parts that make up a whole pizza:
    1. Mins
    2. Mids
    3. Maxes 
    
    
    """

    def __init__(self, _mins, _mids, _maxes):

        self.Mins = Mins(_mins[0], _mins[1])
        self.Mids = Mids(_mids[0], _mids[1])
        self.Maxes = Maxes(_maxes[0], _maxes[1])
        self.circleList = self.Mins.lst + self.Mids.lst + self.Maxes.lst
        
        #Demo only:
        #self.updateCircleList(10,2,self.Mins.lst, self.Mins)
        
    def checkIdx(self,idx,x,lst, _struct: struct):
            
        if idx == 0: # that's a min
            # update the min 
            _struct.min = x 
                
        elif idx == len(lst) -1:
            
            # update the max 
            _struct.max = x
                
    def updateCircleList(self,x, xIdx, lst : list, _struct : struct):
        """#Note the given index is an index of x given a particular list:
            (x | list) where list can be = { Mins, Mids, Maxes}
            i.e., if Mids has length size of 2 items, xIdx=2 how can we transform it ?
            
            transform function changes :
            the _min & _max would prove useful, here, in this situation, in particular
            
            
        """
        #Update: mins, maxes 
        self.checkIdx( xIdx , x , lst, _struct )
        
        
    def add(self, x):

        try:

            # 0. check if range is valid
            # self.Mins._min <= x <=  self.Maxes._max:
            if self.Mins._min < x < self.Maxes._max:

                # 1. start with the middle `Mid`
                # self.Mids._min <= x <= self.Mids._max:
                if self.Mids._min < x < self.Mids._max:
                    # Mids.add(x)
                    self.Mids.add(x)

                elif self.Maxes._min <= x <= self.Maxes._max:
                    # Maxes.add(x)
                    self.Maxes.add(x)  # , _max)

                elif self.Mins._min <= x <= self.Mins._max:
                    # add x to the mina
                    self.Mins.add(x)

                # TODO: account for whther x is in between some
                # Boundary conditions i.e.
                elif self.Mins._max < x < self.Mids._min:
                    # Note: it doesn't matter which list it goes to
                    n = genRandom(1, 2)
                    if n == 1:
                        self.Mins.lst.append(x)
                    if n == 2:
                        self.Mids.lst.append(x)

                    # ( Mins._max < x < Mids._min)
                    # Mids._max < x < Maxes.min
                   # pass

                elif self.Mids._max < x < self.Maxes.min:
                    # pass
                    n = genRandom(1, 2)

                    if n == 1:
                        self.Mids.lst.append(x)  # .lst.append(n)
                    if n == 2:
                        self.Maxes.lst.append(x)

                return True
        except:
            raise ValueError("Unexpected error occured, please recheck ")


# DEMO:

a = 5
# give 2 lists: make a code to pick up either lists, `randomly`
l2 = [6, 7]  # 2
l1 = [3, 4]   # 1
print(l1[len(l1) -1])
print("total list = ", l1+l2)
# if `a` falls between the cracks of l1, or l2 :
# q. where should it belong: l1 , or l2 ?
# ( it can be either)

# q. the new item x, where shall it belong to? to the
# a. short answer: it doesn't mater
# 1 suggestion : let  a random function chooses for you
# How can we make solution cheaper?


# a switch would have made the solution better off
def applyChoice(x, l1=l1, l2=l2):
    """ applies a given choice, to return a list """
    if x == 1:
        # pick first list
        return l1

    if x == 2:
        # pick second liset
        return l2


print(f"res = {res}")

print(f"picked up list: {applyChoice(res)}")
if l1[1] < a < l2[0]:
    # gen a random
    x = genRandom(1, 2)

    l = applyChoice(x, l1, l2)
    print("l = ", l)
