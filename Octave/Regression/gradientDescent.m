function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
h=X*theta ;   
Gra1= (1/m)*sum(h-y);               %"partial diff. wrt thet1"
Gra2=(1/m)*sum((h-y).*X(:,2));   %"partial diff. wrt thet2"
theta(1,1)=theta(1,1)-alpha*Gra1;
theta(2,1)=theta(2,1)-alpha*Gra2;
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter,1) = computeCost(X,y,theta);

endfor
J_history;
end
