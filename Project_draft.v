module DFF(clk,in,out);
  
  input  clk;
  input  [15:0]in;
  output [15:0]out;
  reg    [15:0]out;
  
  always @(posedge clk)//<--This is the statement that makes the circuit behave with TIME
  out = in;
 endmodule

 module mux_8to1_case ( input [15:0] a0,                 // 4-bit input called a
                       input [15:0] a1,                 // 4-bit input called b
                       input [15:0] a2,                 // 4-bit input called c
                       input [15:0] a3,                 // 4-bit input called d
                       input [15:0] a4,
                       input [15:0] a5,
                       input [15:0] a6,
                       input [15:0] a7,
                       input [2:0] sel,
                       input rst,                    // input sel used to select between a,b,c,d
                       output reg [15:0] out);         // 4-bit output based on input sel
 
   // This always block gets executed whenever a/b/c/d/sel changes value
   // When that happens, based on value in sel, output is assigned to either a/b/c/d
   always @ (a0 or a1 or a2 or a3 or sel or rst) begin
      if(rst == 1) begin
        $display("rst = %b",rst );
        $display("out = %b",out );
        out = 16'b0000000000000000;
        $display("out = %b",out );
        end
      else
      
      case (sel)
         3'b000 : out <= a0;
         3'b001 : out <= a1;
         3'b010 : out <= a2;
         3'b011 : out <= a3;
         3'b100 : out <= a4;
         3'b101 : out <= a5;
         3'b110 : out <= a6;
         3'b111 : out <= a7;
      endcase
      
   end
endmodule



/* LOGICAL OPERATION MODULES */
module xorModule(input [15:0] A,B, output [15:0] result);
	xor (result[0], A[0], B[0]);
	xor (result[1], A[1], B[1]);
	xor (result[2], A[2], B[2]);
	xor (result[3], A[3], B[3]);
	xor (result[4], A[4], B[4]);
	xor (result[5], A[5], B[5]);
	xor (result[6], A[6], B[6]);
	xor (result[7], A[7], B[7]);
	xor (result[8], A[8], B[8]);
	xor (result[9], A[9], B[9]);
	xor (result[10], A[10], B[10]);
	xor (result[11], A[11], B[11]);
	xor (result[12], A[12], B[12]);
	xor (result[13], A[13], B[13]);
	xor (result[14], A[14], B[14]);
	xor (result[15], A[15], B[15]);
endmodule

module xnorModule (A,B,result);

	input [15:0] 	A,B;
	output [15:0]	result;

	xnor (result[0], A[0], B[0]);
	xnor (result[1], A[1], B[1]);
	xnor (result[2], A[2], B[2]);
	xnor (result[3], A[3], B[3]);
	xnor (result[4], A[4], B[4]);
	xnor (result[5], A[5], B[5]);
	xnor (result[6], A[6], B[6]);
	xnor (result[7], A[7], B[7]);
	xnor (result[8], A[8], B[8]);
	xnor (result[9], A[9], B[9]);
	xnor (result[10], A[10], B[10]);
	xnor (result[11], A[11], B[11]);
	xnor (result[12], A[12], B[12]);
	xnor (result[13], A[13], B[13]);
	xnor (result[14], A[14], B[14]);
	xnor (result[15], A[15], B[15]);
endmodule

module orModule(A,B,result);

	input [15:0] 	A,B;
	output [15:0]	result;

	or (result[0], A[0], B[0]);
	or (result[1], A[1], B[1]);
	or (result[2], A[2], B[2]);
	or (result[3], A[3], B[3]);
	or (result[4], A[4], B[4]);
	or (result[5], A[5], B[5]);
	or (result[6], A[6], B[6]);
	or (result[7], A[7], B[7]);
	or (result[8], A[8], B[8]);
	or (result[9], A[9], B[9]);
	or (result[10], A[10], B[10]);
	or (result[11], A[11], B[11]);
	or (result[12], A[12], B[12]);
	or (result[13], A[13], B[13]);
	or (result[14], A[14], B[14]);
	or (result[15], A[15], B[15]);
endmodule

module notModule (a,result);

	input [15:0] 	a;
	output [15:0]	result;

	not(result[0], a[0]);           
	not(result[1], a[1]);
	not(result[2], a[2]);
	not(result[3], a[3]);
	not(result[4], a[4]);            		
	not(result[5], a[5]);
	not(result[6], a[6]);
	not(result[7], a[7]);
	not(result[8], a[8]);            		
	not(result[9], a[9]);
	not(result[10], a[10]);
	not(result[11], a[11]);
	not(result[12], a[12]);            		
	not(result[13], a[13]);
	not(result[14], a[14]);
	not(result[15], a[15]);	
endmodule

