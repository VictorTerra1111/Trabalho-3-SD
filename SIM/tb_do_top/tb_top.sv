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
        reset = 1; 
        data_in = 0; 
        write_in = 0; 
        dequeue_in = 0;
        #5;
        reset = 0;
        #50; 

        // Byte 1: 10101010
        write_in = 1;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Byte 2: 11001100
        write_in = 1;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Byte 3: 11110000
        write_in = 1;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Byte 4: 00001111
        write_in = 1;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        write_in = 0; #50;

        // tira 4 bytes
        dequeue_in = 1; #15;
        dequeue_in = 0; #50;

        dequeue_in = 1; #15;
        dequeue_in = 0; #50;

        dequeue_in = 1; #15;
        dequeue_in = 0; #50;

        dequeue_in = 1; #15;
        dequeue_in = 0; #50;
        
        // Byte 1: 10101010
        write_in = 1;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Byte 2: 11001100
        write_in = 1;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Byte 3: 11110000
        write_in = 1;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Byte 4: 00001111
        write_in = 1;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        data_in = 1; #15;
        write_in = 0; #50;
        
        // Byte 5: 00110011
        write_in = 1;
        data_in = 0; #15; data_in = 0; #15;
        data_in = 1; #15; data_in = 1; #15;
        data_in = 0; #15; data_in = 0; #15;
        data_in = 1; #15; data_in = 1; #15;
        write_in = 0; #50;

        // Byte 6: 01010101
        write_in = 1;
        data_in = 0; #15; data_in = 1; #15;
        data_in = 0; #15; data_in = 1; #15;
        data_in = 0; #15; data_in = 1; #15;
        data_in = 0; #15; data_in = 1; #15;
        write_in = 0; #50;

        // Byte 7: 10011001
        write_in = 1;
        data_in = 1; #15; data_in = 0; #15;
        data_in = 0; #15; data_in = 1; #15;
        data_in = 1; #15; data_in = 0; #15;
        data_in = 0; #15; data_in = 1; #15;
        write_in = 0; #50;

        // Byte 8: 11111111
        write_in = 1;
        data_in = 1; #15; data_in = 1; #15;
        data_in = 1; #15; data_in = 1; #15;
        data_in = 1; #15; data_in = 1; #15;
        data_in = 1; #15; data_in = 1; #15;
        write_in = 0; #50;

        // Byte 9: 00000000 caso ruim
        write_in = 1;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        data_in = 0; #15;
        write_in = 0; #50;

        // Retirar 8 bytes
        repeat (8) begin
            dequeue_in = 1; #100;
            dequeue_in = 0; #50;
        end
        
        dequeue_in = 1; #100;
        dequeue_in = 0;

        #50;
        $finish;
    end
endmodule
