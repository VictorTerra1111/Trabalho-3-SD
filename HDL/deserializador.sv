module deserializador(
    input data_in,

    input write_in,
    input ack_in,

    input reset,
    input clk_100KHz,
    
    output status_out,
    output [7:0]data_out,
    output data_ready
);
    
    typedef enum logic [2:0] {ENCHE_FILA, SEND_FILA, H_ACK} state_t; 
    state_t state;
    
    logic [7:0] vector;
    logic tam;

    always_ff @(posedge clk_100KHz or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
            status_out <= 0;
            state <= IDLE;
            data_ready <= 0;
            vector <= 8'b0;
            state <= ENCHE_FILA;
        end else begin
                case (state)
                    ENCHE_FILA: begin
                        if(write_in) begin
                            vector << data_in;
                            tam <= tam + 1;
                        end

                        if(tam == 8) begin
                            state <= SEND_FILA;
                        end
                    end
                    SEND_FILA: begin
                        data_ready <= 1;
                        status_out <= 1;
                        data_out <= vector;
                        if(ack_in) begin
                            states <= H_ACK;
                        end
                    end
                    H_ACK: begin
                        data_ready <= 0;
                        data_out <= 8'b0;
                        status_out <= 0;
                        vector <= 8'b0;
                    end
                endcase
            end
        end 
    end 