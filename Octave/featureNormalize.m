function [X_norm, mu, sigma] = featureNormalize(X)
  %%%%%%==========================="Input Column Matrix"
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));    
 for i=1:size(X,2)
   mu(1,i)=mean(X(:,1));sigma(1,i)=std(X(:,1));
   X_norm(:,i)=X_norm(:,i)-mean(X(:,i));
   X_norm(:,i)=X_norm(:,i)/std(X(:,i));
 endfor
mu
sigma
X_norm;

% ============================================================

end
