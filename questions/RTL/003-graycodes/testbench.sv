module b2g_tb #(parameter N = 3)();
logic clk;
logic rstn;
logic [N-1:0] bin;
logic [N-1:0] gray;

bin_2_gray dut(.*);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
rstn = 0;
@(posedge clk);
rstn = 1;

repeat(10) begin
@(posedge clk);
$display("bin = %0b, gray = %0b", bin, gray);
end
$finish();
end
endmodule

module g2b_tb #(parameter N = 3)();
logic [N-1:0] bin;
logic [N-1:0] gray;

gray2bin dut(.*);

initial begin

repeat(10) begin
gray = $urandom_range(0,7);
#1;
$display("gray = %0b, bin = %0b", gray, bin);
end
end
endmodule