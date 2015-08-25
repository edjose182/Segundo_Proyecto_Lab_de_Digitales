`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:08:40 08/20/2015 
// Design Name: 
// Module Name:    FF_D_Sincrono 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FF_D_Sincrono(

input wire clk,reset,
input wire [7:0] datos,
output reg [7:0] Q

 );
always@(posedge clk)

if(reset)
	begin
	Q <=8'b0;

	end

else

	begin

	Q<=datos;
	
	end

endmodule
