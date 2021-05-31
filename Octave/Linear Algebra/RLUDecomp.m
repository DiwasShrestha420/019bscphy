## Copyright (C) 2021 Diwas Shrestha
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} RLUDecomp (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Diwas Shrestha <d_shr@DS-SONYVAIO>
## Created: 2021-05-25

%%%%%"performs LU factorisation for Rectangular Matrix"
function L= RLUDecomp (m,n,A)    
if(m>n)  
L=eye(m);
 U=A;  
 
 %%%% "applying gaussian(row) operations to make lower triangle zeros"
       for i=1:m-(m-n)    %"the required elements to fill column in L ; go through 1 to m-(m-n) columns" 
          if(U(i,i)==0)
             L(i+1:m,i)=U(i+1:n,i);
          elseif(i+1<=n)
              L(2:m,1)=A(2:m,1)/A(1,1);
            
             for j=i+1:m
                  C=U(j,i)/U(i,i);
                 U(j,:)=U(j,:)-U(i,:)*C
             endfor
             if(i+2<=m)
             L(i+2:m,i+1)=U(i+2:m,i+1)/U(i+1,i+1);
             endif
            endif
        endfor
       U(n+1:m,n)=zeros((m-n),1);
       %%%"Getting missing elements of L (if columns of U are entirely zero) from adjacent columns;
      %% -   and replace elements in U with zeros(those elements taken to L)"
      for l=1:m-1
           if(L(l+1:m,l)==zeros(m-l,1))
               for a=1:l
                 if(U(a+1:m,a)!=zeros(m-a,1))
                      L(a+1:m,a)=U(a+1:m,a);
                      U(a+1:m,a)=zeros(m-a,1);
                    else
                      U=U;
                      for b=a+1:m-1
                           if(U(b:m,b)!=zeros(m-a,1))
                                L(a+1:m,a)=U(b:m,b);
                                U(b:m,b)=zeros(m-a,1);
                           endif
                      endfor
                   endif
                  
                 endfor
            endif   
       endfor
       L ;%"returns lower triangle matrix(square)"
       
       U %"returns upper triangle matrix (rectangular)"
elseif(m<=n) 
L=eye(m);
 U=A;
 %%%% "applying gaussian(row) operations to make lower triangle zeros"
     for i=1:m-1
          if(U(i,i)==0)
             L(i+1:m,i)=U(i+1:m,i);
          elseif(i+1<=m)
              L(2:m,1)=A(2:m,1)/A(1,1);
             
             for j=i+1:m
                C=U(j,i)/U(i,i);
                 U(j,:)=U(j,:)-U(i,:)*C
             endfor             
                if(i+2<=m)
                  L(i+2:m,i+1)=U(i+2:m,i+1)/U(i+1,i+1);
                endif
          endif
        endfor   
        
        %%%"Getting missing elements of L (if columns of U are entirely zero) from adjacent columns;
      %% -   and replace elements in U with zeros(those elements taken to L)"
      for l=1:m-1
           if(L(l+1:m,l)==zeros(m-l,1))
               for a=1:l
                 if(U(a+1:m,a)!=zeros(m-a,1))
                      L(a+1:m,a)=U(a+1:m,a);
                      U(a+1:m,a)=zeros(m-a,1);
                    else
                      U=U;
                      for b=a+1:m-1
                           if(U(b:m,b)!=zeros(m-a,1))
                                L(a+1:m,a)=U(b:m,b);
                                U(b:m,b)=zeros(m-a,1);
                           endif
                      endfor
                   endif
                  
                 endfor
            endif   
       endfor
       L; %"returns lower triangle matrix(square)"
    
      U %"returns upper triangle matrix (rectangular)"
elseif(m==n)
%"LU factorisation"
%breaks a square matrix into factor form
  %LU = L+U-I   
    % decomposition of matrix, Doolittle’s Method
    n = length(A);  
    L=zeros(n);
    U=zeros(n);
    LU = A;
  
    for i = 1:1:n
        for j = 1:(i - 1)
            LU(i,j) = (LU(i,j) - LU(i,1:(j - 1))*LU(1:(j - 1),j)) / LU(j,j)
        end
        j = i:n;
        LU(i,j) = LU(i,j) - LU(i,1:(i - 1))*LU(1:(i - 1),j)
    end

  for k=1:1:n                %"separation of L and U"
    L(k,k)=1;
    U(k,k)=LU(k,k);
    for m=k+1:n
      L(m,k)=LU(m,k);
      U(k,m)=LU(k,m);
    endfor
  endfor
  L; %"returns L-(lower triangular with diagnal 1) matrix"

U       %"returns U-(upper triangular matrix)"
endif
endfunction
  