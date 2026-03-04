class Q9;
rand bit [31:0] rand_var;

constraint c_odd{
    (rand_var % 2) == 1;
}

constraint c_range{
    rand_var inside {[1:1000]};
}

function void post_randomize();
$display("%0d ", rand_var);
endfunction
endclass