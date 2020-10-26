module ALU (input logic	[15:0] 	a, b,
				 input logic	[1:0] 	aluk,
				 output logic	[15:0]	c);
				 
				
				always_comb 
					begin 
						 case(aluk)
							2'b00:		c = a + b;
							2'b01:		c = a & b;
							2'b10:		c = ~a;
							2'b11: 		c = a; 
						endcase
					end
endmodule

							