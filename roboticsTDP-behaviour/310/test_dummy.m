arr = [3, 0, 4, 11, 0, 2, 4, 5];
nonzero_arr = arr(5:8);  % extract the first four elements of arr
nonzero_arr = nonzero_arr(nonzero_arr ~= 0);  % extract nonzero elements
disp(nonzero_arr)
[min_val, min_idx] = min(nonzero_arr);  % find minimum value and its index
disp(min_idx)
disp(nonzero_arr(min_idx))
idx = find(arr(1:8) == nonzero_arr(min_idx));  % find indices where arr(1:4) == min_val
disp(idx)