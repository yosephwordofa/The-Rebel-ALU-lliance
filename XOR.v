module XOR_Calculator(input [15:0] in1,in2, output [15:0] result);
	xor  (result[0], in1[0], in2[0]);
	xor (result[1], in1[1], in2[1]);
	xor (result[2], in1[2], in2[2]);
	xor (result[3], in1[3], in2[3]);
	xor (result[4], in1[4], in2[4]);
	xor (result[5], in1[5], in2[5]);
	xor (result[6], in1[6], in2[6]);
	xor (result[7], in1[7], in2[7]);
	xor (result[8], in1[8], in2[8]);
	xor (result[9], in1[9], in2[9]);
	xor (result[10], in1[10], in2[10]);
	xor (result[11], in1[11], in2[11]);
	xor (result[12], in1[12], in2[12]);
	xor (result[13], in1[13], in2[13]);
	xor (result[14], in1[14], in2[14]);
	xor (result[15], in1[15], in2[15]);
endmodule


module testbench();
    reg[15:0] A;
    reg[15:0] B;
    wire[15:0] R;

    XOR_Calculator my_XOR(A,B,R);

    initial begin

        A = 15'b100100011011011;
        B = 15'b101000101101000;
        #10
        $display("A = %b", A);
        $display("B = %b", B);
        $display("R = %b", R);
        #10

        A = 15'b001010001010010;
        B = 15'b111101001000101;
        #10
        $display("A = %b", A);
        $display("B = %b", B);
        $display("R = %b", R);

    end


endmodule