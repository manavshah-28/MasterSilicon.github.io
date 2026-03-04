module test17;
initial begin
Q17 q17;
q17 = new();
repeat(5)begin
if(!q17.randomize()) $display("Randomization Failed");
$display();
end
end
endmodule