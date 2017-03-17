function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m = size(X,1);
for i=1:m
% iterate through m exemples

  tmp_distortion = 10000000;
  for j=1:K
    % test all centroids
    computed_vector = (X(i,:) - centroids(j,:));
    % k_dist = sum(computed_vector .^ 2);
    k_dist = norm(computed_vector) ^ 2;
    if (k_dist < tmp_distortion)
      idx(i) = j;
      tmp_distortion = k_dist;
    end
    k_dist = 10000000;
  end
end






% =============================================================

end
