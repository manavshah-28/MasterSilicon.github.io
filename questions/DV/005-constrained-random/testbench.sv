module test5;
initial begin
Q5 q5;
q5 = new();
if(!q5.randomize()) $display("Randomization Failed");
end
endmodule