module mux4to1(input logic 	[15:0]	in00, in01, in10, in11,
					input logic 	[1:0] 	sb2,
					output logic 	[15:0] 	out);
					
					
					always_comb
					begin
							case(sb2)
								2'b00	:	out = in00;
								2'b01	:	out = in01;
								2'b10	:	out = in10;
								2'b11	: 	out = in11; 
							endcase
					end
endmodule