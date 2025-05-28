`timescale 1us/1ns

module tb_top;

    logic clock1M;
    logic reset;
    logic data_in;
    logic write_in;
    logic dequeue_in;
    wire data_out;
    wire status_out;

    // Instancia o DUT
    top dut (
        .clock1M(clock1M),
        .reset(reset),
        .data_in(data_in),
        .write_in(write_in),
        .dequeue_in(dequeue_in),
        .data_out(data_out),
        .status_out(status_out)
    );

    // Clock de 1MHz: período de 1us
    initial clock1M = 0;
    always #0.5 clock1M = ~clock1M;

    // Tarefa para enviar 1 bit serial
    task send_bit(input logic bit_val);
        begin
            data_in = bit_val;
            write_in = 1;
            repeat (10) @(posedge clock1M); // Tempo suficiente p/ deserializador capturar
            write_in = 0;
            repeat (10) @(posedge clock1M); // Aguardar entre bits
        end
    endtask

    // Tarefa para enviar um byte inteiro
    task send_byte(input [7:0] byte_val);
        integer j;
        begin
            for (j = 7; j >= 0; j = j - 1)
                send_bit(byte_val[j]); // MSB first
        end
    endtask

    initial begin
        // Inicializa sinais
        data_in = 0;
        write_in = 0;
        dequeue_in = 0;
        reset = 1;
        repeat (10) @(posedge clock1M);
        reset = 0;

        // Envia dois bytes para o deserializador
        $display("Enviando 0xA5");
        send_byte(8'hA5);
        $display("Enviando 0x3C");
        send_byte(8'h3C);

        // Aguarda o armazenamento na fila
        repeat (1000) @(posedge clock1M);

        // Remove primeiro dado da fila
        dequeue_in = 1;
        @(posedge clock1M);
        dequeue_in = 0;
        repeat (100) @(posedge clock1M);
        $display("Valor retirado da fila: %b", data_out);

        // Remove segundo dado
        dequeue_in = 1;
        @(posedge clock1M);
        dequeue_in = 0;
        repeat (100) @(posedge clock1M);
        $display("Valor retirado da fila: %b", data_out);

        $finish;
    end
endmodule
