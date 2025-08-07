module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] cin0=16'b0, cin1=16'b1; 
    wire cout1, cout2, cout3;
    wire [15:0]  sum2, sum3;
    add16 add_lo (.a(a[15:0]), .b(b[15:0]), .cin(cin0), .sum(sum[15:0]), .cout(cout1) );
    add16 add_hi1 (.a(a[31:16]), .b(b[31:16]), .cin(cin0), .sum(sum2), .cout(cout2) );
    add16 add_hi2 (.a(a[31:16]), .b(b[31:16]), .cin(cin1), .sum(sum3), .cout(cout3) );
    always @ (sum2 or sum3 or cout1) begin 
        case(cout1)
            1'b0: sum[31:16] <= sum2; 
            1'b1: sum[31:16] <= sum3;
        endcase 
    end

endmodule
