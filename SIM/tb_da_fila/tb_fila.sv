`timescale 1us/1ns

module tb_fila;

    logic [7:0] data_in;
    logic enqueue_in;
    logic dequeue_in;
    logic reset;
    logic clk_10KHz;
    logic [7:0] data_out;
    logic [7:0] len_out;

    fila dut (
        .data_in(data_in),
        .enqueue_in(enqueue_in),
        .dequeue_in(dequeue_in),
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .data_out(data_out),
        .len_out(len_out)
    );

    initial clk_10KHz = 0;
    always #50 clk_10KHz = ~clk_10KHz;

    initial begin
        data_in = 8'd0;
        enqueue_in = 0;
        dequeue_in = 0;
        reset = 1;
        #100;
        reset = 0;

        data_in = 8'h11; enqueue_in = 1; #50; 
        data_in = 8'h22; #50;
        data_in = 8'h33; #50; 
        data_in = 8'h44; #50; 
        data_in = 8'h55; #50; 
        data_in = 8'h66; #50; 
        data_in = 8'h77; #50; 
        data_in = 8'h88; #50;
        data_in = 8'h99; #50;
        enqueue_in = 0;
        #100;
        #50;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;
        dequeue_in = 1; #500; dequeue_in = 0;

        #100;
        $finish;
    end
endmodule
