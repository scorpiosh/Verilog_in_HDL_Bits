module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] cin; 
    wire [15:0] cout1, cout2;
	add16 add_lo (.a(a[15:0]), .b(b[15:0]), .cin(cin), .sum(sum[15:0]), .cout(cout1) );
    add16 add_hi (.a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(cout2) );
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
	assign sum = a ^ b ^ cin;
	assign cout = a&b | a&cin | b&cin;
endmodule
//there are three modules in this design:

//top_module — Your top-level module that contains two of...
//add16, provided — A 16-bit adder module that is composed of 16 of...
//add1 — A 1-bit full adder module.
