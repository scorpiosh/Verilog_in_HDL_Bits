module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] cin; 
    wire [15:0] cout1, cout2;
    assign cin = 16'b0;
    add16 add_lo (.a(a[15:0]), .b(b[15:0]), .cin(cin), .sum(sum[15:0]), .cout(cout1) );
    add16 add_hi (.a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(cout2) );
    
endmodule
//You are given a module add16 that performs a 16-bit addition. Instantiate two of them to create a 32-bit adder. One add16 module computes the lower 16 bits of the addition result, while the second add16 module computes the upper 16 bits of the result, 