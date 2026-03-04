class Q17;
rand int arr[];
// smallest number could be 2 digits (98)
// largest number could be 17 digits, not counting zeroes (11111111111111111)

constraint c_range{
    arr.size() inside {[2:17]};
}
constraint c_decimal_numbers_in_array{
    foreach(arr[i]){
        arr[i] inside {[0:9]};
    }
}
constraint c_sum{
    arr.sum() == 'd17;
}

function void post_randomize();
foreach(arr[i]) $write("%0d ", arr[i]);
endfunction
endclass