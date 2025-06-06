module top(
    input logic clock1M,
    input logic reset,
    input logic data_in,
    input logic write_in,
    input logic dequeue_in,
    output logic [7:0] data_out,
    output logic status_out
);

    logic enqueue_in, ack_in, clk_10KHz, clk_100KHz;
    logic data_ready;
    logic [7:0] len_out;
    logic [7:0] data_out_des;
    logic data_ready_sync1, data_ready_sync2;
        
    deserializador des(
        .reset(reset),
        .clk_100KHz(clk_100KHz),
        .data_in(data_in),
        .write_in(write_in),
        .status_out(status_out),
        .ack_in(ack_in),
        .data_out(data_out_des),
        .data_ready(data_ready)
    );

    fila fil(
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .data_in(data_out_des),
        .len_out(len_out),
        .enqueue_in(enqueue_in),
        .data_out(data_out),
        .dequeue_in(dequeue_in)
    );

    clock_divisor divisor(
        .clock1M(clock1M),
        .reset(reset),
        .clk_10KHz(clk_10KHz),
        .clk_100KHz(clk_100KHz)
    );

    assign ack_in = (len_out < 8);

    always @(posedge clk_10KHz or posedge reset) begin
        if (reset) begin
            data_ready_sync1 <= 0;
            data_ready_sync2 <= 0;
        end else begin
            data_ready_sync1 <= data_ready;
            data_ready_sync2 <= data_ready_sync1;
        end
    end

    always @(posedge clk_10KHz or posedge reset) begin
        if (reset) begin
            enqueue_in <= 0;
        end else begin
            if (data_ready_sync2 && len_out < 8) begin
                enqueue_in <= 1;
            end else begin
                enqueue_in <= 0;
            end
        end
    end
endmodule