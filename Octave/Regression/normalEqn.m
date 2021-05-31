function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);
theta=inverse(X'*X)*(X'*y);  %"the normal eqn (obtained from minimizing LSM eqn)"
end
