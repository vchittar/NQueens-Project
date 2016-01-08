Vishnu Chittari
Scheme 3-4 N-Queens 

Note: I ran this on Dr. Racket on the language R5RS.

Description
For this problem we had to calculate a NxN chessboard in such a way that no one queen on the board threatens the other.  

Implementation

Backtracking
Backtracking is a greedy algorithm to solve the N-Queens problem. We start of the problem by initializing an empty board at the first and then it gets filled with queens column by column by column. The queens are placed in a row that does not have conflicts with the filled out part of the board. If there is not a single row in a current column that doesn’t cause conflicts, the algorithm will backtrack to a previous column and will try to select a different queen placement. This process will keep going until there is no such empty column. 

Min-Conflict
Another approach to solving the N-Queens problem was the Min-Conflicts one. This is much more efficient than that of the Backtracking version. Basically Min-Conflict works by placing random queens all over the “n” chessboard and then finds a random column with a conflict and replaces it in a row with the minimum conflicts for such said column. I had my idea from CB’s pseudocode and it helped me gain some much needed inspiration to solve the problem. 


Another issue we had to tackle was to we had to use true or false values to represent our answers. If we had our boolean value as false then we had to return the number of steps and the vector list and if it was true we had to return the queens arranged on the board alongside with the number of steps and the vector list where the queens were placed.


Files
Another.rkt
Writeup.pdf : A more detailed analysis of the implementaion and my functions
Readme_Scheme3-4.txt : A breif description of the project 
Graphs.xlsx : The graphs required I used for this project and the data collected


Extra Credit
I found that my backtracking will provide a solution to a 25 size chessboard in less than 20seconds.

 Sample Output:

 > (nq-bt #t 25)
"Backtracker:"
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 
Queens:#(0 2 4 1 3 8 10 12 14 18 20 23 19 24 22 5 7 9 6 13 15 17 11 16 21)
Steps:1265433
Time:7985.762939453125

I also found that my min-conflict algorithm is relatively fast and solves the board rather quickly. I explained the algorithm more in the writeup and my design choices. 






