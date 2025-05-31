module test_tb;

  reg clk = 0;
  reg reset = 0;
  reg enter = 0;
  reg [3:0] digit;
  wire unlocked;

  top uut (
    .clk(clk),
    .reset(reset),
    .enter(enter),
    .digit(digit),
    .unlocked(unlocked)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test_tb);

    reset = 1; #10; reset = 0;

    digit = 4'd9; enter = 1; #10; enter = 0; #10;
    digit = 4'd9; enter = 1; #10; enter = 0; #10;
    digit = 4'd7; enter = 1; #10; enter = 0; #10;
    digit = 4'd9; enter = 1; #10; enter = 0; #10;

    #20;
    $finish;
  end

endmodule


