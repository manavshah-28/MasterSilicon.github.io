module test14;
initial begin
Q14 q14;
q14 = new();
repeat(10)begin
if(!q14.randomize()) $display("Randomization Failed");
end
end
endmodule