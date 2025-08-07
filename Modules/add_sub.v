module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_x;
    wire [15:0] cin; 
    wire cout1, cout2;
    
    assign b_x = {32{sub}} ^ b;
    add16 add_lo (.a(a[15:0]), .b(b_x[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cout1) );
    add16 add_hi (.a(a[31:16]), .b(b_x[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(cout2));
    
endmodule
