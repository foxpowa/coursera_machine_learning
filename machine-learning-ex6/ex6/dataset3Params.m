function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%

% init C and sigma vector to test
C_params = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_params = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
error_matrix = ones(size(C_params,1), size(sigma_params,1));

for i=1:size(C_params,1)
  for j=1:size(sigma_params,1)
    % train for each couple of params SVM model
    model= svmTrain(X, y, C_params(i), @(x1, x2) gaussianKernel(x1, x2, sigma_params(j)));
    %compute predictions
    predictions = svmPredict(model, Xval);
    % compute error
    error_matrix(i,j) = mean(double(predictions ~= yval));
  end
end


[mini, idx] = min(error_matrix, [], 2);
% idx is a 8 dim vector
[minim, idx2] = min(mini,[],1);
C = C_params(idx2);
sigma = sigma_params(idx(idx2));



% =========================================================================

end
