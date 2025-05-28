`timescale 1us/1ns

module tb_fila;

    logic [7:0] data_in;
    logic enqueue_in;
    logic dequeue_in;
    logic reset;
    logic clk_10KHz;

    wire [7:0] data_out;
    wire [2:0] len_out;

    // Instancia o DUT (Device Under Test)
    fila dut (
        .data_in(data_in),
        .enqueue_in(enqueue_in),
        .dequeue_in(dequeue_in),
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .data_out(data_out),
        .len_out(len_out)
    );

    // Geração do clock de 10KHz (período = 100us)
    initial clk_10KHz = 0;
    always #50 clk_10KHz = ~clk_10KHz;

    task enqueue(input [7:0] value);
        begin
            data_in = value;
            enqueue_in = 1;
            @(posedge clk_10KHz);
            enqueue_in = 0;
        end
    endtask

    task dequeue;
        begin
            dequeue_in = 1;
            @(posedge clk_10KHz);
            dequeue_in = 0;
        end
    endtask

    initial begin
        // Inicialização
        data_in = 0;
        enqueue_in = 0;
        dequeue_in = 0;
        reset = 1;
        @(posedge clk_10KHz);
        reset = 0;

        // Enfileira 3 dados
        enqueue(8'hA1);
        enqueue(8'hB2);
        enqueue(8'hC3);

        // Espera 1 ciclo
        @(posedge clk_10KHz);

        $display("Len after enqueue 3: %0d", len_out); // Esperado: 3

        // Desenfileira 2 vezes
        dequeue();
        $display("Data out 1: %h (esperado: A1)", data_out);
        dequeue();
        $display("Data out 2: %h (esperado: B2)", data_out);

        $display("Len after dequeue 2: %0d", len_out); // Esperado: 1

        // Finaliza simulação
        #200;
        $finish;
    end

endmodule
