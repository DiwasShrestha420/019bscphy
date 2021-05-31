function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
n=length(theta);
GRA=zeros(n,1);   %"stores the partial derivaties wrt each parameter"
for iter = 1:num_iters
h=X*theta;              %"hypothesis function"
        for i=1:n
        GRA(i,1)=(1/m)*sum((h-y).*X(:,i));
        theta(i,1)=theta(i,1)-alpha*GRA(i,1);
        endfor
  % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

endfor

end
