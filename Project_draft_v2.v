module DFF(clk,in,out);
  
  input  clk;
  input  [15:0]in;
  output [15:0]out;
  reg    [15:0]out;
  
  always @(posedge clk)//<--This is the statement that makes the circuit behave with TIME
  out = in;
 endmodule

module DFFB(clk,rst,in,out);
  
  input  clk;
  input rst;
  input  [15:0]in;
  output [15:0]out;
  reg    [15:0]out;
  
  always @(posedge clk) begin
  	if(rst == 1) 
		out <= 16'b0;
	else	
		out <= in;
 end
 endmodule

module mux_2to1(A,accum,select,rst,result);
 input [15:0]A;
 input [15:0]accum;
 input [1:0] select;
 input rst;
 output [15:0]result;
 reg result;

 always @ (select or rst) begin
	if(rst == 1)begin
		result = 16'b0000000000000000; // reset
		$display("mux2 reset: %b",result);
	end
	
	if(rst == 0) begin
		case(select)
		2'b10 : result <= A;
		2'b01 : result <= accum;
		endcase
	end
 end

endmodule

module mux_8to1_case ( input [15:0] a0,        
                       input [15:0] a1,              
                       input [15:0] a2,                
                       input [15:0] a3,                 
                       input [15:0] a4,
                       input [15:0] a5,
                       input [15:0] a6,
                       input [15:0] a7,
                       input [15:0] a8,
                       input [15:0] a9,
					   input [15:0] a10,
					   input [15:0] a11,
					   input [15:0] a12,
					   input [15:0] a13,
                       input [13:0] sel,
                       input rst,                    
                       output reg [15:0] out);         
 
   // This always block gets executed whenever a/b/c/d/sel changes value
   // When that happens, based on value in sel, output is assigned to either a/b/c/d
   always @ (sel or rst) begin
      if(rst == 1) begin
        out = 16'b0000000000000000; // reset
        end
      else
      
      case (sel)
         14'b00000000000001 : out <= a0;
         14'b00000000000010 : out <= a1;
         14'b00000000000100 : out <= a2;
         14'b00000000001000 : out <= a3;
         14'b00000000010000 : out <= a4;
         14'b00000000100000 : out <= a5;
         14'b00000001000000 : out <= a6;
         14'b00000010000000 : out <= a7;
         14'b00000100000000 : out <= a8;
         14'b00001000000000 : out <= a9;
		 14'b00010000000000 : out <= a10;
		 14'b00100000000000 : out <= a11;
		 14'b01000000000000 : out <= a12;
		 14'b10000000000000 : out <= a13;
      endcase
      
   end
endmodule

module decoder (opcode,out);
 input [3:0] opcode;
 output [13:0] out;
 reg out;

 always @(opcode) begin
 case(opcode)
 4'b0000:  out=14'b00000000000001; // a0
 4'b0001:  out=14'b00000000000010; 
 4'b0010:  out=14'b00000000000100; 
 4'b0011:  out=14'b00000000001000; 
 4'b0100:  out=14'b00000000010000; 
 4'b0101:  out=14'b00000000100000; 
 4'b0110:  out=14'b00000001000000; 
 4'b0111:  out=14'b00000010000000; // a7
 4'b1000:  out=14'b00000100000000;
 4'b1001:  out=14'b00001000000000;
 4'b1010:  out=14'b00010000000000;
 4'b1011:  out=14'b00100000000000;
 4'b1100:  out=14'b01000000000000;
 4'b1101:  out=14'b10000000000000; // a13
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
    if(B == 0) begin
            result = 16'b0;
            $display("Division by 0 Err");
            end
    else 
        result = A/B;

   end 
endmodule

module multiplication(A,B,result);
	input [15:0] A;
	input [15:0] B;
	output [15:0] result;
	reg result;

	always @ (A,B,result) begin
		result = A*B;
	end
endmodule

