`timescale 1ns/1ps

module tb_clock_divider();

    logic clock1M;
    logic reset;

    logic clk_10KHz;
    logic clk_100KHz;

    divider dut (
        .clock1M(clock1M),
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .clk_100KHz(clk_100KHz)
    );

    always #0.5 clock1M = ~clock1M;

    initial begin
        clock1M = 0;
        reset = 1;
        
        #2;
        reset = 0;

        repeat (200) @(posedge clock1M);

        reset = 1;
        #2;
        reset = 0;

        repeat (100) @(posedge clock1M);

        $finish;
    end

endmodule
