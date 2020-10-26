module testbench_lab5();

timeunit 10ns;

timeprecision 1ns;


logic Clk;
logic Run;
logic Clear_LoadB_Reset;
logic [7:0] S;
logic [7:0] Aval, Bval;
logic [6:0]  AhexL,AhexU,BhexL,BhexU;

logic X;

logic signed [15:0] expectedValue;

integer errcount = 0;

multiplier multiplier0(.*);

always begin : CLOCK_GENERATION

#1 Clk = ~Clk;
end

initial begin : CLOCK_INITIALIZATION

   Clk = 0;
	
	end
	
initial begin : TEST_VECTORS


//positive * posotvie



     Clear_LoadB_Reset = 1;

#2   Clear_LoadB_Reset =0;

#2   Clear_LoadB_Reset = 1;

#2   S = 8'b00000011;

#2   Clear_LoadB_Reset = 1;

#2   Clear_LoadB_Reset = 0;
#2   Clear_LoadB_Reset = 1;

#10   S = 8'b11111101;

#2   Run = 1;

#2   Run = 0;

#2   Run = 1;

#60  expectedValue = -3*3 ;
	   if({Aval, Bval} != expectedValue)
				errcount++;
			



	
	end
endmodule














