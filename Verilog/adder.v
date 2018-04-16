module adder (
   clk,
   rst,
   en,
   a,
   b,
   c,
   y);
 
parameter N = 61;

input   clk; 
input   rst; 
input   en; 
input   signed [N - 1:0] a; 
input   signed [N - 1:0] b; 
input   signed [N - 1:0] c; 
output  signed [N - 1:0] y; 

reg    signed [N - 1:0] y; 
wire   signed [N + 1:0] a_alu32_s; 
wire   signed [N + 1:0] b_alu32_s; 
wire   signed [N + 1:0] c_alu32_s; 
wire   signed [N + 1:0] sum_alu32_s; 


assign a_alu32_s = $signed(a); 
assign b_alu32_s = $signed(b);
assign c_alu32_s = $signed(c);

assign sum_alu32_s = a_alu32_s + b_alu32_s + c_alu32_s; 

always @(posedge clk or posedge rst)
   begin : process_1
   if (rst == 1)
      begin
      y <= 0;   
      end
   else
      begin
      if (en == 1)
         begin
         y <=  $signed(sum_alu32_s);
         end
      end
   end


endmodule

