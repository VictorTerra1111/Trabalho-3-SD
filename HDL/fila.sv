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
    logic [3:0] tam_vet;
    logic dequeue_selecionado;

    integer i;

    always @(posedge clk_10KHz or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
            len_out <= 8'b0;
            tam_vet <= 4'b0;
            dequeue_selecionado <= 1'b0;
            for (i = 0; i < 8; i = i + 1)
                vector[i] <= 8'b0;
        end else begin
            if (enqueue_in && tam_vet < 8) begin
                vector[tam_vet] <= data_in;
                tam_vet <= tam_vet + 1;
            end

            if (dequeue_in && tam_vet > 0 && !dequeue_selecionado) begin
                dequeue_selecionado <= 1'b1;
            end

            if (dequeue_selecionado) begin
                data_out <= vector[0];
                for (i = 0; i < 7; i = i + 1)
                    vector[i] <= vector[i+1];
                vector[7] <= 8'b0;
                tam_vet <= tam_vet - 1;
                dequeue_selecionado <= 1'b0;
            end

            len_out <= tam_vet;
        end
    end
endmodule
