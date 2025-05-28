/*
Criação de um módulo top. A cada 8 bits recebidos pelo
deserializador, uma palavra de 8 bits deverá ser colocada na pilha. 
O módulo top deverá receber
um sinal de clock de 1MHz. Dois processos internos deverão utilizar 
o sinal de 1MHz para
gerar dois sinais de clock diferentes: um de 100KHz e outro de 10KHz, alimentando os
módulos anteriores.
*/

module top(
    input logic clock1M,
    input logic reset,

    input logic data_in, // vai para deserializador
    input logic write_in, // vai para deserializador
    input logic dequeue_in, // vai para fila

    output logic data_out, // vem de fila
    output logic status_out // vem do deserializador
);

    logic enqueue_in, ack_in, clk_10KHz, clk_100KHz;
    logic data_ready_des; // sai de des e vai para fila no enqueue_in
    logic [7:0] data_out_des;


deserializador des(
    .reset(reset),
    .clk_100KHz(clk_100KHz),
    
    .data_in(data_in),                  // input do modulo
    .write_in(write_in),                // input do modulo
    .status_out(status_out)             // output do modulo
    .ack_in(.ack_in)                    // vem de fila
    .data_out(data_out_des)             // vem do des vai para fila (data in)
    .data_ready(data_ready_des)         // sai do des vai para faila
);  

fila fil(
    .reset(reset),
    .clk_10KHz(clk_10KHz),

    .data_in(data_out_des),             // vem de des
    .len_out(.ack_in),                  // vem de des
    .enqueue_in(data_ready_des),        // vem do des
    .data_out(data_out),                // vai para top
    .dequeue_in(dequeue_in)             // vem do top
);

divider divisor(
    .clock1M(clock1M), //
    .reset(reset),
    .clk_10KHz(clk_10KHz),
    .clk_100KHz(clk_100KHz),
);