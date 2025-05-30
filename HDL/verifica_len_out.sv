module verifica_len_out(
  input logic [3:0] len_out,
  output logic ack_in 
);
  assign ack_in = (len_out < 8);
  
endmodule
