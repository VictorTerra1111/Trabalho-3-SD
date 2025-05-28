module divider (
    input wire clock1M,
    input wire reset,
    output logic clk_10KHz,
    output logic clk_100KHz
);

  reg [7:0] clk10_count;
  reg [7:0] clk100_count;

  // clk_100KHz
  always_ff @(posedge clock1M or posedge reset) begin
    if (reset) begin
      clk_100KHz <= 0;
      clk100_count <= 0;
    end else begin
      if (clk100_count == 4) begin // 1MHz / (4+1)/2 = 100KHz
        clk_100KHz <= ~clk_100KHz;
        clk100_count <= 0;
      end else begin
        clk100_count <= clk100_count + 1;
      end
    end
  end

  // clk_10KHz
  always_ff @(posedge clock1M or posedge reset) begin
    if (reset) begin
      clk_10KHz <= 0;
      clk10_count <= 0;
    end else begin
      if (clk10_count == 49) begin // 1MHz / (49+1)/2 = 10KHz
        clk_10KHz <= ~clk_10KHz;
        clk10_count <= 0;
      end else begin
        clk10_count <= clk10_count + 1;
      end
    end
  end

endmodule
