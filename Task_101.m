P = input('Enter matrix P (in the format [a b; c d]):');
Q = input('Enter matrix Q (in the format [a b; c d]):');

maximum_value = max(P(:)); % get the maximum value of the matrix A.

fprintf('Maximum value in P is:%d\n',maximum_value)

if size(P,2) == size(Q,1) % checking if the column length of the first matrix is equal to the row
  product = P*Q;          % length of the second matrix.

  fprintf('Result:\n');
  disp(product);

else
  fprintf('Two matrix is not multiplicable\n');
end
