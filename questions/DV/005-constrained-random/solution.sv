class Q5;
rand bit [7:0] a,b;
constraint c_unique{
    a !=b ;
}
constraint c_five_toggles{
    $countones(a) == 5;
    $countones(b) == 5;
}

//  constraint exactly_five_bits_different {
//     $countones(a ^ b) == 5;
//   }

function void post_randomize();
$display("A = %0b, B = %0b ", a, b);
endfunction
endclass