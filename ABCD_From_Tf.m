
% ================================================
% A here is form of     0   1   0
%                       0   0   1
%                      -a  -b  -c

% B here is form of     0
%                       0
%                       1

% C is form of          [N1 N2 N3]

% D is form of          d1   d2
%                       d3   d4

% this change for row - wise super position where 
% A = A' , B = C' , C = B'

% note in input  1 2 0 4 represent 1*s^3 + 2*s^2 + 0*s^1 + 4*s^0

% get number of rows and columns
rows = input("enter number of rows");
columns = input("enter number of columns");

Numerator = {};    %Numerator{i} represent all numerators of element present in row i
Denominator = {};  %Denominator{i} represent all denominatos of element present in columns i
syms s;            %variable s for all polynomial

% -------------------- take inputs ---------------------------

for r = 1:rows
    temp_num = {}; %take input of numerators for row r
    temp_den = {}; %take input of denominator for column c

    for c = 1:columns

        fprintf("enter the numerator for (%d,%d) \n",r,c);
        num = input('Enter numbers separated by space: ', 's');

        num = str2num(num);
        temp_num{end+1} = num;

        fprintf("enter the denominator for (%d,%d) \n",r,c);
        den = input('enter numbers separated by space: ','s');

        den = str2num(den);
        temp_den{end+1} = den;
    end 

    Numerator{end+1} = temp_num;
    Denominator{end+1} = temp_den;

end
disp(" ");
disp(" -------------------------------------------------------- ");
disp(" ");
% ------------------------- TAKING INPUT COMPLETE----------------------------

%-------------CREATE A,B,C,D MATRIX FOR COLUMN WISE SUPER-POSITION METHOD --------------

allA = {};
allB = {};
allC = {};
allD = {};

for c = 1:columns
    Numerator_column = {};
    Denominator_column = {};
   
    for r = 1:rows
        Denominator_poly = [Denominator{r}{c}];
        Numerator_poly = [Numerator{r}{c}];

        tempDenominator_column = {Denominator_poly};
        tempNumerator_column = {Numerator_poly};

        Numerator_column{end+1} = tempNumerator_column;
        Denominator_column{end+1} = tempDenominator_column;
    end    

    partA = [];
    partB = [];
    partC = [];
    partD = [];

    [partA,partB,partC,partD] = getABCD(Denominator_column,Numerator_column,rows,1,false);
    
    
    allA{end+1} = partA;
    allB{end+1} = partB;
    allC{end+1} = partC;
    allD{end+1} = partD;
 
end   

zeroMatrix = zeros(columns,columns); %depend upon number of input
identityMatrix = eye(columns);           % depend upon number of input

% -------------------------- FOR A MATRIX -------------------------

% to get size of A matrix

% for each element of A , row = column

length = size(allA);
total_size = 0;

for i = 1:length(1,2)

    partA_size = size([allA{i}]);
    partA_size = partA_size(1,2);

    total_size = partA_size + total_size;
end    

% to create total_size*total_size matrix for A

A_superposition = zeros(total_size,total_size);

relative_index = 0;

for i = 1:length(1,2)
    partA = [allA{i}];

    n = size(partA);
    n = n(1,2);

    for r = 1:n
      for c = 1:n
          A_superposition(r + relative_index,c + relative_index) = partA(r,c);
      end    
    end    

    relative_index = relative_index + n;
end    

% --------------------- COMPLETE --------------------------

% --------------------- FOR B MATRIX ----------------------

length = size(allB);
B_row = 0;
B_column = 0;

for i = 1:length(1,2)

    partB_size = size([allB{i}]);

    B_row =  partB_size(1,1) + B_row; 
    B_column = partB_size(1,2) + B_column;
end    

% to create total_size*total_size matrix for A

B_superposition = zeros(B_row,B_column);

relative_index_row = 0;
relative_index_column = 0;

for i = 1:length(1,2)
    partB = [allB{i}];

    n = size(partB);
    cB = n(1,2);
    rB = n(1,1);

    for r = 1:rB
      for c = 1:cB
          B_superposition(r + relative_index_row,c + relative_index_column) = partB(r,c);
      end    
    end    

    relative_index_row = relative_index_row + rB;
    relative_index_column = relative_index_column + cB;
end    

%---------------------- C matrix -----------------------------

C_superposition = [];

length = size(allC);
length = length(1,2);

for i = 1:length
    partC = [allC{i}];
    C_superposition = [C_superposition,partC];
end    

% -----------------------complete ------------------------------

% ----------------------- D matrix -----------------------------
D_superposition = [];

length = size(allD);
length = length(1,2);

for i = 1:length
    partC = [allD{i}];
    D_superposition = [D_superposition,partC];
