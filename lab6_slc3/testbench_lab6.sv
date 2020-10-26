module testbench_lab6();

timeunit 10ns;

timeprecision 1ns;

logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

logic [15:0] PC_sim, MDR_sim, MAR_sim, IR_sim;

logic [15:0] R0_val, R1_val,R2_val, R3_val,cpu_bus_sim;

logic WE_val;



slc3_testtop topTest(.*);
assign PC_sim = topTest.slc.PC;
assign MDR_sim = topTest.slc.MDR;
assign MAR_sim = topTest.slc.MAR;
assign IR_sim = topTest.slc.IR;
assign R0_val = topTest.slc.d0.register_file.R0_in_regfile.Dout;
assign R1_val = topTest.slc.d0.register_file.R1_in_regfile.Dout;
assign R2_val = topTest.slc.d0.register_file.R2_in_regfile.Dout;
assign R3_val = topTest.slc.d0.register_file.R3_in_regfile.Dout;
assign WE_val = topTest.slc.WE;
assign cpu_bus_sim = topTest.slc.d0.cpu_bus;


always begin : CLOCK_GENERATION

#1 Clk = ~Clk;

end

initial begin : CLOCK_INITIALIZATION

Clk = 0;

end

initial begin : TEST_VECTOR
Run = 0;
Continue = 0;
SW = 10'b0000001011;


#2  Run = 0;
    Continue = 0;

#2  Run = 1;
#2 Continue = 1;

#4 Run = 0;
#2 Run = 1;



/*0

#2  Run = 0;
    Continue = 0;

#2  Run = 1;
#2 Continue = 1;

#4 Run = 0;
#2 Run = 1;




#70 SW = 10'b0001101101;


#10 Continue = 0;
	 
#2 Continue = 1;

#10 Continue = 0;
	 
#2 Continue = 1;

#40 SW = 10'b000001001;

#10 Continue = 0;
	 
#2 Continue = 1;

*/






/// MEM2IO test 3






/*

// normal test

#2  Run = 0;
    Continue = 0;

#2  Continue = 1;
	 
#4 Run = 1;
	 
#10 Continue = 0;
	 
#2 Continue = 1;
 
#10 Continue = 0;
	 
#2 Continue = 1;




#10 Continue = 0;
	 
#2 Continue = 1;

#10 Continue = 0;
	 
#2 Continue = 1;

#10 Continue = 0;
	 
#2 Continue = 1;

#10 Continue = 0;
	 
#2 Continue = 1;

#10 Continue = 0;
	 
#2 Continue = 1;
*/	 
end

endmodule 