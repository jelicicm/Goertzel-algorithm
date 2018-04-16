module en_gen (
   clk,
   rst,
   en_out
  
  );

input   clk; 
input   rst; 
output   en_out;

reg en_out;  
reg [9:0] count_s = 10'b0000000000;
  
always @(posedge clk or posedge rst) 
begin
	if(rst == 1) 
	begin
      count_s = 10'b0000000000;
	end 
	else 
	begin
      if(count_s == 10'b1111100111) 
		begin
			en_out <= 1;
			count_s <= 10'b0000000000;
		end
      else 
		begin
			count_s <= count_s + 1;
			en_out <= 0;
		end
	end
end


endmodule