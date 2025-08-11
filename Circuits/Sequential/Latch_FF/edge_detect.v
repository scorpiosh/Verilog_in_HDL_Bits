module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg [7:0] prev_in;

    always @(posedge clk) begin
        prev_in <= in;                          // store previous input
        pedge <= (~prev_in) & in;               // detect positive edge this cycle
    end

endmodule
//For each bit in an 8-bit vector, detect when the input signal changes from 0 in one clock cycle to 1 the next (similar to positive edge detection). 
//The output bit should be set the cycle after a 0 to 1 transition occurs.