module top_module(
    input  [399:0] a,
    input  [399:0] b,
    input         cin,
    output        cout,
    output [399:0] sum
);

    wire [100:0] carry;  // Carry chain: carry[0] = cin, carry[100] = final carry out

    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_ripple
            bcd_fadd bcd_inst (
                .a    (a[4*i +: 4]),      // 4 bits per digit: slice [4*i+3:4*i]
                .b    (b[4*i +: 4]),
                .cin  (carry[i]),
                .cout (carry[i+1]),
                .sum  (sum[4*i +: 4])
            );
        end
    endgenerate

    assign cout = carry[100];  // final carry-out from the last BCD adder

endmodule
// Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder. Your adder should add two 100-digit BCD numbers (packed into 400-bit vectors) and a carry-in to produce a 100-digit sum and carry out.