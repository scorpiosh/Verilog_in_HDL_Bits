module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    wire [8:0] sum_ext;

    // Perform addition with extended sign bit
    assign sum_ext = {a[7], a} + {b[7], b};
    assign s = sum_ext[7:0];

    // Overflow: occurs if sign of inputs same but differs from output sign
    assign overflow = (a[7] == b[7]) && (s[7] != a[7]);

endmodule
//Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0]. These numbers are added to produce s[7:0]. Also compute whether a (signed) overflow has occurred
//If inputs have the same sign but the sum’s sign differs, overflow happened. If inputs have different signs, overflow cannot happen in two's complement addition.

