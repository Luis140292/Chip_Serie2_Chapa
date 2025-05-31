`timescale 1ns/1ps

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

    // Inicialización
    reset = 1; #10; reset = 0;

    // Ingresar PIN 9 9 7 9
    digit = 4'd9; enter = 1; #10; enter = 0; #10;
    digit = 4'd9; enter = 1; #10; enter = 0; #10;
    digit = 4'd7; enter = 1; #10; enter = 0; #10;
    digit = 4'd9; enter = 1; #10; enter = 0; #10;

    // Esperar desbloqueo
    #20;
    $finish;
  end

endmodule
