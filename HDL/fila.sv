module fila(
    input [7:0] data_in,
    input enqueue_in,
    input dequeue_in
    
    input reset,
    input clock1M,
    
    output data_out,
    output len_out,
);

/*
A fila possui um tamanho fixo de 8 espaços OK, cada espaço com 8 bits. 
O sinal len_out deve informar o número de espaços utilizados. OK
Para colocar um elemento na fila, o elemento deverá aparecer no sinal 
data_in e o sinal enqueue_in deverá estar alto. OK OK
Para remover um elemento da fila, o sinal dequeue_in deve ser levantado e, no ciclo
subsequente, o dado removido deverá aparecer no sinal data_out. Este módulo deverá
funcionar a 10KHz.
*/

    logic [7:0][7:0] vector;
    logic tam_vet;
    
    assign len_out = tam_vet;
    // clock10k recebe clock1M

    // FAZER SHIFT NO VETOR VECTOR PARA MANTER PRIMEIRO ELEMENTO SEMPRE NA POS 0
    always_ff @(posedge clock1M) begin
        if (reset) begin
            data_out <= 0;
            len_out <= 0;
            vector <= 8'b0; // ??
            tam_vet <= 0;
        end else begin
                if(enqueue_in) begin
                    if(tam_vet == 8) begin
                        //  MENSAGEM DE ERRO VERIFICAR
                    end else begin 
                        vector[tam_vet] <= data_in;
                        tam_vet <= tam_vet + 1;
                    end
                end 
                else if(dequeue_in) begin
                    data_out <= vector[0]; // VERIFICAR REMOCAO DA FILA
                    vector[0:6] <= vector [1:7];
                    vector[7] <= 8'b0;
                end 
            end
        end 
    end 

