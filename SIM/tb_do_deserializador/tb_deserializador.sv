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

    always #5 clk_100KHz = ~clk_100KHz;

    initial begin
        clk_100KHz = 0;
        reset = 1;
        data_in = 0;
        write_in = 0;
        ack_in = 0;

        #10;
        reset = 0;

        // Enviar 8 bits: 1010_1101 (0xAD)
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);

        wait(data_ready == 1);

        #10;
        ack_in = 1;
        #10;
        ack_in = 0;

        #20;

        $finish;
    end

    task send_bit(input logic bit_val);
        begin
            @(posedge clk_100KHz);
            data_in = bit_val;
            write_in = 1;
            @(posedge clk_100KHz);
            write_in = 0;
        end
    endtask

endmodule
