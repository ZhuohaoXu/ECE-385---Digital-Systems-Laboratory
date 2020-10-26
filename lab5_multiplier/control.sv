module control(input logic RUN, CLEARA_LOADB_RESET, CLK, M,
				   output logic SHIFT_EN, SUBADD, CLEARXA,CLEARB, LOADB, LOADA, LOADX, RESET);
				
				
				
	enum logic [4:0] {Start,Load,
							ADD0, SHIFT0,
							ADD1, SHIFT1,
							ADD2, SHIFT2,
							ADD3, SHIFT3,
							ADD4, SHIFT4,
							ADD5, SHIFT5,
							ADD6, SHIFT6,
							ADD7, SHIFT7, 
							Hold, consec,
							clear} curr_state, next_state;

	always_ff @(posedge CLK) begin
		if(CLEARA_LOADB_RESET)
			curr_state <= Start;
		else
			curr_state <= next_state;
	end

	always_comb begin
		next_state = curr_state;

		unique case (curr_state)
			Start 	: 	next_state = Load;
							
			Load		: if(RUN)
							next_state = ADD0;
							else
							next_state =Load;
							
		
			ADD0	: 	next_state = SHIFT0;
			SHIFT0 	: 	next_state = ADD1;

			
			ADD1	: 	next_state = SHIFT1;
			SHIFT1 	: 	next_state = ADD2;
			
			
			ADD2	: 	next_state = SHIFT2;
			SHIFT2 	: 	next_state = ADD3;
			
			
			ADD3	: 	next_state = SHIFT3;
			SHIFT3 	: 	next_state = ADD4;
			
			ADD4	: 	next_state = SHIFT4;
			SHIFT4 	: 	next_state = ADD5;
			
			ADD5	: 	next_state = SHIFT5;
			SHIFT5 	: 	next_state = ADD6;
			
			ADD6	: 	next_state = SHIFT6;
			SHIFT6 	: 	next_state = ADD7;
			
			ADD7	: 	next_state = SHIFT7;
			SHIFT7 	: 	next_state = Hold;
			
			
			Hold:   if(~RUN)
						next_state = consec;
						
			consec: if(RUN)
						next_state = clear;
			
			clear: next_state = ADD0;
			
					
		endcase
	end 

	always_comb begin
		case(curr_state)
		
			consec:  begin
							SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b0;
							LOADB 	<= 1'b0;
							LOADA    <= 1'b0;
							LOADX		<= 1'b0;
							RESET		<= 1'b0;
						end
						
			clear: begin
										SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b1;
							LOADB 	<= 1'b0;
							LOADA    <= 1'b0;
							LOADX		<= 1'b0;
							RESET		<= 1'b0;
							end
							
					
							
			Start: 	begin
							SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b1;
							LOADB 	<= 1'b1;
							LOADA    <= 1'b0;
							LOADX		<= 1'b0;
							RESET		<= 1'b0;
						end 

		Load:    begin
							SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b0;
							LOADX		<= 1'b0;
							LOADB 	<= 1'b0;
							LOADA    <= 1'b0;
							RESET		<= 1'b0;
						end 
			
			ADD0,
			ADD1,
			ADD2,
			ADD3,
			ADD4,
			ADD5,
			ADD6 :    begin
							SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b0;
							LOADB 	<= 1'b0;
							RESET		<= 1'b0;
							if(M) begin
								LOADA    <= 1'b1;
								LOADX		<= 1'b1;
									end
							else  begin							
								LOADA    <= 1'b0;
								LOADX		<= 1'b0;
									end
						end 

			
			ADD7:		begin
							SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b0;
							LOADB 	<= 1'b0;
							RESET		<= 1'b0;
							LOADX		<= 1'b1;
							if(M) 	begin
											LOADA    <= 1'b1;
											SUBADD 	<= 1'b1;
											
										end 
							else		begin
											LOADA    <= 1'b0;
											SUBADD 	<= 1'b0;
										end
						end 

			SHIFT0,
			SHIFT1,
			SHIFT2,
			SHIFT3,
			SHIFT4,
			SHIFT5,
			SHIFT6,
			SHIFT7:  begin
							SHIFT_EN <= 1'b1;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b0;
							LOADB 	<= 1'b0;
							LOADA    <= 1'b0;
							LOADX		<= 1'b0;
							RESET		<= 1'b0;
						end 

			Hold :  begin
							SHIFT_EN <= 1'b0;
							SUBADD 	<= 1'b0;
							CLEARXA  <= 1'b0;
							LOADB 	<= 1'b0;
							LOADA    <= 1'b0;
							RESET		<= 1'b0;
							LOADX		<= 1'b0;
						end 		

			

		endcase 
	end

	endmodule 