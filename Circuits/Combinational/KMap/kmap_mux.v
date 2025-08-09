
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    // mux_in[0] = c OR d
    assign mux_in[0] = d ? 1'b1 : c;

    // mux_in[1] = 0
    assign mux_in[1] = 1'b0;

    // mux_in[2] = NOT d OR NOT c
    assign mux_in[2] = d ? 1'b0 : 1'b1;

    // mux_in[3] = c AND d
    assign mux_in[3] = c ? d : 1'b0;
endmodule

