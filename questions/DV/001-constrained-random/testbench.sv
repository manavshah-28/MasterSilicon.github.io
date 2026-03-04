module test1;
initial begin
Q1 q1;
q1 = new();
if (!q1.randomize()) begin
    $display("Randomization failed!");
end
q1.display();
end
endmodule