module verifica_len_out(
  input logic [2:0] len_out,
  output logic ack_in 
);

  if(len_out == 8) begin
    ack_in = 1;
  end else ack_in = 0;
endmodule