end    

%------------------------super-position column wise complete-------------

%------------------------ CCF FORM ---------------------------

[Accf,Bccf,Cccf,Dccf] = getABCD(Denominator,Numerator,rows,columns,false);

% ------------------- super position by dividing rows wise -----------

allAR = {};
allBR = {};
allCR = {};
allDR = {};

for r = 1:rows
    Numerator_rows = {};
    Denominator_rows = {};
    
    tempDenominator_rows = {};
    tempNumerator_rows = {};

    for c = 1:columns

        Denominator_poly = [Denominator{r}{c}];
        Numerator_poly = [Numerator{r}{c}];

        tempDenominator_rows{end + 1} = Denominator_poly;
        tempNumerator_rows{end + 1} = Numerator_poly;
       
    end    
    
    Numerator_rows{end+1} = tempNumerator_rows;
    Denominator_rows{end+1} = tempDenominator_rows;

    partA = [];
    partB = [];
    partC = [];
    partD = [];

    [partA,partB,partC,partD] = getABCD(Denominator_rows,Numerator_rows,1,columns,true);
    
    partAR = partA';
    partBR = partC';
    partCR = partB';
    partDR = partD;

    allAR{end+1} = partAR;
    allBR{end+1} = partBR;
    allCR{end+1} = partCR;
    allDR{end+1} = partDR;

end    

% ------------------- FOR B MATRIX -----------------------------

length = size(allBR);
length = length(1,2);

B_RowWise = [];

for i = 1:length
    partBR = [allBR{i}];
    
    n = size(partBR);
    n = n(1,1);

    k = 1;
    temp_B = [];

    for j = 1:n
        temp_B = [temp_B,partBR(j,1)];
        
        if k == columns
           k = 0;
           B_RowWise = [B_RowWise ; temp_B];
           temp_B = [];
        end 
        k = k + 1;
    end    
end    

% -------------------------- FOR A MATRIX -------------------------

% to get size of A matrix

% for each element of A , row = column

length = size(allAR);
total_size = 0;

for i = 1:length(1,2)

    partA_size = size([allAR{i}]);
    partA_size = partA_size(1,2);

    total_size = partA_size + total_size;
end    

% to create total_size*total_size matrix for A

A_RowWise = zeros(total_size,total_size);

relative_index = 0;

for i = 1:length(1,2)
    partA = [allAR{i}];

    n = size(partA);
    n = n(1,2);

    for r = 1:n
      for c = 1:n
          A_RowWise(r + relative_index,c + relative_index) = partA(r,c);
      end    
    end    

    relative_index = relative_index + n;
end    

% --------------------- COMPLETE --------------------------

% --------------------- C MATRIX -----------------------------

length = size(allCR);
C_row = 0;
C_column = 0;

for i = 1:length(1,2)

    partC_size = size([allCR{i}]);

    C_row =  partC_size(1,1) + C_row; 
    C_column = partC_size(1,2) + C_column;
end    

% to create total_size*total_size matrix for A

C_RowWise = zeros(C_row,C_column);

relative_index_row = 0;
relative_index_column = 0;

for i = 1:length(1,2)
    partC = [allCR{i}];

    n = size(partC);
    cC = n(1,2);
    rC = n(1,1);

    for r = 1:rC
      for c = 1:cC
          C_RowWise(r + relative_index_row,c + relative_index_column) = partC(r,c);
      end    
    end    

    relative_index_row = relative_index_row + rC;
    relative_index_column = relative_index_column + cC;
end    

%----------------------- D MATRIX --------------------------------------

D_RowWise = [];

length = size(allDR);
length = length(1,2);

for i = 1:length
    partD = [allDR{i}];
    D_RowWise = [D_RowWise;partD];
end  



% --------------------PRINT ANSWER----------------------------------------

NC = size(A_superposition);
NC = NC(1,2);

NR = size(A_RowWise);
NR = NR(1,2);

N = size(Accf);
N = N(1,2);

if NC < NR
    disp("------ THE MINIMUM ORDER STATE SPACE MODEL ----");
    disp("super-position by dividing the TF matrix column wise, MINIMAL STATE SPACE MODEL");

    disp("A = ")
    disp(A_superposition);

    disp("B = ");
    disp(B_superposition);

    disp("C = ")
    disp(C_superposition);

    disp("D = ")
    disp(D_superposition);

    disp("==============================================================")
    disp(" ----- THE OTHER STATE SPACE MODEL ---------")

    % -----------print ROW WISE super-position ---------------------------

    disp("super-position by dividing the TF matrix ROW wise")

    disp("A = ")
    disp(A_RowWise);

    disp("B = ");
    disp(B_RowWise);

    disp("C = ")
    disp(C_RowWise);

    disp("D = ")
    disp(D_RowWise);
    %------------------------- CCF FORM --------------------------------
    disp("==============================================================")
    disp("STATE SPACE MODEL IN CCF FORM")

    disp("A = ")
    disp(Accf);

    disp("B = ");
    disp(Bccf);

    disp("C = ")
    disp(Cccf);

    disp("D = ")
    disp(Dccf);

