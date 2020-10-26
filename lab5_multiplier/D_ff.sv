module D_ff(
				input logic Din,
				input logic Clk, reset, load,
				output logic Q);
				
				always_ff @ (posedge Clk)
				
				begin
					if(reset)
						Q <= 0;
					else if (load)
						Q <= Din;
				end
	
	endmodule
	