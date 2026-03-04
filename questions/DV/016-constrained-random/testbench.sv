module test16;
initial begin
Q16 q16;
q16 = new();
repeat(10)begin
if(!q16.randomize()) $display("Randomization Failed");
end
end
endmodule