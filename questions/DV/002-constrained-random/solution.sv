class Q1;
rand bit [7:0] array[10];

constraint c_mult_3{
    foreach(array[i]){
        array[i] % 3 == 0;
    }
}

constraint c_unique_elements{
    unique{array};
}

constraint c_range{
    foreach(array[i]) array[i] inside {[1:100]};
}

function void display();
    foreach(array[i]) $write("%0d ", array[i]);
endfunction

endclass