`timescale 1ns / 1ps

module test_tb;

  reg clk = 0;
  reg reset = 0;
  reg enter = 0;
  reg [3:0] digit;
  wire unlocked;

  // Instancia del módulo bajo prueba
  top uut (
    .clk(clk),
    .reset(reset),
    .enter(enter),
    .digit(digit),
    .unlocked(unlocked)
  );

  // Reloj
  always #5 clk = ~clk;

  // Simulación
  initial begin
    $dumpfile("test.vcd");      // 🔴 NECESARIO: genera el archivo que Wokwi busca
    $dumpvars(0, test_tb);      // 🔴 NECESARIO

    // Secuencia de prueba: reset + PIN 9979
    reset = 1; #10; reset = 0;

    digit = 4'd9; enter = 1; #10; enter = 0; #10;
    digit = 4'd9; enter = 1; #10; enter = 0; #10;
    digit = 4'd7; enter = 1; #10; enter = 0; #10;
    digit = 4'd9; enter = 1; #10; enter = 0; #10;

    #20;
    $finish;
  end

endmodule

