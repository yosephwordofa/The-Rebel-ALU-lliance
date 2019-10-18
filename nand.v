module nander(input [15:0] a,b,output [15:0]s);
    nand(s[0],a[0],b[0]);
    nand(s[1],a[1],b[1]);
    nand(s[2],a[2],b[2]);
    nand(s[3],a[3],b[3]);
    nand(s[4],a[4],b[4]);
    nand(s[5],a[5],b[5]);
    nand(s[6],a[6],b[6]);
    nand(s[7],a[7],b[7]);
    nand(s[8],a[8],b[8]);
    nand(s[9],a[9],b[9]);
    nand(s[10],a[10],b[10]);
    nand(s[11],a[11],b[11]);
    nand(s[12],a[12],b[12]);
    nand(s[13],a[13],b[13]);
    nand(s[14],a[14],b[14]);
    nand(s[15],a[15],b[15]);
endmodule

module testbench();
    reg[15:0] A;
    reg[15:0] B;
    wire[15:0] R;

    nander my_nand(A,B,R);

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