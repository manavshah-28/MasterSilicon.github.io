class Q14;
rand int times;
int mult_11;

constraint c_multiplied_by {
    times inside {[1:100]};
}

// modulus option
// constraint c_mod11{
//     rand_var % 11 == 0;
// }

function void post_randomize();
mult_11 = 11 * times;
$display("%0d ", mult_11);
endfunction
endclass