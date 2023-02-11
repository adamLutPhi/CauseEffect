#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb 10 19:35:21 2023

@author: ahmadlutfi
"""

class Comparison():

    pass


def display(subject: str, desc  : str ="Unexpected error Occured"):
    """Prints message, if error occured """
    
    print("{subject} : {desc}")

# 1. getIndicies(a: int, b: int, lst)
def getIndicies(a: int, b: int, lst):

    """ assumes a,b are values with collection object `lst`
        finds values within `lst`, returns indicies: a,b """

    # TODO: Check if values are in list

    idxA, idxB = lst.index(a), lst.index(b)  # val2index(a, b, lst)
    return idxA, idxB


# Swap

def swap( a: int, b: int, lst):  # correct
    """ If content of indicies a,b are not ordered, swap them
            Otherwise, assume user had mistaken , entering content values in lst
            assuming the best: call procedure to return the contents' indicies
            adds a flag to check if swapping happened (or not) """
        
    #1. Init:   # ensure these are indicies  (not procedure calls)
    idxA, idxB = 0, 0
    n = len(lst)
    nMax = n-1
    is_swapped = None

    #2. Compare
        
    #2.1. check Indicies if above max condition):
    if a > nMax or b > nMax :  # if either indicies a,b above array limit ( suppose user provided values, instead ) 
        # 2.2. Call procedure -  fetch the corresponding indicies :
        idxA, idxB = getIndicies(cls, a=a, b= b, lst=lst)

        # 2.3. Swap indicies with values
        a, b = idxA, idxB

        #2.2 If condition is correct  #checks indicies (only)
    if a < nMax or b < nMax:

        #2.2.1 if content is `Ordered`
        if lst[a] < lst[b]:
            is_swapped = False # don't swap
            print("content Not swapped\n")#end="\n")
                
        #2.2.1 if content is `Unordered`
        elif lst[a] > lst[b]:
            lst[a], lst[b] = lst[b], lst[a] #swap 
            is_swapped = True
            print("content swapped\n") #end="\n")
                
    # 3. Return
    print(f"a = {a}, b = {b}, lst[a] = {lst[a]} , lst[b] = {lst[b]}")
    return a, b, is_swapped
    

def compareTriad( a:int, m1:int, b: int, arr):

    """  comparing is of a (3) three main comparisons

        ##Processing:
        Starting from the left-most:
        ###algebra
        three necessary tuples : 1:(a ,m1) 2:(m1,b) -then-> (a,b)[Transitive relation]
                                 3:(a,m1) 
    """
    try:

        print("swap 1: a, m1 ")
        a, m1, _isSwapped = swap(a= a, b = m1, lst = arr) 
        print("\npost-swap: ")
        print("a, m1, b = ", a, " ", m1, " ", b, " swapped = ", _isSwapped)
            
        print("swap 2: m1, b ")
        # no need for remap, (context: arr is given, & not altered in this one - remap not needed at all )
        m1, b, _isSwapped = swap(a= m1, b= b, lst = arr)  # view(arr, m1:b))
        print("a, m1, b = ", a, " ", m1, " ", b, " swapped = ", _isSwapped)
            
        print("swap 3: a, m1")
        a, m1, _isSwapped = swap(a, m1, arr)  # view(arr, a:m1))
        print("a, m1, b = ", a, " ", m1, " ", b, " swapped = ", _isSwapped)

        
        """ the `fishy` unnecessary swap
            # Stage #4 the missing comparison (Swap if applicable )  #The emergency swap  
            print("swap 4: a , b")
            a, b, _isSwapped = swap(a, b, arr)  # view(arr, a:b)) 
        """
                        
        return a, b, m1
    except Exception:

        # else: Display error message: "Unexpected error" exception = (UnexpectedError, catch_backtrace())
        display( "UnexpectedError")

            
ar1 = [3,2,1]

print(f"Before: array = {ar1}")
a,b, m1 = compareTriad(0, 1, 2, ar1)

print(f"After: array = {ar1}")
