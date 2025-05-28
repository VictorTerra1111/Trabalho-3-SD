module fila(
    input logic [7:0] data_in,
    input logic enqueue_in,
    input logic dequeue_in,
    input logic reset,
    input logic clk_10KHz,

    output logic [7:0] data_out,
    output logic [2:0] len_out // até 8 elementos
);

    logic [7:0] vector [7:0]; // 8 posições de 8 bits
    logic [2:0] tam_vet;

    integer i;

    always_ff @(posedge clk_10KHz or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
            len_out <= 0;
            tam_vet <= 0;

            for (i = 0; i < 8; i = i + 1) begin
                vector[i] <= 8'b0;
            end
        end else begin
            if (enqueue_in && tam_vet < 8) begin
                vector[tam_vet] <= data_in;
                tam_vet <= tam_vet + 1;
            end 
            else if (dequeue_in && tam_vet > 0) begin
                data_out <= vector[0];

                // Shift manual
                for (i = 0; i < 7; i = i + 1) begin
                    vector[i] <= vector[i+1];
                end
                vector[7] <= 8'b0;
                tam_vet <= tam_vet - 1;
            end

            len_out <= tam_vet;
        end
    end
endmodule
