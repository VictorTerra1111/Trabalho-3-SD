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

    task send_bit(input logic bit_val);
        begin
            data_in = bit_val;
            write_in = 1;
            repeat (10) @(posedge clock1M); 
            write_in = 0;
            repeat (10) @(posedge clock1M); 
        end
    endtask

    task send_byte(input [7:0] byte_val);
        integer j;
        begin
            for (j = 7; j >= 0; j = j - 1)
                send_bit(byte_val[j]); 
        end
    endtask

    initial begin
        data_in = 0;
        write_in = 0;
        dequeue_in = 0;
        reset = 1;
        repeat (10) @(posedge clock1M);
        reset = 0;

        send_byte(8'hA5);
        send_byte(8'h3C);

        repeat (1000) @(posedge clock1M);

        dequeue_in = 1;
        @(posedge clock1M);
        dequeue_in = 0;
        repeat (100) @(posedge clock1M);

        dequeue_in = 1;
        @(posedge clock1M);
        dequeue_in = 0;
        repeat (100) @(posedge clock1M);

        $finish;
    end
endmodule
