# Transfer Function to A,B,C,D Parameter

This project help to find A,B,C,D parameter of a system from TF using direct method,
column method and row wise method

## How to use 
> First insert number of row and column
> then insert numerator and denominator polynomial of each element
> [1,2,3] refere to x^2 + 2*x + 3 , [0,0,1] refer to 0*x^2 + 0*x^1 + 1

## Example

 ACS_ABCD_from_TF
enter number of rows
2
enter number of columns
2
enter the numerator for (1,1) 
Enter numbers separated by space: 
4 -10
enter the denominator for (1,1) 
enter numbers separated by space: 
2 1
enter the numerator for (1,2) 
Enter numbers separated by space: 
3
enter the denominator for (1,2) 
enter numbers separated by space: 
1 2 1
enter the numerator for (2,1) 
Enter numbers separated by space: 
2 1
enter the denominator for (2,1) 
enter numbers separated by space: 
2 1 2
enter the numerator for (2,2) 
Enter numbers separated by space: 
1 -1
enter the denominator for (2,2) 
enter numbers separated by space: 
1 2 2
 
 -------------------------------------------------------- 
 
------ THE MINIMUM ORDER STATE SPACE MODEL ----
both row wise and column wise yield order NIMIAL STATE SPACE MODEL
super-position by dividing the TF matrix column wise, MINIMAL STATE SPACE MODEL
A = 
         0    1.0000         0         0         0         0         0
         0         0    1.0000         0         0         0         0
   -0.5000   -1.2500   -1.0000         0         0         0         0
         0         0         0         0    1.0000         0         0
         0         0         0         0         0    1.0000         0
         0         0         0         0         0         0    1.0000
         0         0         0   -2.0000   -6.0000   -7.0000   -4.0000

B = 
     0     0
     0     0
     1     0
     0     0
     0     0
     0     0
     0     1

C = 
   -6.0000   -3.0000   -6.0000    6.0000    6.0000    3.0000         0
    0.2500    1.0000    1.0000   -1.0000   -1.0000    1.0000    1.0000

D = 
[2, 0]
[0, 0]
 
==============================================================
super-position by dividing the TF matrix ROW wise
A = 
         0         0   -0.5000         0         0         0         0
    1.0000         0   -2.0000         0         0         0         0
         0    1.0000   -2.5000         0         0         0         0
         0         0         0         0         0         0   -2.0000
         0         0         0    1.0000         0         0   -3.0000
         0         0         0         0    1.0000         0   -4.0000
         0         0         0         0         0    1.0000   -2.5000

B = 
   -6.0000    1.5000
  -12.0000    3.0000
   -6.0000         0
    1.0000   -1.0000
    3.0000    0.5000
    2.5000   -0.5000
    1.0000    1.0000

C = 
     0     0     1     0     0     0     0
     0     0     0     0     0     0     1

D = 
[2, 0]
[0, 0]
 
STATE SPACE MODEL IN CCF FORM
A = 
         0         0    1.0000         0         0         0         0         0         0         0         0         0         0         0
         0         0         0    1.0000         0         0         0         0         0         0         0         0         0         0
         0         0         0         0    1.0000         0         0         0         0         0         0         0         0         0
         0         0         0         0         0    1.0000         0         0         0         0         0         0         0         0
         0         0         0         0         0         0    1.0000         0         0         0         0         0         0         0
         0         0         0         0         0         0         0    1.0000         0         0         0         0         0         0
         0         0         0         0         0         0         0         0    1.0000         0         0         0         0         0
         0         0         0         0         0         0         0         0         0    1.0000         0         0         0         0
         0         0         0         0         0         0         0         0         0         0    1.0000         0         0         0
         0         0         0         0         0         0         0         0         0         0         0    1.0000         0         0
         0         0         0         0         0         0         0         0         0         0         0         0    1.0000         0
         0         0         0         0         0         0         0         0         0         0         0         0         0    1.0000
   -1.0000         0   -5.5000         0  -13.0000         0  -18.7500         0  -18.5000         0  -12.2500         0   -5.0000         0
         0   -1.0000         0   -5.5000         0  -13.0000         0  -18.7500         0  -18.5000         0  -12.2500         0   -5.0000

B = 
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     0     0
     1     0
     0     1

C = 
  -12.0000    3.0000  -42.0000   10.5000  -72.0000   15.0000  -81.0000   15.7500  -60.0000    9.0000  -27.0000    3.0000   -6.0000         0
    0.5000   -0.5000    3.5000   -1.7500    9.7500   -1.7500   14.0000   -0.2500   11.2500    1.2500    5.0000    2.0000    1.0000    1.0000

D = 
[2, 0]
[0, 0]
 
>> ACS_ABCD_from_TF
enter number of rows
2
enter number of columns
2
enter the numerator for (1,1) 
Enter numbers separated by space: 
4 -10
enter the denominator for (1,1) 
enter numbers separated by space: 
2 1
enter the numerator for (1,2) 
Enter numbers separated by space: 
3
enter the denominator for (1,2) 
enter numbers separated by space: 
1 2
enter the numerator for (2,1) 
Enter numbers separated by space: 
1
enter the denominator for (2,1) 
enter numbers separated by space: 
2 5 2
enter the numerator for (2,2) 
Enter numbers separated by space: 
1 1
enter the denominator for (2,2) 
enter numbers separated by space: 
1 4 4
 
 -------------------------------------------------------- 
 
------ THE MINIMUM ORDER STATE SPACE MODEL ----
super-position by dividing the TF matrix column wise, MINIMAL STATE SPACE MODEL
A = 
         0    1.0000         0         0
   -1.0000   -2.5000         0         0
         0         0         0    1.0000
         0         0   -4.0000   -4.0000

B = 
     0     0
     1     0
     0     0
     0     1

C = 
  -12.0000   -6.0000    6.0000    3.0000
    0.5000         0    1.0000    1.0000

D = 
[2, 0]
[0, 0]
 
==============================================================
 ----- THE OTHER STATE SPACE MODEL ---------
super-position by dividing the TF matrix ROW wise
A = 
         0   -1.0000         0         0         0
    1.0000   -2.5000         0         0         0
         0         0         0         0   -2.0000
         0         0    1.0000         0   -6.0000
         0         0         0    1.0000   -4.5000

B = 
  -12.0000    1.5000
   -6.0000    3.0000
    1.0000    0.5000
    0.5000    1.5000
         0    1.0000

C = 
     0     1     0     0     0
     0     0     0     0     1

D = 
[2, 0]
[0, 0]
 
==============================================================
STATE SPACE MODEL IN CCF FORM
A = 
         0         0    1.0000         0         0         0
         0         0         0    1.0000         0         0
         0         0         0         0    1.0000         0
         0         0         0         0         0    1.0000
   -2.0000         0   -6.0000         0   -4.5000         0
         0   -2.0000         0   -6.0000         0   -4.5000

B = 
     0     0
     0     0
     0     0
     0     0
     1     0
     0     1

C = 
  -24.0000    3.0000  -24.0000    7.5000   -6.0000    3.0000
    1.0000    0.5000    0.5000    1.5000         0    1.0000

D = 
[2, 0]
[0, 0]
 
>> 
 
>> 

## Installation

Either use matlab git directly of simply copy paste the code as it is a single file

## License

MIT

