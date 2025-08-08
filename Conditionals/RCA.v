
module top_module(
    input  [99:0] a, b,
    input         cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [100:0] carry; // Need one extra bit for the last carry

    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin: ripple_adder
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
            assign cout[i] = carry[i+1];
        end
    endgenerate

endmodule

module full_adder(
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
// ripple carry adder using generate from FA 1 bit