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
        reset = 0; #100;
        reset = 1; #100;
        reset = 0; #100;
        
        // 10101010
        write_in=1;
        data_in=1; #100;
        data_in=0; #100;
        data_in=1; #100;
        data_in=0; #100;
        data_in=1; #100;
        data_in=0; #100;
        data_in=1; #100;
        data_in=0; #100;
        write_in=0; #100;
        
        //wait(status_out == 0);
        
        // 11001100
        // 11110000
        // 00001111
        // 00110011
        // 01010101
        // 10011001
        // 11111111
        // 00000000 caso ruim
        dequeue_in = 1; #100; 
        dequeue_in = 0; #100;
        $finish;
    end
endmodule
