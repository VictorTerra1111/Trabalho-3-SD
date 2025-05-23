module deserializador(
    input data_in,
    input write_in,
    input ack_in,

    input reset,
    input clock,
    
    output status_out,
    output data_out,
    output data_ready
);

