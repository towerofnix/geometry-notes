[Matrix]
A rectangular table of values.
.
.  In plain text/ASCII, these are equivalent:
.
.    (Inline notation)  [[a b] [c d]]
.
.    (Table notation)   |a b|
.                       |c d|
.
.    (Inline notation)  [[3 7 6] [5 9 1]] - [[2 2 2] [5 5 5]]
.
.    (Table notation)   |3 7 6|  -  |2 2 2|
.                       |5 9 1|     |5 5 5|
.
.  Essentially, each "[a b ...]" of the inline notation represents a row in
.  the table notation.

[Matrix Dimensions]
The height and width of a matrix, as written (m) x (n), where m and n respond
to the number of rows and columns, respectively. (Note that this is ordered
height x width, not width x height; it's easier to think of it as rows x
columns.)

[Element]
Any value found in a matrix (the "cells" of a matrix table).

[Matrix Addition]
Matrices can be added by adding each of the corresponding elements in the
matrices, as long as the matrices have equal dimensions. Matrices with
different dimenions cannot be added.
.
.  For example, evaluating [[3 7] [2 1]] + [[9 0] [4 3]] works as such:
.
.    |3 7|  +  |2 0|  =  |3+2 7+0|  =  |5 7|
.    |2 1|     |4 3|     |2+4 1+3|     |6 4|
.
.  So the resulting matrix is [[5 7] [6 4]].

[Matrix Multiplication with a Scalar]
To multiply a matrix with a number, simply multiply each element of the matrix
by the given number (called the scalar).
.
.  For example, to multiply -2 * [[1 5] [2 4]]:
.
.    -2 * |1 5| = |-2*1 -2*5| = |-2 -10|
.         |2 4|   |-2*2 -2*4|   |-4  -8|

[Matrix Multiplication with a Matrix]
For two matrices to be compatible for multiplication, the number of rows in one
matrix must be equal to the number of columns in another. The resulting matrix
have the same number of one matrix and the number of columns of the other.
(That is, in an AxB * BxC multiplication, the product's dimensions will be
AxC.)
.
.  The general idea behind matrix multiplication is getting the sum of the
.  products of corresponding parts for each row and column in the resulting
.  matrix. An example in practice:
.
.    |4 2 7|  *  |5 6|  =  |R1C1 R1C2|  =  |43 81|
.    |9 8 1|     |1 4|     |R2C1 R2C2|     |56 93|
.                |3 7|
.
.    R1C1 =  4*5 + 2*1 + 7*3  =  20 + 2 + 21  = 43
.    R1C2 =  4*6 + 2*4 + 7*7  =  24 + 8 + 49  = 81
.    R2C1 =  9*5 + 8*1 + 1*3  =  45 + 8 + 3   = 56
.    R2C2 =  9*6 + 8*4 + 1*7  =  54 + 32 + 7  = 93
.
.  It can help to label the separate matrices:
.
.                    "Cols"
.     "Rows"          C1 C2         "Result"
.    R1 |4 2 7|  *  | 5   6 |  =  | R1C1 R1C2 |
.    R2 |9 8 1|     | 1   4 |     | R2C1 R2C2 |
.                   | 3   7 |
.
.  Functions can then be defined for the matrices:
.
.    R1(c) = the c'th element of R1   R1(1) = 4, R1(2) = 2, R1(3) = 7
.    R2(c) = the c'th element of R2   R2(1) = 9, R2(2) = 8, R2(3) = 1
.    C1(r) = the r'th element of C1   C1(1) = 5, C1(2) = 1, C1(3) = 3
.    C2(r) = the r'th element of C2   C2(1) = 6, C2(2) = 4, C2(3) = 7
.
.  And then the values for the resulting matrix can be defined:
.
.    R1C1 = R1(1) * C1(1) + R1(2) * C1(2) + R1(3) * C1(3)
.         =    4  *  5    +    2  *  1    +    7  *  3
.         =       20      +       2       +      21
.         = 43
.
.    R1C2 = R1(1) * C2(1) + R1(2) * C2(2) + R1(3) * C2(3)
.         =    4  *  6    +    2  *  4    +    7  *  7
.         =       24      +       8       +      49
.         = 81
.
.  ..And so on. More general functions can be defined:
.
.    R(r,c) = the c'th element of the r'th row of the "Rows" matrix
.    C(c,r) = the r'th element of the c'th column of the "Cols" matrix
.
.    RC(r,c) = (R(r,1) * C(c,1)) + (R(r,2) * C(c,2)) + (R(r,3) * C(c,3)) ....
.
.  And the general functions, in practice:
.
.    RC(1,1) = R(1,1) * C(1,1) + R(1,2) * C(1,2) + R(1,3) * C(1,3)
.            =     4  *  5     +     2  *  1     +     7  *  3
.            =        20       +        2        +       21
.            = 43
.
.    RC(1,2) = R(1,1) * C(2,1) + R(1,2) * C(2,2) + R(1,3) * C(2,3)
.            =     4  *  6     +     2  *  4     +     7  *  7
.            =        24       +        8        +       49
.            = 81
.
.  ..And so on.
.
.  TODO: What if we're doing an AxB * BxC multiplication, rather than an
.  AxB * BxA multiplication? How do you use the "special" 2x2 matrices used
.  in various transformations?
.
.  Multiplying [[5 2 -1] [1 7 -5]] * [[-1] [-2]] just means
.  [[-1*5 -1*2 -1*-1] [-2*1 -2*7 -2*-5]] = [[-5 -2 1] [-2 -14 10]].
