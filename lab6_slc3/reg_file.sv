//Register File 
//contains 8 16-bit registers,
//two 8:1 MUXES for the outputs SR1 and SR2,
//one 1:8 decoder for register selection
//has an input of 16 bits that goes to each register 

module regfile (input logic [15:0] reg_from_bus, 
							 input logic [2:0] IR_11to9,
							 input logic [2:0] IR_8to6,						
							 input logic DR, SR1,
							 input logic [2:0] SR2,
							 input logic Clk, Reset, LoadRg,
							 output logic [15:0] sr1_out,
							 output logic [15:0] sr2_out);
							 
							 
							 
		
		
		
		logic [2:0] DR_MUX;	 //DRMUX output and decoder's input 
		logic load[8]; 		 //decoder's outputs
		
		logic [2:0] SR1_MUX;  //SR1MUS output SR1_out input 
		
		
		logic	[15:0] Q[8];     //Registers' outputs
		
		
		
		mux2to1_3bits  DRMUX_in_regfile(.in0(IR_11to9),.in1(3'b111), .sel(DR), .out(DR_MUX));
		
		
		mux2to1_3bits  SR1MUX_in_regfile(.in0(IR_11to9), .in1(IR_8to6), .sel(SR1), .out(SR1_MUX));
		
		
		decoder 			decoder_load(.decode_in(DR_MUX), .load_reg(LoadRg), .decode_out('{load[0],load[1],load[2],load[3],load[4],load[5], load[6], load[7]}));
		
								 
		reg_16		R0_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[0]),  .Dout(Q[0][15:0]));
		
		reg_16		R1_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[1]),  .Dout(Q[1][15:0]));
		
		reg_16		R2_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[2]),  .Dout(Q[2][15:0]));
		
		reg_16		R3_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[3]),  .Dout(Q[3][15:0]));
	
		reg_16		R_in_regfile4(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[4]),  .Dout(Q[4][15:0]));
		
		reg_16		R5_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[5]),  .Dout(Q[5][15:0]));
		
		reg_16		R6_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[6]),  .Dout(Q[6][15:0]));
		
		reg_16		R7_in_regfile(.Din(reg_from_bus),  .Clk,  .Reset,  .Load(load[7]),  .Dout(Q[7][15:0]));
		
		
		mux8to1  		SR1_8to1mux(.Qin('{Q[0][15:0], Q[1][15:0],Q[2][15:0],Q[3][15:0],Q[4][15:0],Q[5][15:0],Q[6][15:0],Q[7][15:0]}), .sel(SR1_MUX), .muxOut(sr1_out));
		
		mux8to1  		SR2_8to1mux(.Qin('{Q[0][15:0], Q[1][15:0],Q[2][15:0],Q[3][15:0],Q[4][15:0],Q[5][15:0],Q[6][15:0],Q[7][15:0]}), .sel(SR2), .muxOut(sr2_out));
		
		
endmodule 






module mux2to1_3bits (input logic [2:0]	in0, in1,
							input logic     sel,
							output logic 	[2:0] 	out);
					
					
					always_comb
					begin
							case(sel)
								1'b0	:	out = in0;
								1'b1	:	out = in1;
							endcase
					end
endmodule

		




//8:1 MUX

module mux8to1 (input logic [15:0] Qin[8],
					 input logic [2:0] sel,
					 output logic [15:0] muxOut);
					 
					 
		always_comb
		
		begin
		
				case(sel)
					
					3'b000: muxOut = Qin[0][15:0];
					3'b001: muxOut = Qin[1][15:0];
					3'b010: muxOut = Qin[2][15:0];
					3'b011: muxOut = Qin[3][15:0];
					3'b100: muxOut = Qin[4][15:0];
					3'b101: muxOut = Qin[5][15:0];
					3'b110: muxOut = Qin[6][15:0];
					3'b111: muxOut = Qin[7][15:0];
					default: muxOut = 16'h0000;
					
				endcase
		end
		
endmodule 

//Decoder to select what
//Register will be loaded with data

module decoder(input logic [2:0] decode_in,
					input logic load_reg,
					output logic decode_out[8]);
					

		always_comb
		begin 
			
			if(load_reg)
			begin
			
				case(decode_in)
					//0
					3'b000: begin
									decode_out[0] = 1'b1;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
								end
					//1
					3'b001: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b1;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
								end
				   //2		
					3'b010: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b1;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
								end
					//3		
					3'b011: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b1;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
								end 
					//4		
					3'b100: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b1;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
								end 
					//5		
					3'b101: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b1;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
								end
					//6	
					3'b110: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b1;
									decode_out[7] = 1'b0;
								end 
					//7
					3'b111: begin
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b1;
								end 
								
				endcase
			end
			
			else
				begin 
									decode_out[0] = 1'b0;
									decode_out[1] = 1'b0;
									decode_out[2] = 1'b0;
									decode_out[3] = 1'b0;
									decode_out[4] = 1'b0;
									decode_out[5] = 1'b0;
									decode_out[6] = 1'b0;
									decode_out[7] = 1'b0;
				end
		end

endmodule	
		  