elseif NR < NC
     % -----------print ROW WISE super-position ---------------------------
    disp("------ THE MINIMUM ORDER STATE SPACE MODEL ----");
    disp("super-position by dividing the TF matrix row wise")

    disp("A = ")
    disp(A_RowWise);

    disp("B = ");
    disp(B_RowWise);

    disp("C = ")
    disp(C_RowWise);

    disp("D = ")
    disp(D_RowWise);
    disp("==============================================================")
    disp(" ----- THE OTHER STATE SPACE MODEL ---------")
    disp("super-position by dividing the TF matrix column wise");

    disp("A = ")
    disp(A_superposition);

    disp("B = ");
    disp(B_superposition);

    disp("C = ")
    disp(C_superposition);

    disp("D = ")
    disp(D_superposition);
    % ---------------------- CCF FORM -------------------------
    disp("==============================================================")
    disp("STATE SPACE MODEL IN CCF FORM")

    disp("A = ")
    disp(Accf);

    disp("B = ");
    disp(Bccf);

    disp("C = ")
    disp(Cccf);

    disp("D = ")
    disp(Dccf);
else
    disp("------ THE MINIMUM ORDER STATE SPACE MODEL ----");
    disp("both row wise and column wise yield order NIMIAL STATE SPACE MODEL");
    disp("super-position by dividing the TF matrix column wise, MINIMAL STATE SPACE MODEL");

    disp("A = ")
    disp(A_superposition);

    disp("B = ");
    disp(B_superposition);

    disp("C = ")
    disp(C_superposition);

    disp("D = ")
    disp(D_superposition);

    disp("==============================================================")
  
    % -----------print ROW WISE super-position ---------------------------

    disp("super-position by dividing the TF matrix ROW wise")

    disp("A = ")
    disp(A_RowWise);

    disp("B = ");
    disp(B_RowWise);

    disp("C = ")
    disp(C_RowWise);

    disp("D = ")
    disp(D_RowWise);
    % ---------------------------- CCF FORM ------------------------------
    disp("STATE SPACE MODEL IN CCF FORM")

    disp("A = ")
    disp(Accf);

    disp("B = ");
    disp(Bccf);

    disp("C = ")
    disp(Cccf);

    disp("D = ")
    disp(Dccf);
end    

% ------------------------------------------------------------------------
zeroMatrix = zeros(columns,columns); %depend upon number of input
identityMatrix = eye(columns);           % depend upon number of input

% --------------------------------------------------------
function [A,B,C,D] = getABCD(Denominator,Numerator,rows,columns, isRowWise)

% --------------- LCM of all denominators ---------------

syms s;              %variable s for all polynomial

Denominator_LCM = 1; %store lcm of all denominator

for r = 1:rows

    column_denominator = Denominator{r};

    for c = 1:columns
       Denominator_poly = [column_denominator{c}];
       
       Denominator_poly = poly2sym(Denominator_poly,s);
       Denominator_LCM = lcm(Denominator_poly,Denominator_LCM); %get lcm of denominators present in row r
    end    
end    

Denominator_LCM = expand(Denominator_LCM);


Denominator_LCM_column = [coeffs(Denominator_LCM)]; % store coefficient of polynomial LCM
        
Denominator_LCM_column = double(Denominator_LCM_column); % type casting is important sym -> double for deconv to work
     

Denominator_LCM_column = fliplr(Denominator_LCM_column); % reverse for ex. 2 + s*1 to s*1 + 2

% ----------------------------------------------------------

% ---------------D MATRIX -----------------------------

D = [];

for r = 1:rows

    column_denominator = Denominator{r};
    column_numerator = Numerator{r};
    
    temp_D = [];
    for c = 1:columns

        Denominator_poly = [column_denominator{c}];
        Numerator_poly = [column_numerator{c}];

        Denominator_poly = poly2sym(Denominator_poly,s);
        Numerator_poly = poly2sym(Numerator_poly,s);

        f_x = Numerator_poly / Denominator_poly;

        % Calculate the limit of f(x) as x approaches infinity
        limit_f_x = limit(f_x, s, Inf);

        temp_D = [temp_D,limit_f_x];
    end    

    D = [D ; temp_D];
end

% --------------- D matrix complete ---------------------

% --------------- to get Gsp ----------------------------

