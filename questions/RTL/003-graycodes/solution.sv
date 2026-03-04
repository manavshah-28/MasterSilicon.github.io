module bin_2_gray(
    input clk,
    input rstn,
    output logic [3:0] bin,
    output [2:0] gray
);

always @(posedge clk)begin
if(!rstn)begin
bin <= 0;
end
else begin
bin <= bin + 1;
end
end
assign gray = bin ^ (bin >> 1);
endmodule

module gray2bin #(parameter N = 3)(
    input [N-1:0] gray,
    output logic [N-1:0] bin
);
int i;
always_comb begin
bin = '0;
for(i = 0 ; i < N; i ++)begin
    bin[i] = ^(gray>>i); 
end
end
endmodule
