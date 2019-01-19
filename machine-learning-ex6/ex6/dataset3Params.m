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
<<<<<<< HEAD

C = 0.01;
sigma = 0.01;


=======
values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
result = zeros(size(values));

for i = 1:length(values)
  C = values(i);
  for j = 1:length(values)
    sigma = values(j);
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    result(i, j) = error;
  endfor
endfor

# get min value and index of min for each column
[min_per_col, row_index] = min(result);

# get min value of all column min values and its index
[min_error, index_min_error] = min(min_per_col);

C = values( row_index(index_min_error) );
sigma = values(index_min_error);
>>>>>>> 69e6a2e11aa670cf94955fb56e330afeb81cfc60

% =========================================================================

end
