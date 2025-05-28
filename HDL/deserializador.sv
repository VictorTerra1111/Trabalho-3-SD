/*
O serializador deveria receber apenas 1 bit pelo data_in OK
Se o sinal write_in estiver
alto, o bit recebido deverá ser guardado. 
Quando houver 8 bits guardados, o sinal
data_ready deverá estar alto e os bits guardados deverão aparecer em data_out,
indicando que existem dados para serem transmitidos. 
OK
Os valores de data_out e data_ready deverão se manter os mesmos até que o sinal 
ack_in fique alto, indicando que os dados foram recebidos. 
OK
Enquanto o deserializador não conseguir
enviar os dados, deverá manter o sinal de status_out alto, indicando que está
ocupado. Este módulo deverá funcionar a 100KHz.
*/

module deserializador(
    input data_in,
    input write_in,
    input ack_in,

    input reset,
    input clock1M,
    
    output status_out,
    output [7:0]data_out,
    output data_ready
);
    // transformar clock1M em clock10k 
    
    typedef enum logic [2:0] {ENCHE_FILA, SEND_FILA, H_ACK} state_t; 
    state_t state; // possiveis estados
    
    logic [7:0] vector;
    logic tam;

    always_ff @(posedge clock1M or posedge reset) begin
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
                        status_out <= 1;
                        data_ready <= 1;
                        data_out <= vector;
                        if(ack_in) begin // VERIFICAR
                            states <= H_ACK;
                        end
                    end

                    H_ACK: begin
                        data_ready <= 0;
                        data_out <= 8'b0;
                        status_out <= 0;
                    end
            end
        end 
    end 