module deserializador(
    input data_in,
    input write_in,
    input ack_in,

    input reset,
    input clock,
    
    output status_out,
    output [7:0]data_out,
    output data_ready
);

    reg [7:0] vector;

    typedef enum logic [2:0] {IDLE, NS} state_t; 
    state_t state; // possiveis estados

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
            status_out <= 0;
            state <= IDLE;
            data_ready <= 0;
            vector <= 8'b0;
        end else begin
                if(write_in) begin
                    vector <= data_in; // ALTERAR PARA SHIFT 
                end
                
        end 
    end 