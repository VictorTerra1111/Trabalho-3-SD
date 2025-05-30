`timescale 1ns/1ps

module tb_divisor;

    logic clock1M;
    logic reset;
    wire clk_10KHz;
    wire clk_100KHz;

    clock_divisor dut (
        .clock1M(clock1M),
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .clk_100KHz(clk_100KHz)
    );

    initial clock1M = 0;
    always #0.5 clock1M = ~clock1M;
    initial begin
        reset = 1;
        #2;
        reset = 0;
        #1000;
        $finish;
    end

endmodule
