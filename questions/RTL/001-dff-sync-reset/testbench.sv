`timescale 1ns/1ps

module tb_dff_sync_reset;
  // ── Signals ──────────────────────────────────────────
  logic clk  = 0;
  logic rst  = 1;   // start with reset asserted
  logic d    = 0;
  logic q;

  // ── DUT ──────────────────────────────────────────────
  dff_sync_reset dut (.clk, .rst, .d, .q);

  // ── Clock: 10 ns period (100 MHz) ────────────────────
  always #5 clk = ~clk;

  // ── VCD dump ─────────────────────────────────────────
  initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, tb_dff_sync_reset);
  end

  // ── Stimulus ─────────────────────────────────────────
  initial begin
    // Hold reset for 3 cycles
    repeat(3) @(posedge clk);
    rst = 0;

    // Test: d=1
    @(negedge clk); d = 1;
    @(posedge clk); #1;
    assert(q === 1'b1) else $error("FAIL: expected q=1 after d=1");

    // Test: d=0
    @(negedge clk); d = 0;
    @(posedge clk); #1;
    assert(q === 1'b0) else $error("FAIL: expected q=0 after d=0");

    // Test: synchronous reset mid-operation
    @(negedge clk); d = 1; rst = 1;
    @(posedge clk); #1;
    assert(q === 1'b0) else $error("FAIL: expected q=0 during reset");

    @(negedge clk); rst = 0;
    repeat(2) @(posedge clk);

    $display("ALL TESTS PASSED");
    $finish;
  end

  // ── Timeout watchdog ─────────────────────────────────
  initial begin
    #10_000;
    $fatal(1, "TIMEOUT");
  end

endmodule
