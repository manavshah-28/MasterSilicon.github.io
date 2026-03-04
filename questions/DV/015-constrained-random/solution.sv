class Q15;
rand bit [31:0] a;
// note all perfect powers of two only have a single bit toggled. 

constraint c_power_of_two{
    $countones(a) == 1;
}

function void post_randomize();
$display("%0d, %0b ", a,a);
endfunction
endclass