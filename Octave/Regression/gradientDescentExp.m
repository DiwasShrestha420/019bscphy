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
## @deftypefn {} {@var{retval} =} gradientDescentExp (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Diwas Shrestha <d_shr@DS-SONYVAIO>
## Created: 2021-05-30

function theta = gradientDescentExp (X,y,theta,alpha,iter)
    m=length(y);     
   
    
     for i=1:iter
        h=exp((theta(2,1)*X));
        h=theta(1,1)*h;
       h1=exp((theta(2,1)*X));
       a=theta(1,1);
       b=h1.*X;
         theta(1,1)=theta(1,1)-alpha*(1/m)*sum((h-y).*h1);
          theta(2,1)=theta(2,1)-alpha*(1/m)*sum(((h-y)*a).*b);
     endfor
   

endfunction