module leftShift(A,result);
    input [15:0] A;
    output [15:0] result;
    reg result;
    
    always @ (A,result) begin
        result <= A << 1;
   end 
endmodule

module rightShift(A,result);
    input [15:0] A;
    output [15:0] result;
    reg result;
    
    always @ (A,result) begin
        result <= A >> 1;
   end 
endmodule

module Add_half (a, b,c_out,sum);
	
	input 	a,b;
	output 	c_out,sum;
	
	xor G1(sum, a, b);				// Gate instance names are optional xor denoted as a: ^
  	and G2(c_out, a, b);
endmodule

module Add_full (a,b,c_in,c_out,sum);	 
	
	input 	a,b,c_in;
	output 	c_out,sum;

	wire w1, w2, w3;				// w1 is c_out; w2 is sum
  	Add_half M1 (a, b, w1, w2);
  	Add_half M0 (w2, c_in, w3, sum);
  	or (c_out, w1, w3);				// or() xor() and() part of basic verilog library
endmodule

module Add_rca_16 (a,b,c_in,c_out,sum);

	input [15:0] 	a,b;
	input		    c_in;
	output		    c_out;
	output [15:0]	sum;

							// Intermediate carries
	wire c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, c_in7, c_in8, c_in9;
	wire c_in10, c_in11, c_in12, c_in13, c_in14, c_in15;
	
	wire input1, input2, input3, input4, input5, input6, input7, input8;
	wire input9, input10, input11, input12, input13, input14, input15, input16;
	
	xor(input1, c_in, b[0]);            		// xor B bits with M to third input into FULL-Adder
	xor(input2, c_in, b[1]);
	xor(input3, c_in, b[2]);
	xor(input4, c_in, b[3]);
	xor(input5, c_in, b[4]);            		
	xor(input6, c_in, b[5]);
	xor(input7, c_in, b[6]);
	xor(input8, c_in, b[7]);
	xor(input9, c_in, b[8]);            		
	xor(input10, c_in, b[9]);
	xor(input11, c_in, b[10]);
	xor(input12, c_in, b[11]);
	xor(input13, c_in, b[12]);            		
	xor(input14, c_in, b[13]);
	xor(input15, c_in, b[14]);
	xor(input16, c_in, b[15]);
	
  	Add_full M0 (a[0], input1, c_in,  c_in1, sum[0]);
  	Add_full M1 (a[1], input2, c_in1, c_in2, sum[1]);
  	Add_full M2 (a[2], input3, c_in2, c_in3, sum[2]);
  	Add_full M3 (a[3], input4, c_in3, c_in4, sum[3]);
	Add_full M4 (a[4], input5, c_in4, c_in5, sum[4]);
  	Add_full M5 (a[5], input6, c_in5, c_in6, sum[5]);
  	Add_full M6 (a[6], input7, c_in6, c_in7, sum[6]);
  	Add_full M7 (a[7], input8, c_in7, c_in8, sum[7]);
	Add_full M8 (a[8], input9, c_in8, c_in9, sum[8]);
  	Add_full M9 (a[9], input10, c_in9, c_in10, sum[9]);
  	Add_full M10 (a[10], input11, c_in10, c_in11, sum[10]);
  	Add_full M11 (a[11], input12, c_in11, c_in12, sum[11]);
	Add_full M12 (a[12], input13, c_in12, c_in13, sum[12]);
  	Add_full M13 (a[13], input14, c_in13, c_in14, sum[13]);
  	Add_full M14 (a[14], input15, c_in14, c_in15, sum[14]);
  	Add_full M15 (a[15], input16, c_in15, c_out, sum[15]);
endmodule

module control(opcode,reset,load,result,reset_out,loadout);
 input [3:0] opcode;
 input reset;
 input load;
 output [13:0]result;
 output reset_out;
 output [1:0]loadout;
 reg res;
 reg reset_out;
 reg loadout;

 decoder myDec(opcode,result);

 always @ (opcode,reset) begin
	res = result;
	reset_out = reset;
	loadout = {load,!load};
 end

