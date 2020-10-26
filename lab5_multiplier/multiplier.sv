module multiplier(
						input logic Clk,
						input logic Run,
						input logic Clear_LoadB_Reset,
						input logic [7:0] S,
						output logic[7:0] Aval, Bval,
						output logic [6:0]  AhexL,AhexU,BhexL,BhexU,
						output logic X);
						
		logic Clear_LoadB_Reset_SH, Run_SH;
		logic Shift_Enable, addsub,clearXA, clearB, loadA, loadB,loadx;
		logic [7:0] A, B;
		logic [8:0] Sum;
		logic [7:0] S_SL;
		logic LSB_A;
		
			 //We can use the "assign" statement to do simple combinational logic

		
		D_ff x_D_ff (	.Din(Sum[8]),
							.Clk(Clk),
							.load(loadX),
							.reset(clearXA),
							.Q(X));
							
							
							
		ripple_adder_8 adder( .A(A),
							  .B(S_SL),
							  .sub_en(addsub),
							  .sum(Sum));
							  

							  
		reg_8 reg_A (.D(Sum[7:0]),
						.Clk(Clk),
						.Reset(clearXA),
						.Load(loadA),
						.Shift_En(Shift_Enable),
						.Shift_In(X),
						.Shift_Out( LSB_A),
						.Data_Out(A));
						
		reg_8 reg_B (.D(S_SL),
						.Clk(Clk),
						.Reset(clearB),
						.Load(loadB),
						.Shift_En(Shift_Enable),
						.Shift_In(LSB_A),
						.Data_Out(B));		
			

		
				
		control control_unit(.RUN(Run_SH),
									.CLEARA_LOADB_RESET(Clear_LoadB_Reset_SH),
									.CLK(Clk),
									.M(B[0]),
									.SHIFT_EN(Shift_Enable),
									.SUBADD(addsub),
									.CLEARXA(clearXA),
									.LOADB(loadB),
									.LOADA(loadA),
									.LOADX(loadX),
									.RESET(clearB));
									
		
		
	
						
	 HexDriver        HexAL (.In0(A[3:0]),  .Out0(AhexL) );
	 HexDriver        HexBL (.In0(B[3:0]), .Out0(BhexL) );
	
	 HexDriver        HexAU (.In0(A[7:4]), .Out0(AhexU) );	
	 HexDriver        HexBU (.In0(B[7:4]), .Out0(BhexU) );
		 assign Aval = A;
	 assign Bval = B;
		
	sync button_sync[1:0] (Clk, {~Clear_LoadB_Reset,~Run}, {Clear_LoadB_Reset_SH, Run_SH});
	sync s_sync[7:0] (Clk, S, S_SL);
	
	
endmodule
		
		
		
		
		
		
		
		
		