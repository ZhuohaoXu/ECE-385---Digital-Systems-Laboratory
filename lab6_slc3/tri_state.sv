
module tri_state (input logic gate_marmux,
					 input logic gate_pc,
					 input logic gate_alu,
					 input logic gate_mdr,
					 input logic [15:0] MAR_data,
					 input logic [15:0] PC_data,
					 input logic [15:0] ALU_data,
					 input logic [15:0] MDR_data,
					 output logic [15:0]Dout);
					 
		
		logic [2:0] SEL;
		
		logic [3:0] allsignal;
		
		assign allsignal = {gate_marmux, gate_pc, gate_alu, gate_mdr};
		
		
		always@(allsignal)
			begin
				if(allsignal[3])
					SEL = 3'b000;
				else if(allsignal[2])
					SEL = 3'b001;
				else if(allsignal[1])
					SEL = 3'b010;
				else	if(allsignal[0])
					SEL = 3'b011;
				else
					SEL =3'b100;
			end
			
			
			
		
	
		//mux5to1 BUS_SELECT(.Din('{MAR_data[15:0], PC_data_data_data[15:0], ALU[15:0], MDR[15:0]}), .Selectbits4to1(SEL), .Dout(BUS));
		
		mux4to1_tri BUS_SELECT(.in0(MAR_data), .in1(PC_data), .in2(ALU_data), .in3(MDR_data), .out(Dout), .sel(SEL));
		
endmodule 


module mux4to1_tri (input logic [15:0] in0, in1, in2, in3, 
								  input logic [2:0] sel,
								  output logic [15:0] out);
								  
					
					always_comb
						begin 
							case(sel)
							3'b000: out = in0;
							3'b001: out = in1;
							3'b010: out = in2;
							3'b011: out = in3;
							default: out = 16'bZ;
							endcase
						end
endmodule 
					