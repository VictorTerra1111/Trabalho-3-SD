module fila(
    input [7:0] data_in,
    input enqueue_in,
    input dequeue_in
    
    input reset,
    input clk_10KHz,
    
    output data_out,
    output len_out,
);

    logic [7:0][7:0] vector;
    logic tam_vet;
    
    assign len_out = tam_vet;

    integer i;

    always_ff @(posedge clk_10KHz) begin
        if (reset) begin
            data_out <= 0;
            len_out <= 0;
            tam_vet <= 0;

            for(i; i < 8; i <= i + 1) begin
                vector[i] <= 8'b0;
            end
        end else begin
                if(enqueue_in) begin
                    vector[tam_vet] <= data_in;
                    tam_vet <= tam_vet + 1;
                end 
                else if(dequeue_in) begin
                    data_out <= vector[0];
                    vector[0:6] <= vector [1:7];
                    vector[7] <= 8'b0;
                    tam_vet <= tam_vet - 1;
                end 
            end
        end 
    end 

