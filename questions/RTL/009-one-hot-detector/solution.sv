module onehot #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
int i;
logic [DATA_WIDTH-1:0] number;

always @(*) begin
number = 0;
for(i = 0; i < DATA_WIDTH; i++)begin
number += din[i];
end
end
assign onehot = (number == 1);
endmodule