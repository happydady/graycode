`timescale 1 ns / 1ns


module graycode_tb
	#(parameter data_width = 8,
	  parameter convert_dir = 1);

`include "../include/config.h"

reg [data_width-1:0] din;
wire [data_width-1:0] dout;
integer i;

initial
begin
	//$dumpfile("graycode.fsdb");
	//$dumpvars(1,graycode_tb);
	$dumpoff;
	$fsdbDumpfile("../my_fsdb/graycode.fsdb");
        $fsdbDumpvars("+all");
	
	$dumpflush;
	$dumpoff;
	$dumpon;
	//$dumpall;
	

//	$dumpflush;
//	$dumpoff;
end


initial
	begin
		$display("Start Simulation %m");
		#100
		$display($time);
		$monitor($time," din=%d, dout=%d",din, dout);
	end


initial
	begin
		for(i=0;i<20;i=i+1)
		begin
			din = i;
			#100;
		end		
	end


 graycode_converter	#(.data_width(DATA_WIDTH),.convert_dir(CONVERT_DIR)) GC_block 
		(.din(din), 
		 .dout(dout));
endmodule
