/*
data_width is parameter of the width of the data
convert_dir is the flag using to show graycode to bin code of vise vers
0: bin to graycode
1: graycode to bin
*/
`timescale 1 ns / 1ns
module graycode_converter 
		#(parameter data_width = 4,
		  parameter convert_dir = 1)
		(din,dout);
input  [data_width-1:0] din;
output reg[data_width-1:0] dout;

reg [data_width-1:0] din_temp;
integer i;

//assign dout = din_temp;

always@(din) 
begin
	if(convert_dir == 1)
	begin
		dout[data_width-1] = din[data_width-1];
		for(i=data_width-2;i>=0;i=i-1)
			dout[i] = din[i] ^ din[i+1];	
	end 
	else
	begin
 		dout[data_width-1] = din[data_width-1];
		for(i=data_width-2;i>=0;i=i-1)
			dout[i] = dout[i+1] ^ din[i]; 
	end
end

endmodule
			

	
