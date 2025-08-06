module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    assign {w[7:0], x[7:0],y[7:0],z[7:0]} = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0], 2'b11};

endmodule

//Given several input vectors, concatenate them together then split them up into several output vectors. There are six 5-bit input vectors: a, b, c, d, e, and f, for a total of 30 bits of input. There are four 8-bit output vectors: w, x, y, and z, for 32 bits of output. The output should be a concatenation of the input vectors followed by two 1 bits

module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    assign out[24:20] = ~{5{a}} ^ {a,b,c,d,e};
    assign out[19:15] = ~{5{b}} ^ {a,b,c,d,e};
    assign out[14:10] = ~{5{c}} ^ {a,b,c,d,e};
    assign out[9:5]   = ~{5{d}} ^ {a,b,c,d,e};
    assign out[4:0]   = ~{5{e}} ^ {a,b,c,d,e};

endmodule
//Given five 1-bit signals (a, b, c, d, and e), compute all 25 pairwise one-bit comparisons in the 25-bit output vector. The output should be 1 if the two bits being compared are equal.