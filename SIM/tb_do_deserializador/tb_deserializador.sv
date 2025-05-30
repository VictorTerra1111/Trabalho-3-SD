`timescale 1ns/1ps

module tb_deserializador;
    logic data_in;
    logic write_in;
    logic ack_in;
    logic reset;
    logic clk_100KHz;
    logic status_out;
    logic [7:0] data_out;
    logic data_ready;

    deserializador dut (
        .data_in(data_in),
        .write_in(write_in),
        .ack_in(ack_in),
        .reset(reset),
        .clk_100KHz(clk_100KHz),
        .status_out(status_out),
        .data_out(data_out),
        .data_ready(data_ready)
    );

    initial clk_100KHz = 0;
    always #5 clk_100KHz = ~clk_100KHz;

    initial begin
        data_in = 0;
        write_in = 0;
        ack_in = 0;
        reset = 1;
        #10;
        reset = 0;

        // 1010_1101 (0xAD)
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        data_in = 0; write_in = 1; #10; write_in = 0; #10;
        data_in = 1; write_in = 1; #10; write_in = 0; #10;
        #20;
        ack_in = 1; #10;
        ack_in = 0; #10;
        #20;
        $finish;
    end
endmodule
