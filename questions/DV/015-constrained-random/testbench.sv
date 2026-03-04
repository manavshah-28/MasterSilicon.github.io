module test15;
initial begin
Q15 q15;
q15 = new();
repeat(10)begin
if(!q15.randomize()) $display("Randomization Failed");
end
end
endmodule