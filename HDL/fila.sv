module fila(
    input data_in,
    input enqueue_in,
    input dequeue_in
    
    input reset,
    input clock,
    
    output data_out,
    output len_out
);

reg bit_0, bit_1, bit_2, bit_3, bit_4, bit_5, bit_6, bit_7;


