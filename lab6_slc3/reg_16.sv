module reg_16(input logic	[15:0]	Din,
						 input logic 				Clk, Reset, Load,
						 output logic 	[15:0]	Dout);
				
						always_ff @ (posedge Clk )
				
							begin
								if(Reset)
									Dout <= 16'h0000;
								else if (Load)
									Dout <= Din;
							end
	
endmodule
	