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
## @deftypefn {} {@var{retval} =} GraphCost (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Diwas Shrestha <d_shr@DS-SONYVAIO>
## Created: 2021-05-29

%%% returns 3D graph of cost function Vs parameters (for linear eqn fitting; h = t1+t2x)
function GraphCost (X,y)

m=length(y);
n=size(X,2);
theta=normalEqn(X,y);  
a=theta(1,1)
b=theta(2,1)
  figure(1);
  [t1,t2]=meshgrid(a-3:a+3,b-3:b+3);
    for j=1:size(t1,1)
         for k=1:size(t1, 2)
           z(j,k)=computeCostMulti(X,y,[t1(j,k);t2(j,k)]);
         endfor
    endfor
   surf(t1,t2,z)
endfunction
