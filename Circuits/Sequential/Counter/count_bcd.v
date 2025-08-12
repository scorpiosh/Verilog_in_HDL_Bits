module top_module (
    input clk,
    input reset,   // synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    wire en;
    assign en = 1'b1;

    // Generate enable signals for upper digits based on carry from lower digits
    assign ena[1] = (q[3:0] == 4'd9) ? 1'b1 : 1'b0;
    assign ena[2] = (q[7:4] == 4'd9) ? ena[1] : 1'b0;
    assign ena[3] = (q[11:8] == 4'd9) ? ena[2] : 1'b0;

    decade CT0(clk, reset, en, q[3:0]);
    decade CT1(clk, reset, ena[1], q[7:4]);
    decade CT2(clk, reset, ena[2], q[11:8]);
    decade CT3(clk, reset, ena[3], q[15:12]);

endmodule


module decade (
    input clk,
    input reset,
    input ena,        // enable counting
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0;
        end else if (ena) begin
            if (q < 4'd9)
                q <= q + 1'b1;
            else
                q <= 4'b0;
        end
        // else hold current value
    end
endmodule
