module gain_minus1 (
   clk,
   rst,
   en,
   x,
   y);
 


parameter N = 61;

input   clk; 
input   rst; 
input   en; 
input   signed [N - 1:0] x; 
output  signed [N - 1:0] y; 

reg     signed [N - 1:0] y; 


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
         y <= -x;   
         end
      end
   end

endmodule

