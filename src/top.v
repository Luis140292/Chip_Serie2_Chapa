module top (
  input clk,
  input reset,
  input enter,
  input [3:0] digit,
  output reg unlocked
);

  typedef enum logic [2:0] {
    IDLE = 3'd0,
    S1   = 3'd1,
    S2   = 3'd2,
    S3   = 3'd3,
    OK   = 3'd4,
    FAIL = 3'd5
  } state_t;

  state_t state, next_state;
  logic match;

  always_comb begin
    case (state)
      IDLE: match = (digit == 4'd9);
      S1:   match = (digit == 4'd9);
      S2:   match = (digit == 4'd7);
      S3:   match = (digit == 4'd9);
      default: match = 1'b0;
    endcase
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      state <= IDLE;
    else if (enter)
      state <= next_state;
  end

  always_comb begin
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

  always_comb begin
    unlocked = (state == OK);
  end

endmodule
