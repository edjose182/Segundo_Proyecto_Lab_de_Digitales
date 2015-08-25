`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:18 08/20/2015 
// Design Name: 
// Module Name:    FSM_Detector_de_F0 
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
module FSM_Detector_de_F0(

input clk,reset,
input [7:0] datos,

output reg reset_FF

    );

localparam[1:0]

	Espera=2'b00,  ///En este estado se evaluara la variable

	Activa=2'b01,
	
	Final= 2'b10;   ////Este estado sirve para que en el proximo pulso reloj se carguen los datos que estan depues del F0

reg [1:0] estado_presente,estado_proximo;

always@(posedge clk, posedge reset)
begin
	if(reset)
		estado_presente<=Espera;

	else
		estado_presente<=estado_proximo;
end

////Parte combinacional de cambio de estado

always@*
	case(estado_presente)

		Espera:

			if(datos==8'hF0)

				estado_proximo<=Activa;    ////Se cambiara de estado hasta que la variable datos se igual a F0

			else

				estado_proximo<=Espera;


		Activa:
		
			if(datos!=8'hF0)
			
			estado_proximo<=Final;     //Si la variable datos no es igual a F0 no habra cambio de estado, de forma que  no se guarde
			                           //el dato en el FF. De forma que no se almacene en el FF el valor de F0   
			
			else
			
			estado_proximo<=Activa;

			
		Final:
		
			estado_proximo<=Espera;   //Este estado da tiempo para que en el siguiente pulso reloj se almacene en el FF el dato que
											 //se desea utilizar y uno F0


		default:

			estado_proximo<=Espera;

	endcase


always@*

	case(estado_presente)

		Espera:

			reset_FF=1'b0;

		Activa:

			reset_FF=1'b0;
			
		Final:
		
			reset_FF=1'b1;
	

		default:

			reset_FF=1'b0;


	endcase

endmodule