endmodule

module ALU(A,B,opcode,result,clk,rst,load);
input [15:0] A,B;
input [3:0] opcode;
input clk;
input rst;
input load;
output [15:0] result;
wire [15:0] andwire;  //a1
wire [15:0] nandwire;
wire [15:0] orwire;
wire [15:0] norwire;
wire [15:0] xorwire;
wire [15:0] xnorwire;
wire [15:0] notwire;
wire [15:0] divwire;  //a8
wire [15:0] addwire; 
wire [15:0] subwire;  //a10
wire [15:0] multwire;
wire [15:0] leftShiftwire;
wire [15:0] rightShiftwire; //a13
wire [13:0] opwire;  // wire from control module that is the main mux select
wire rstwire; // wire that controls the reset
wire [15:0] muxAout; // wire that feeds from the Amux into the A-FlipFlop
wire [15:0] Awire;
wire [15:0] Bwire;
wire [1:0] loadwire;

wire [15:0] out; // output of the main mux that controls operation

// control module
control ALUcontrol(opcode,rst,load,opwire,rstwire,loadwire);

// calls to the modules that perfrom operations
xorModule myxor(Awire,Bwire,xorwire);
xnorModule myxnor(Awire,Bwire,xnorwire);
andModule myand(Awire,Bwire,andwire);
nandModule mynand(Awire,Bwire,nandwire);
norModule mynor(Awire,Bwire,norwire);
orModule myor(Awire,Bwire,orwire);
notModule mynot(Awire,notwire);
division mydiv(Awire,Bwire,divwire);
Add_rca_16 myadd(Awire,Bwire,1'b0,c_out,addwire);
Add_rca_16 mysub(Awire,Bwire,1'b1,c_out,subwire);
multiplication mymult(Awire,Bwire,multwire);
leftShift myleft(Awire,leftShiftwire);
rightShift myright(Awire,rightShiftwire);


// create the D FlipFlop registers and attach them to the circuit
DFF #(16) accumulator(clk,out,result);
DFF #(16) A_reg(clk,muxAout,Awire);
DFFB #(16) B_reg(clk,rstwire,B,Bwire);

mux_8to1_case mymux(Awire,andwire,nandwire,orwire,norwire,xorwire,xnorwire,notwire,divwire,addwire,subwire,multwire,
					leftShiftwire,rightShiftwire,opwire,rstwire,out);

mux_2to1 muxA(A,result,loadwire,rstwire,muxAout);


always @ (A,B,opcode,rst)
begin

end

endmodule


/* TESTBENCH MODULE */
 module TestBench();
reg clk;
reg rst;
reg load;
reg [15:0] A,B;
reg [3:0] select;
wire [15:0] out;

ALU myALU(A,B,select,out,clk,rst,load);

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
					$display("%b       |%b       |%b",myALU.muxAout,myALU.Bwire,myALU.result);
			end
    end


// STIMULUS
initial 
	begin
	    #2 //offset the clock square wave
		rst=1;
        #10
        rst=0;A=16'b1100;B=16'b0011;load=1;select=3'b000;
        #10
        select=3'b111;load=1;
        #10
        select=4'b1000;load=1;
        #10
        select=4'b1001;load=1;
        #10
        select=4'b0101;load=1;
        #10
        A=16'b0000101000111111;load=1;#10select=4'b0011;load=0;
        #10
        A=16'b1000010100100;
        B=16'b0; select=4'b1011;load =0;
        #10
		B=16'b10;
        rst=1;
        #10
        rst =1;
        #10
        select=4'b1100;
		#10
		select=4'b1101;#10
        // for division make a checker after the output from the mux and if 16'x then print error and send 16'b0 to the accumulator
        $finish;
	end

endmodule