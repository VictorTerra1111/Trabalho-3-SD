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
    #100;

    enqueue_in = 1; 
    data_in = 8'h11; #100; 
    data_in = 8'h22; #100;
    data_in = 8'h33; #100; 
    data_in = 8'h44; #100; 
    data_in = 8'h55; #100; 
    data_in = 8'h66; #100; 
    data_in = 8'h77; #100; 
    data_in = 8'h88; #100;
    data_in = 8'h99; #100;
    enqueue_in = 0;
    #100;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    dequeue_in = 1; #100; dequeue_in = 0;
    #100;
    $finish;
end
endmodule
