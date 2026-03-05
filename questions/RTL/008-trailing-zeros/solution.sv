module trailing_zeros #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
logic [$clog2(DATA_WIDTH):0] i;
logic [$clog2(DATA_WIDTH):0]temp ;
always @(*)begin
for( i = 0; i <DATA_WIDTH-1;i++)begin
   if(din[i] == 1)begin
      temp = i-;
   end
end
end
assign dout = temp;
endmodule