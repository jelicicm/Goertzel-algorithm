module multiplier_fixedpoint (
   clk,
   rst,
   en,
   a,
   b,
   y);
 

parameter N = 61;

input   clk; 
input   rst; 
input   en; 
input   signed [N - 1:0] a; 
input   signed [N - 1:0] b; 
output  signed  [N - 1:0] y; 

reg     signed [N - 1:0] y; 
wire    signed [2 * N - 1:0] y_tmp; 

assign y_tmp = a * b; 

always @(posedge clk or posedge rst)
   begin
   if (rst == 1)
      begin
      y <= 0;   
      end
   else
      begin
      if (en == 1)
         begin
				y <= {y_tmp[2 * N - 1], y_tmp[89:30]};
         end
      end
   end

endmodule

