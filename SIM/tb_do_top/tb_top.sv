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
        // Reset
        data_in = 0; write_in = 0; dequeue_in = 0;
        reset = 1;
        #10;
        reset = 0;

        // caso ruim (envia 9 bytes)

        // 10101010
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 11001100
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 11110000
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 00001111
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 00110011
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 01010101
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 10011001
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 11111111
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        // 00000000 verifica fila travando
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0); data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        #2000;

        dequeue_in = 1; #20; dequeue_in = 0; #100;
        dequeue_in = 1; #20; dequeue_in = 0; #100;
        dequeue_in = 1; #20; dequeue_in = 0; #100;
        dequeue_in = 1; #20; dequeue_in = 0; #100;

        #1000;

        // caso bom (coloca byte e retira depois)
        // 11110000
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        dequeue_in = 1; #20; dequeue_in = 0; #100;

        // 00001111
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        dequeue_in = 1; #20; dequeue_in = 0; #100;

        // 10101010
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        dequeue_in = 1; #20; dequeue_in = 0; #100;

        // 01010101
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        data_in=0; write_in=1; #10; write_in=0; #10;
        data_in=1; write_in=1; #10; write_in=0; #10;
        wait(status_out == 0);
        dequeue_in = 1; #20; dequeue_in = 0; #100;

        #1000;
        $finish;
    end
endmodule
