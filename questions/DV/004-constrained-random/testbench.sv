module test4;

initial begin
Q4 q4;
q4 = new();
repeat(4)begin
if(!q4.randomize()) $display("Randomization Failed");
q4.display();
$display();
end
end
endmodule