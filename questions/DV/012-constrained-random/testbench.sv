module test12;
initial begin
Q12 q12;
q12 = new();
if(!q12.randomize()) $display("Randomization Failed");
end
endmodule