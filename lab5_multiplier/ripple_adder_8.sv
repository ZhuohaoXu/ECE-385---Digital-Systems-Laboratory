module ripple_adder_8 (input logic[7:0] A, B,
							input sub_en,
							output logic[8:0] sum);
							
			logic c0, c1, c2,c3,c4,c5,c6,c7;
			full_adder FA0 (.x(A[0]), .y(sub_en^B[0]), .z(sub_en), .s(sum[0]), .c(c0));
			full_adder FA1 (.x(A[1]), .y(sub_en^B[1]), .z(c0), .s(sum[1]), .c(c1));
			full_adder FA2 (.x(A[2]), .y(sub_en^B[2]), .z(c1), .s(sum[2]), .c(c2));
			full_adder FA3 (.x(A[3]), .y(sub_en^B[3]), .z(c2), .s(sum[3]), .c(c3));
			full_adder FA4 (.x(A[4]), .y(sub_en^B[4]), .z(c3), .s(sum[4]), .c(c4));
			full_adder FA5 (.x(A[5]), .y(sub_en^B[5]), .z(c4), .s(sum[5]), .c(c5));
			full_adder FA6 (.x(A[6]), .y(sub_en^B[6]), .z(c5), .s(sum[6]), .c(c6));
			full_adder FA7 (.x(A[7]), .y(sub_en^B[7]), .z(c6), .s(sum[7]), .c(c7));
			full_adder FA8 (.x(A[7]), .y(sub_en^B[7]), .z(c7), .s(sum[8]));



endmodule



module full_adder(input x,y,z,
						output s,c);
						
			assign s = x^y^z;
			assign c = (x&y)|(y&z)|(x&z);

endmodule