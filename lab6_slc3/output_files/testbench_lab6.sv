module testbench_lab6();

timeunit 10ns;

timeprecision 1ns;

logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

logic [15:0] PC_sim;

slc3_testtop topTest(.*);


always begin : CLOCK_GENERATION

#1 Clk = ~Clk;

end

initial begin : CLOCK_INITIALIZATION

Clk = 0;

end

initial begin : TEST_VECTOR
Run = 0;
Continue = 0;


#2  Run = 0;
    Continue = 0;

#3  Continue = 1;
	 
#4 Run = 1;
	 
#8 Continue = 0;
	 
#10 Continue = 1;
	 
#11 Run = 0;
	 
end

endmodule 