module test8;
initial begin
Q8 q8;
q8 = new();
if(!q8.randomize()) $display("Randomization failed");
end
endmodule