for r = 1:rows

    column_denominator = Denominator{r};
    column_numerator = Numerator{r};

    for c = 1:columns

        Denominator_poly = [column_denominator{c}];
        Numerator_poly = [column_numerator{c}];

        d = D(r,c);

        if size(Denominator_poly) == size(Numerator_poly)

             NewNumerator = Numerator_poly - d*Denominator_poly;
             Numerator{r}{c} = NewNumerator;
 
        end
    end    
end

%--------------------- multiply lcm with Gsp -------------------------
for r = 1:rows

    column_denominator = Denominator{r};
    column_numerator = Numerator{r};

    for c = 1:columns

        Denominator_poly = [column_denominator{c}];  
        Numerator_poly = [column_numerator{c}];

        Numerator_poly = double(Numerator_poly);
        Denominator_poly = double(Denominator_poly);
        
        %because of multiplication and division of polynomial size of array can be
        %changed like [0] * [1,2,3,4] = [0,0,0,0]
        %in a array we need to remove fron front 0 as they are meaning less 
        % and mess up C matrix 
        % mean [0,0,1,2,0,3] =>  [1,2,0,3]
        
        NewNumerator = conv(Numerator_poly,Denominator_LCM_column);

        [quotient,remainder] = deconv(NewNumerator,Denominator_poly); % (LCM*N)/D
         
             n = size(quotient);

             n = n(1,2);
            
             i = 1;
             N = [];
             found_not_zero = false;
             while i<n
               if quotient(i) ~= 0
                   found_not_zero = true;
               end

               if found_not_zero == true
                   N = [N,quotient(i)];
               end  
               i = i + 1;
             end    
             N = [N,quotient(n)];
                 
        Numerator{r}{c} = N;
    end    
end

% --------------- make leading coefficient of lcm 1 and change Gsp accordingly--------

leading_coeff = Denominator_LCM_column(1);
[quotient,remainder] = deconv(Denominator_LCM_column,leading_coeff);

Denominator_LCM_column = quotient;
Denominator_LCM = poly2sym(Denominator_LCM_column,s);

max_size = 0;  % will be used to evaluate C matrix max no. of coefficient of polynomial

% divide leading coefficient with Numerator 
for r = 1:rows

    column_numerator = Numerator{r};

    for c = 1:columns

        Numerator_poly = [column_numerator{c}];
       
        Numerator_poly = double(Numerator_poly);
          
        n = size(Numerator_poly);
        n = n(1,2);

        max_size = max(max_size,n); % get max coefficient number require

        [quotient,remainder] = deconv(Numerator_poly,leading_coeff);
        Numerator{r}{c} = quotient;
    end    
end

% ---------------------FOR C MATRIX ----------------------------------

C = []; 
% max_size give rows vs columns thats why max_size(1,2) as it index for
% columns
for coeff = 1:max_size
    
    coeff_matrix = zeros(rows,columns);
    
    for r = 1:rows
        
        column_numerator = Numerator{r};
        temp_column_coeff_matrix = [];

        for c = 1:columns

            Numerator_poly = [column_numerator{c}];
            Numerator_poly = double(Numerator_poly);

            Num_size = size(Numerator_poly);
        
            % Num_size >= coeff as Numerator_poly will not have not power
            % of s more than coeff and it will give error

            if Num_size(1,2) >= coeff
                req_index = Num_size(1,2) - coeff + 1; %start from lower power of s
           
                coeff_matrix(r,c) = Numerator_poly(req_index); 
            end   
           
        end 
      
    end    

    C = [C,coeff_matrix]; 
end    

% ------------------ FOR A MATRIX ------------------------------------------

col = columns;

if isRowWise == true
    col = 1;
end    
zeroMatrix = zeros(col,col); %depend upon number of input
identityMatrix = eye(col);           % depend upon number of input

A = [];

tempD = fliplr(Denominator_LCM_column); %reverse lcm start from s^0
tempDsize = size(tempD);

tempDsize = tempDsize(1,2);
tempDsize = tempDsize - 1; %not needed last term s^n

for r = 1:(tempDsize-1)
    temp = [];
    for c = 1:tempDsize

        if (r + 1) == c
            temp = [temp,identityMatrix];
        else
            temp = [temp,zeroMatrix];
        end

    end

    A = [A ; temp];
end    

tempA = []; %hold last row of A

for c = 1:tempDsize
    elementA = identityMatrix*(-1)*(tempD(1,c));
    tempA = [tempA,elementA];
end    

A = [A ; tempA];

% ------------------------- MATRIX B -------------------------------------

B = [];

for r = 1:(tempDsize-1)
    B = [B;zeroMatrix];
end    

B = [B;identityMatrix];
end
% END OF FUNCTION



