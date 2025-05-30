module top(
    input logic clock1M,
    input logic reset,

    input logic data_in, 
    input logic write_in, 
    input logic dequeue_in,

    output logic data_out,
    output logic status_out 
);

    logic enqueue_in, ack_in, clk_10KHz, clk_100KHz;
    logic data_ready_des; 
    logic [7:0] data_out_des;
    assign ack_in = (len_out < 8);

deserializador des(
    .reset(reset),
    .clk_100KHz(clk_100KHz),
    
    .data_in(data_in),               
    .write_in(write_in),           
    .status_out(status_out),        
    .ack_in(ack_in),                
    .data_out(data_out_des),            
    .data_ready(data_ready_des)        
);  

fila fil(
    .reset(reset),
    .clk_10KHz(clk_10KHz),

    .data_in(data_out_des),          
    .len_out(ack_in),                
    .enqueue_in(data_ready_des),       
    .data_out(data_out),                
    .dequeue_in(dequeue_in)           
);

divider divisor(
    .clock1M(clock1M),
    .reset(reset),
    .clk_10KHz(clk_10KHz),
    .clk_100KHz(clk_100KHz)
);
endmodule
