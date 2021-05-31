% Reduction to reduced row echelon form to get Elementary matrix ;for transformation to inverse matrix" 
%"input A as matrix;& n as  no of variables"

I=eye(n)  %"creating unit matrix of size equal to A"           
E=[A,I]             %"creating augmented matrix"
for i=1:n              %"create REF"
  E(i,:)=E(i,:)/E(i,i);
  for j=(i+1):n
    b=E(j,i)
    E(j,:)=E(j,:)/b;    %"dividing each eqn by coeff. of first term"
       E(j,:) =E(j,:)-E(i,:);          %"make lower triangle zero"
      endfor
endfor
E      %"returns REF of A and Elementary matrix; [A:I]"

for k=n:-1:1  %"create RREF"
    c=E(k,k)
    E(k,:)=E(k,:)/c;          %"dividing each eqn by coeff. of last term"
    I(k,:)=I(k,:)/c;         %"dividing each eqn by coeff. of last term"
for j=(k-1):-1:1
  d=E(j,k)
  E(j,:)=E(j,:)/d
      E(j,:)=E(j,:)-E(k,:);      %"make upper triangle zero"
  
    endfor
  endfor
E     %"returns RREF of A"

 
 