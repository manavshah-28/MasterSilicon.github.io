module div3 (
  input clk,
  input resetn,
  input din,
  output logic dout
);

typedef enum logic [1:0]{
  S0, S1, S2, Start
} states;

states curr;

always @(posedge clk) begin
if(!resetn)begin
curr <= Start;
end
else begin
case(curr)
Start : curr = (din) ? S1 : S0;
S0 : curr = (din) ? S1 : S0;
S1 : curr = (din) ? S0 : S2;
S2 : curr = (din) ? S2 : S1;
default curr = S0;
endcase
end
end
assign dout = (curr == S0) ? 1 : 0;
endmodule