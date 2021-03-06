function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
predictions = X*theta;
sqrErrors = (predictions-y).^2; %squared errors
regulator = (lambda/(2*m)) * sum(theta(2:length(theta)) .* theta(2:length(theta)));
J = 1/(2*m) * sum(sqrErrors) + regulator;

%J = ( (1 / m) * sum(-y'*log(sigmoid(X*theta)) - (1-y)'*log( 1 - sigmoid(X*theta))) ) + (lambda/(2*m))*sum(theta(2:length(theta)).*theta(2:length(theta))) ;
G = (lambda/ m) .* theta;
G(1) = 0;
grad = ((1/m) .* X' * (X*theta - y)) + G;

%sum( X .* repmat((sigmoid(X*theta) - y), 1, size(X,2)) );
%grad(:,2:length(grad)) = grad(:,2:length(grad)) + (lambda/m)*theta(2:length(theta))';

% =========================================================================

grad = grad(:);

end
