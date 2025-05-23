module top(
    input clock,
    input reset,

    input data_in, // vai para deserializador
    input write_in, // vai para deserializador
    input dequeue_in, // vai para fila

    output data_out, // vem de fila
    output status_out // vem do deserializador
);

    logic enqueue_in, ack_in;
    logic data_ready_des; // sai de des e vai para fila no enqueue_in
    logic [7:0] data_out_des;


deserializador des(
    .reset(reset),
    .clock(clock),
    
    .data_in(data_in),                  // input do modulo
    .write_in(write_in),                // input do modulo
    .status_out(status_out)             // output do modulo
    .ack_in(.ack_in)                    // vem de fila
    .data_out(data_out_des)             // vem do des vai para fila (data in)
    .data_ready(data_ready_des)         // sai do des vai para faila
);  

fila fil(
    .reset(reset),
    .clock(clock),

    .data_in(data_out_des),             // vem de des
    .len_out(.ack_in),                  // vem de des
    .enqueue_in(data_ready_des),        // vem do des
    .data_out(data_out),                // vai para top
    .dequeue_in(dequeue_in)             // vem do top
);