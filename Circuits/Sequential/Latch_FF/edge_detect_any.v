module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] prev_in;

    always @(posedge clk) begin
        prev_in <= in;                          // store previous input
        anyedge <= prev_in ^ in;               // detect any edge this cycle
    end

endmodule
