%"LU factorisation"
%breaks a square matrix into factor form
  %LU = L+U-I   %L 
function LU = LUDecomp(A)
    n = length(A);  
    L=zeros(n);
    U=zeros(n);
    LU = A;
    % decomposition of matrix, Doolittle’s Method
    for i = 1:1:n
        for j = 1:(i - 1)
            LU(i,j) = (LU(i,j) - LU(i,1:(j - 1))*LU(1:(j - 1),j)) / LU(j,j);
        end
        j = i:n;
        LU(i,j) = LU(i,j) - LU(i,1:(i - 1))*LU(1:(i - 1),j);
    end

  for k=1:1:n                %"separation of L and U"
    L(k,k)=1;
    U(k,k)=LU(k,k);
    for m=k+1:n
      L(m,k)=LU(m,k);
      U(k,m)=LU(k,m);
    endfor
  endfor
  L %"returns L-(lower triangular with diagnal 1) matrix"
  U %"returns U-(upper triangular matrix)"
end
