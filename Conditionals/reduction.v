module top_module (
    input [7:0] in,
    output parity); 
    assign parity= ^in[7:0];
endmodule
//this is an unary operation. we can compute on all the bits of a vector.