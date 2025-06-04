module fila(
    input logic [7:0] data_in,
    input logic enqueue_in,
    input logic dequeue_in,
    input logic reset,
    input logic clk_10KHz,
    
    output logic [7:0] data_out,  
    output logic [7:0] len_out
);

logic [7:0] vector [7:0];  
integer i;  

always @(posedge clk_10KHz or posedge reset) begin  
    if (reset) begin  
        data_out <= 8'b0;  
        len_out <= 8'b0;  
        for (i = 0; i < 7; i = i + 1) vector[i] <= 8'b0;  
    end else begin  
        if (enqueue_in && len_out < 8'b00001000) begin  
            vector[len_out] <= data_in;  
            len_out <= len_out + 1;
        end else if (dequeue_in && len_out > 8'b0) begin  
            data_out <= vector[0];  
            for (i = 0; i < 7; i = i + 1)  
                vector[i] <= vector[i+1];  
            vector[7] <= 8'b0;  
            len_out <= len_out - 1;  
        end  
    end  
end
endmodule
