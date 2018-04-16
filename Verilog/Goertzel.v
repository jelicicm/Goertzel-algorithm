module Goertzel(
	clk,
	rst,
	x,
	y1,
	y2
);

parameter N=61;
input clk;
input rst;
input signed [11:0] x;
output [N - 1:0] y1;
output [N - 1:0] y2;

wire clk;
wire rst;
wire signed [11:0] x;
wire signed [N - 1:0] y1;
wire signed [N - 1:0] y2;

wire en;
wire signed [N - 1:0] fill_out;
wire signed[N - 1:0] add_out;
wire signed[N - 1:0] reg1_out;
wire signed[N - 1:0] reg2_out;
wire signed[N - 1:0] mult_out;
wire signed [N - 1:0] gain_minus_1_out;  

parameter val = 61'b 0000000000000000000000000000001111111111111111101011010011010;

  filler FILL(
    clk,
    rst,
    1,
    x,
    fill_out);

  adder ADD(
    clk,
    rst,
    1,
    fill_out,
    gain_minus_1_out,
    mult_out,
    add_out);

  registar REG1(
    clk,
    rst,
    en,
    add_out,
    reg1_out);

  registar REG2(
    clk,
    rst,
    en,
    reg1_out,
    reg2_out);

  multiplier_fixedpoint MUL(
    clk,
    rst,
    1,
    reg1_out,
    val,
    mult_out);

  gain_minus1 GAIN(
    clk,
    rst,
    1,
    reg2_out,
    gain_minus_1_out);
	 
  en_gen EN_GENERATOR(
	clk,
   rst,
   en
   );

  assign y1 = reg1_out;
  assign y2 = reg2_out;


endmodule
