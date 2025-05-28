`timescale 1ns/1ps

module tb_clock_divider();

    // Entradas
    logic clock1M;
    logic reset;

    // Saídas
    logic clk_10KHz;
    logic clk_100KHz;

    // Instanciação do módulo a ser testado
    divider uut (
        .clock1M(clock1M),
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .clk_100KHz(clk_100KHz)
    );

    // Gera clock de 1MHz (período de 1us)
    always #0.5 clock1M = ~clock1M;

    initial begin
        // Inicialização
        clock1M = 0;
        reset = 1;
        
        // Aplica reset
        #2;
        reset = 0;

        // Roda por alguns ciclos para observar as saídas
        repeat (200) @(posedge clock1M);

        // Aplica reset novamente para testar comportamento
        reset = 1;
        #2;
        reset = 0;

        repeat (100) @(posedge clock1M);

        $finish;
    end

    // Monitoramento das saídas
    initial begin
        $display("Tempo(ns)\treset\tclk_10KHz\tclk_100KHz");
        $monitor("%0t\t%b\t%b\t\t%b", $time, reset, clk_10KHz, clk_100KHz);
    end

endmodule
