module test7;

initial begin
Q7 q7;
q7 = new();
repeat(20)begin
if(!q7.randomize()) $display("Randomization Failed!!");
end
end
endmodule