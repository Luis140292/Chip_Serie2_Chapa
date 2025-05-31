module top (
  input clk,
  input reset,
  input enter,
  input [3:0] digit,
  output reg unlocked
);

  // Estados como parámetros
  parameter IDLE = 3'd0;
  parameter S1   = 3'd1;
  parameter S2   = 3'd2;
  parameter S3   = 3'd3;
  parameter OK   = 3'd4;
  parameter FAIL = 3'd5;

  reg [2:0] state;
  reg [2:0] next_state;
  reg match;

  // Mealy: comparador de dígito
  always @(*) begin
    case (state)
      IDLE: match = (digit == 4'd9);
      S1:   match = (digit == 4'd9);
      S2:   match = (digit == 4'd7);
      S3:   match = (digit == 4'd9);
      default: match = 0;
    endcase
  end

  // Moore: transición de estado
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= IDLE;
    else if (enter)
      state <= next_state;
  end

  always @(*) begin
    case (state)
      IDLE:  next_state = match ? S1 : FAIL;
      S1:    next_state = match ? S2 : FAIL;
      S2:    next_state = match ? S3 : FAIL;
      S3:    next_state = match ? OK : FAIL;
      OK:    next_state = OK;
      FAIL:  next_state = FAIL;
      default: next_state = IDLE;
    endcase
  end

  // Salida
  always @(*) begin
    unlocked = (state == OK);
  end

endmodule

