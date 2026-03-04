module test10;
Q10 q10;
initial begin
q10 = new();
repeat(10) begin
q10.randomize();
$write("%0d ", q10.palindrome);
end
end
endmodule