module datapath(	
						input logic Clk, Reset,
						input logic LD_MAR, LD_MDR, LD_IR, LD_REG, LD_PC,LD_BEN, LD_CC, LD_LED,
						input logic GatePC, GateMDR, GateALU, GateMARMUX,
						input logic SR2MUX, ADDR1MUX,DRMUX, SR1MUX,
						input logic MIO_EN,
						input logic [1:0] PCMUX, ADDR2MUX, ALUK,
						input logic [15:0] MDR_In,
						output logic [15:0] MAR, MDR,IR,PC,
						output BEN,
						output logic [9:0] LED
						
																		); 				
/// internal signal

				logic[15:0] cpu_bus, ir_out_int, sr1out_int, sr2out_int,mar_out_int,mdr_out_int,mio_mux_out_int;
				logic[15:0] sr2_mux_out_int, alu_out_int, addr2_mux_out_int, addr1_mux_out_int, pc_out_int,pc_mux_out_int;

				
				
				
				regfile register_file(//inputs
											 .reg_from_bus(cpu_bus), 
											 .IR_11to9(ir_out_int[11:9]),
											 .IR_8to6(ir_out_int[8:6]),						
											 .DR(DRMUX), 
											 .SR1(SR1MUX),
											 .SR2(ir_out_int[2:0]),
											 .Clk(Clk), 
											 .Reset(Reset), 
											 .LoadRg(LD_REG),
											 //outputs
											 .sr1_out(sr1out_int),
											 .sr2_out(sr2out_int));
											 
											 
				 mux2to1  SR2_MUX( //inputs
										 .in0(sr2out_int),
										 .in1({{11{ir_out_int[4]}}, ir_out_int[4:0]}), 
										 .sb1(SR2MUX), 
										 //outputs
										 .out(sr2_mux_out_int));
										 
				ALU 		ALU_ELE( //inputs
										.a(sr1out_int),
										.b(sr2_mux_out_int),
										.aluk(ALUK),
				
										//outputs
										.c(alu_out_int));
				
				
				reg_16  IR_reg( // inputs
									.Clk(Clk),
									.Reset(Reset),
									.Din(cpu_bus),
									.Load(LD_IR),
									//outputs
									.Dout(ir_out_int));
									
									
				mux4to1  ADDR2_MUX(//inputs
										 
										 .in00(16'h0000),
										 .in01({{10{ir_out_int[5]}}, ir_out_int[5:0]}),
										 .in10({{7{ir_out_int[8]}}, ir_out_int[8:0]}),
										 .in11({{5{ir_out_int[10]}}, ir_out_int[10:0]}),
										 .sb2(ADDR2MUX),
										 //outputs
										 .out(addr2_mux_out_int));
										 
										 
			   mux2to1	ADDR1_MUX(//inputs
										 .in0(pc_out_int),
										 .in1(sr1out_int), 
										 .sb1(ADDR1MUX), 
										 //outputs
										 .out(addr1_mux_out_int));

				reg_16  PC_reg( // inputs
									.Clk(Clk),
									.Reset(Reset),
									.Din(pc_mux_out_int),
									.Load(LD_PC),
									//outputs
									.Dout(pc_out_int));
									
				mux4to1 PC_MUX(//inputs
										 
									.in00(pc_out_int + 16'h0001),
									.in01(cpu_bus),
									.in10(addr1_mux_out_int+ addr2_mux_out_int),
									.in11(),
									.sb2(PCMUX),
									//outputs
									.out(pc_mux_out_int));
									
			  tri_state  bus(//inputs
									 .gate_marmux(GateMARMUX),
									 .gate_pc(GatePC),
									 .gate_alu(GateALU),
									 .gate_mdr(GateMDR),
									 .MAR_data(addr1_mux_out_int+addr2_mux_out_int),
									 .PC_data(pc_out_int),
									 .ALU_data(alu_out_int),
									 .MDR_data(mdr_out_int),
								 //outputs
									 .Dout(cpu_bus));

			  
			  	reg_16  MAR_reg( // inputs
									.Clk(Clk),
									.Reset(Reset),
									.Din(cpu_bus),
									.Load(LD_MAR),
									//outputs
									.Dout(mar_out_int));
									
				reg_16  MDR_reg( // inputs
									.Clk(Clk),
									.Reset(Reset),
									.Din(mio_mux_out_int),
									.Load(LD_MDR),
									//outputs
									.Dout(mdr_out_int));
									
					
			  	mux2to1	MIO_MUX(//inputs
									 .in0(cpu_bus),
									 .in1(MDR_In), 
									 .sb1(MIO_EN), 
									 //outputs
									 .out(mio_mux_out_int));
									 
				ben_element BEN1(//inputs
									 .Din(cpu_bus),
									 .LD_CC(LD_CC),
									 .LD_BEN(LD_BEN),
									 .Clk(Clk),
									 .Reset(Reset),
									 .IR11down9(ir_out_int[11:9]),
									 
									 //outputs
									 .BEN_out(BEN)
				
									);
		  
			  always_comb begin
							MAR = mar_out_int;
							MDR = mdr_out_int;
							IR  = ir_out_int;
							PC  = pc_mux_out_int;
				end
				
				
				
				always_ff @(posedge Clk) begin
						 
						 if(LD_LED)
								LED <= IR[9:0];
						 else
								LED <= 10'b0;
				end
		  
				
endmodule