module norModule (A,B,result);

	input [15:0] 	A,B;
	output [15:0]	result;

	nor (result[0], A[0], B[0]);
	nor (result[1], A[1], B[1]);
	nor (result[2], A[2], B[2]);
	nor (result[3], A[3], B[3]);
	nor (result[4], A[4], B[4]);
	nor (result[5], A[5], B[5]);
	nor (result[6], A[6], B[6]);
	nor (result[7], A[7], B[7]);
	nor (result[8], A[8], B[8]);
	nor (result[9], A[9], B[9]);
	nor (result[10], A[10], B[10]);
	nor (result[11], A[11], B[11]);
	nor (result[12], A[12], B[12]);
	nor (result[13], A[13], B[13]);
	nor (result[14], A[14], B[14]);
	nor (result[15], A[15], B[15]);
endmodule

module nandModule(input [15:0] a,b,output [15:0]result);
    nand(result[0],a[0],b[0]);
    nand(result[1],a[1],b[1]);
    nand(result[2],a[2],b[2]);
    nand(result[3],a[3],b[3]);
    nand(result[4],a[4],b[4]);
    nand(result[5],a[5],b[5]);
    nand(result[6],a[6],b[6]);
    nand(result[7],a[7],b[7]);
    nand(result[8],a[8],b[8]);
    nand(result[9],a[9],b[9]);
    nand(result[10],a[10],b[10]);
    nand(result[11],a[11],b[11]);
    nand(result[12],a[12],b[12]);
    nand(result[13],a[13],b[13]);
    nand(result[14],a[14],b[14]);
    nand(result[15],a[15],b[15]);
endmodule

module andModule(input [15:0] a,b,output [15:0]result);
    and(result[0],a[0],b[0]);
    and(result[1],a[1],b[1]);
    and(result[2],a[2],b[2]);
    and(result[3],a[3],b[3]);
    and(result[4],a[4],b[4]);
    and(result[5],a[5],b[5]);
    and(result[6],a[6],b[6]);
    and(result[7],a[7],b[7]);
    and(result[8],a[8],b[8]);
    and(result[9],a[9],b[9]);
    and(result[10],a[10],b[10]);
    and(result[11],a[11],b[11]);
    and(result[12],a[12],b[12]);
    and(result[13],a[13],b[13]);
    and(result[14],a[14],b[14]);
    and(result[15],a[15],b[15]);
endmodule

/* MATHEMATICAL MODULE OPERATIONS */
module division(A,B,result);
    input [15:0] A;
    input [15:0] B;
    output [15:0] result;
    reg result;
    
    always @ (A,B,result) begin
    if(B == 0)
            result = 16'b0;
    else 
        result = A/B;

   end 
//assign result = A/B;

endmodule

module ALU(A,B,select,result,clk,rst);
input [15:0] A,B;
input [2:0] select;
input clk;
input rst;
output [15:0] result;
wire [15:0] andwire;  //a0
wire [15:0] nandwire;
wire [15:0] orwire;
wire [15:0] norwire;
wire [15:0] xorwire;
wire [15:0] xnorwire;
wire [15:0] notwire;
wire [15:0] divwire;  //a7

wire [15:0] out;

// calls to the modules that perfrom operations
xorModule myxor(A,B,xorwire);
xnorModule myxnor(A,B,xnorwire);
andModule myand(A,B,andwire);
nandModule mynand(A,B,nandwire);
norModule mynor(A,B,norwire);
orModule myor(A,B,orwire);
notModule mynot(A,notwire);
division mydiv(A,B,divwire);

// create the D FlipFlop registers and attach them to the circuit
DFF #(16) accumulator(clk,out,result);

mux_8to1_case mymux(andwire,nandwire,orwire,norwire,xorwire,xnorwire,notwire,divwire,select,rst,out);

always @ (A,B,select,rst)
begin

end

endmodule


/* TESTBENCH MODULE */
 module TestBench();
reg clk;
reg rst;
reg [15:0] A,B;
reg [2:0] select;
wire [15:0] out;

ALU myALU(A,B,select,out,clk,rst);

// CLOCK SIGNAL

initial 
    begin
        forever
            begin
                #5
                clk = 0;
                #5
                clk = 1;
            end
    end

// DISPLAY INFO
initial
    begin
      #1
      $display("A      |B      |Out");
      $display("---+-----+---+----+--+-----");
      forever
			begin
			#10
					$display("%b       |%b       |%b",A,B,myALU.result);
			end
    end


// STIMULUS
initial 
	begin
	    #2 //offset the clock square wave
        #10
        A=16'b1100;B=16'b1100;select=3'b000;rst=0;
        #10
        select=3'b111;
        #10
        select=3'b101;
        #10
        select=3'b011;
        #10
        A=16'b1000010100100;
        B=16'b1000110000100;
        #10
        rst=1;
        #10
        rst =0;
        #10
        select=3'b000;
        
        $finish;
	end

endmodule