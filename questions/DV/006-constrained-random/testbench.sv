module test6;
initial begin
Q6 q6;
q6 = new();
repeat(10)begin
if(!q6.randomize()) $display("Randomization failed");
end
end
endmodule