`timescale 1us/1ns

module tb_top;

    logic clock1M;
    logic reset;
    logic data_in;
    logic write_in;
    logic dequeue_in;
    logic [7:0] data_out;
    logic status_out;

    top dut (
        .clock1M(clock1M),
        .reset(reset),
        .data_in(data_in),
        .write_in(write_in),
        .dequeue_in(dequeue_in),
        .data_out(data_out),
        .status_out(status_out)
    );

    initial clock1M = 0;
    always #0.5 clock1M = ~clock1M;

    initial begin
        data_in = 0;
        write_in = 0;
        dequeue_in = 0;
        reset = 1;
        #10;
        reset = 0;

        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;

        #1500;
        dequeue_in = 1; #1; dequeue_in = 0;
        #500;

        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;

        #1500;
        dequeue_in = 1; #1; dequeue_in = 0;
        #500;

        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;

        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;

        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;

        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        #1000;
        $finish;
    end
endmodule
