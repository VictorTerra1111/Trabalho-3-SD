
module deserializador(
    input logic data_in,

    input logic write_in,
    input logic ack_in,

    input logic reset,
    input logic clk_100KHz,
    
    output logic status_out,
    output logic [7:0]data_out,
    output logic data_ready
);
    
    typedef enum logic [2:0] {ENCHE_FILA, SEND_FILA, H_ACK} state_t; 
    state_t state;
    
    logic [7:0] vector;
    logic [3:0] tam;

    always @(posedge clk_100KHz or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
            status_out <= 0;
            data_ready <= 0;
            vector <= 8'b0;
            tam <= 4'b0;
            state <= ENCHE_FILA;
        end else begin
            case (state)
                ENCHE_FILA: begin
                    status_out <= 1'b0;
                    data_ready <= 1'b0;
                    if (tam == 7 && write_in) begin
                        vector <= {vector[6:0], data_in};
                        tam <= tam + 1;
                        state <= SEND_FILA;
                    end else if (write_in) begin
                        vector <= {vector[6:0], data_in};
                        tam <= tam + 1;
                        state <= ENCHE_FILA;
                    end else state <= ENCHE_FILA;
                end
                SEND_FILA: begin
                    data_ready <= 1;
                    status_out <= 1;
                    data_out <= vector;
                    if (ack_in) begin
                        state <= H_ACK;
                    end else begin
                        state <= SEND_FILA;
                    end
                end
                H_ACK: begin
                    status_out <= 1;
                    data_ready <= 1;
                    data_out <= vector;
                    if (!ack_in) begin
                        data_ready <= 0;
                        status_out <= 0;
                        vector <= 8'b0;
                        tam <= 4'b0;
                        state <= ENCHE_FILA;
                    end else begin
                        data_out <= 8'b0;
                        state <= H_ACK;
                    end
                end
                default: state <= ENCHE_FILA;
            endcase
        end 
    end 
endmodule

