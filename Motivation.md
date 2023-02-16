# 3 Model 
Considered Neuron j as a Hidden Layer

There is :
input Layer
Hidden Layer 1 HL1
Hidden Layer 2 HL2
Output Layer

---
me: we're still in forward move:
(let us take typical slope : )

Hidden layer 2  takes input from [ hidden layer 1 ]

# Draw 
 A Signal Flow Graph

Line1: a (downwards) sloping line 45 degrees , 
Ends with a small circle labeled (v_j(n) ) 
Local induced field:
the sum (of all w_j,i * input ) Sum[ v_ji = w_j,i * input  ] 
Line1:
1.Bias: 
 y0 = +11
 Weight: wj0 = bj(n) 

Line2:
From node (y1) to ending node v_j
y1 (n)
wj1 
...
Line m [last in previous hidden layer 1]:
y i(n)
w{ j , i} (n): last weight, at iteration n


Output [in Hidden Layer 2] [with m neurons]
 v_j(n) : the Induced Field

#Diagram (abstract)

[HL1] -> v_j(n) -[ Phi(.) ]--> [y_j(n)->[HL2] --> v_k(n) Phi(.) y_k(n)

---
Note: 
the Input neuron in HL1 can be connected to other  neurons in  HL2:

Input from  [HL1: the Previous layer ] ]
is not only connected to this hidden Neuron, 
but all other Neurons, in the Hidden Layer 
---
Induced Local Fields, to this Neuron j 
---
# Draw 
1.HL1: 0 ..  N neurons:
From node v_j(n} 
draw a Straight line Phi(,)
to end node y_j(n) as the output y_j(n)

This y_j(n)
Connected to the output layer 
but considering, as specimen case 
Considering single neuron 
Call neuron : the kth neuron 
Where k belongs to the output Layer 

v_k(n): belongs to the output layer 
y_j(n) connected to several other neurons (to the output layer) 

This will be w_kj(n): connects its output Neuron k,
with the Proceeding Neuron j 
Hidden layer 
Output layer
---

In Hidden Layer 2:

neurons, from 0 .. m:
Several other inputs  
Every Node is also connected to other nodes, in the output layer
# Draw 
Same lines we did for Hidden layer 1: 
Lines 1 , 2,... N each has starting Node( each node's connected To to other nodes in this layer 

Bias:
d_k0(n) 
me: wk0(n) = dl e_j(n)/dl y_j(n) = -1 
where:
 ek(n) =  dl e_j(n)/dl y_j(n) * dk(n) 
---
Layer2: 
Input nodes:
wk1(n) , wk2(n) ...

-Output:
[v_k(n) . Phi(.)] Activation function
outputNode:
yk(.) = v_k(n) . Phi(.)

yj(n) : the actual output  ( as the neuron k)
# Bias
d_k(n)
-Derivative computation:

e_k(n) 
---
sum up:
Considered Neuron j as a hidden layer
[ Neuron as a Hidden Layer 1]
it is connected to its Preceding Layer 
1.input1 y vector for all i 
2,being applied on  v_j(n)
3. compute output of Hidden Layer  y_j(n) 
 call activation function on y_j(n)

All hidden layer 
hidden layer2:
1.input vector w for all neurons k : v_k(n)

2.acitvarion function: 
3,Bias:: dk(n)
-Expectation: 
-Extra computation:
to get error e_k(n):
Calcuated from formula (2)
Partial Derivative 
