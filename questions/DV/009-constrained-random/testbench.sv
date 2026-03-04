module test9;
initial begin
Q9 q9;
q9 = new();
if(!q9.randomize()) $display("Randomization failed");
end
endmodule