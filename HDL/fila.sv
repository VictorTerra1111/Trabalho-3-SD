module fila(
    input logic [7:0] data_in,
    input logic enqueue_in,
    input logic dequeue_in,
    input logic reset,
    input logic clk_10KHz,

    output logic [7:0] data_out,
    output logic [7:0] len_out
);

    typedef enum logic [1:0] {
        wait_s,
        dequeue,
        at_fila,
        enviado
    } state_t;

    state_t state, next_state;

    logic [7:0] vector [7:0];
    logic [7:0] tam_vet;
    integer i;

    always @(posedge clk_10KHz or posedge reset) begin
        if (reset) begin
            state <= wait_s;
            tam_vet <= 8'd0;
            data_out <= 8'd0;
            len_out <= 8'd0;
            for (i = 0; i < 8; i = i + 1)
                vector[i] <= 8'd0;
        end else begin
            state <= next_state;

            case (state)
                wait_s: begin
                    if (enqueue_in && tam_vet < 8) begin
                        vector[tam_vet] <= data_in;
                        tam_vet <= tam_vet + 1;
                    end
                end

                dequeue: begin
                    data_out <= vector[0];
                end

                at_fila: begin
                    for (i = 0; i < 7; i = i + 1)
                        vector[i] <= vector[i+1];
                    vector[7] <= 8'd0;
                end

                enviado: begin
                    tam_vet <= tam_vet - 1;
                end
            endcase

            len_out <= tam_vet;
        end
    end

    always_comb begin
        case (state)
            wait_s: begin
                if (dequeue_in && tam_vet > 0)
                    next_state = dequeue;
                else
                    next_state = wait_s;
            end
            dequeue: next_state = at_fila;
            at_fila: next_state = enviado;
            enviado: next_state = wait_s;
            default: next_state = wait_s;
        endcase
    end

endmodule
