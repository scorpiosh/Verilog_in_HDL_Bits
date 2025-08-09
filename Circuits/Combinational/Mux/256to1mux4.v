module top_module(
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    // Selects a 4-bit segment from 'in' starting at 'sel * 4'
    assign out = in[((sel * 4)+3) -: 4];
    //bit slicing select 4 bits to the left

endmodule
