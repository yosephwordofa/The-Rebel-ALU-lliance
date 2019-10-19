module moduleNOT(A, B);
	input[15:0]	A;
	output[15:0] B;

	not(B[0], A[0]);
	not(B[1], A[1]);
	not(B[2], A[2]);
	not(B[3], A[3]);
	not(B[4], A[4]);
	not(B[5], A[5]);
	not(B[6], A[6]);
	not(B[7], A[7]);
	not(B[8], A[8]);
	not(B[9], A[9]);
	not(B[10], A[10]);
	not(B[11], A[11]);
	not(B[12], A[12]);
	not(B[13], A[13]);
	not(B[14], A[14]);
	not(B[15], A[15]);
endmodule


module testbench();
	reg[15:0] A;
	wire[15:0] B;

	moduleNOT not11(A, B);
	
	initial begin
		$display(A,"   ", B);
		$finish;
	end
endmodule