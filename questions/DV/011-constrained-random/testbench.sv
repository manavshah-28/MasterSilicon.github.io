module test11;
initial begin
Q11 q11;
q11 = new();
if(!q11.randomize()) $display("Randomization Failed");
end
endmodule