module dff_sync_reset (
  input  logic clk,
  input  logic rst_n,    // synchronous active-low reset
  input  logic d,
  output logic q
);
  // Positive-edge triggered, synchronous reset
  // Reset is evaluated only on the rising clock edge
  always_ff @(posedge clk) begin
    if (!rst)  q <= 1'b0;
    else       q <= d;
  end

endmodule
