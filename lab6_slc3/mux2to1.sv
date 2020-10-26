module mux2to1(input logic 	[15:0]	in0, in1,
					input logic 			 	sb1,
					output logic 	[15:0] 	out);
					
					
					always_comb
					begin
							case(sb1)
								1'b0	:	out = in0;
								1'b1	:	out = in1; 
								default: out = in0; 
							endcase
					end
endmodule
