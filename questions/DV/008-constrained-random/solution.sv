class Q8;
rand bit [31:0] rand_var;

constraint c_odd_ones{
    $countones(rand_var) % 2 == 1;
}

function void post_randomize();
$display("%0b ", rand_var);
endfunction
endclass