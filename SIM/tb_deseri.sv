`timescale 1ns/1ps

module tb_deseri #();
    logic data_in,

    logic write_in,
    logic ack_in,

    logic reset,
    logic clk_100KHz,
    
    logic status_out,
    logic [7:0]data_out,
    logic data_ready

deserializador dese(
    .data_in(data_in),
    .write_in(write_in),
    .ack_in(ack_in),
    .reset(reset),
    .clk_100KHz(clk_100KHz),
    .status_out(status_out),
    .data_out(data_out),
    .data_ready(data_ready)
);

  initial clock = 0;
  always #50 clock = ~clock; // uaaaa

  initial begin
    reset = 1;
    #10
    reset = 0;
    #10
    cmd = 4'b0001;  
    #10
    cmd = 4'b1010; 
    #10
    cmd = 4'b0001; 
    #10
    cmd = 4'b1110; 
    #20
    cmd = 4'b0011; 
    #10
    cmd = 4'b1011; 
    #10
    cmd = 4'b0010; 
    #10
    cmd = 4'b1110; 
    #20
    $stop;
  end

endmodule: tb_final