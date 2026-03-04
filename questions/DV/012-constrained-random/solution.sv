class Q12;
rand bit [31:0] a;
bit [5:0] pattern = 6'b110011;
rand int unsigned position;

constraint c_position{
    position inside {[0:26]};
}

function void post_randomize();
a[position +: 6] = pattern;                       // important syntax, yes there also exists a -:
$display("Position = %0d ", position);
$display("%0b ", a);
endfunction
endclass