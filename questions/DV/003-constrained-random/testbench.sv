module test3;
    int count;
    int top;

initial begin
    Q3 q3;
    q3 = new();

    top = 100;   // increased for better statistics
    count = 0;

    repeat(top) begin
        if(!q3.randomize())
            $display("Randomization Failed");

        if(q3.val <= 100)
            count++;
    end

    $display("\n%0d : [0 to 100], %0d : [101 to 255]",
             count, top - count);
end
endmodule