class Q4;
rand int arr[10];

constraint c_sum_of_three {
    foreach(arr[i]){
        if(i>1) (arr[i-2] + arr[i-1] + arr[i]) % 2 == 0;
    }
}

constraint c_range{
    foreach(arr[i]) arr[i] inside {[0:20]};
}

constraint c_unique{
    unique{arr};
}
function void display();
foreach(arr[i]) $write("%0d ", arr[i]);
endfunction

endclass