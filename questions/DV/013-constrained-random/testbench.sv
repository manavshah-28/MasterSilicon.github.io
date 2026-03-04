module test13;
initial begin
Q13 q13;
q13 = new();
if(!q13.randomize()) $display("Randomization Failed");
end
endmodule