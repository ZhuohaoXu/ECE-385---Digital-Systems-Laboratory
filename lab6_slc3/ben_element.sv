module ben_element(
			input logic [15:0] Din,
			input logic LD_CC, LD_BEN, Clk, Reset,
			input logic [2:0] IR11down9,
			output logic BEN_out
			);
	logic N, Z, P, n_out, z_out, p_out;

	always_ff @ (posedge Clk) begin
		if(Reset)
			BEN_out <= 1'b0;
		else if(LD_BEN)
			BEN_out <= ((IR11down9 & {n_out, z_out, p_out}) != 3'b000);
		if(LD_CC) begin
			n_out <= N;
			z_out <= Z;
			p_out <= P;
		end 
	end 
	
	
	always_comb begin
		if(Din == 16'h0000) begin
			N = 1'b0;
			Z = 1'b1;
			P = 1'b0;
		end 
		else if(Din[15] == 1'b1) begin
			N = 1'b1;
			Z = 1'b0;
			P = 1'b0;
		end 
		else if(Din[15] == 1'b0 && Din != 16'h0000) begin
			N = 1'b0;
			Z = 1'b0;
			P = 1'b1;
		end 
		else begin
			N = 1'bZ;
			Z = 1'bZ;
			P = 1'bZ;
		end 
	end 
endmodule 