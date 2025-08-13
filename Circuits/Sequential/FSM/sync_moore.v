// Note the Verilog-1995 module declaration syntax here:

module top_module(clk, reset, in, out);
    input clk;
    input reset;    // synchronous reset to state B
    input in;
    output out;

    // State encoding
    parameter A = 1'b0,
              B = 1'b1;

    reg present_state, next_state;

    // State register (sync reset)
    always @(posedge clk) begin
        if (reset)
            present_state <= B;
        else
            present_state <= next_state;
    end

    // Next-state logic (combinational)
    always @* begin
        case (present_state)
            A:      next_state = in ? A : B; // 1: stay A, 0: go B
            B:      next_state = in ? B : A; // 1: stay B, 0: go A
            default next_state = B;
        endcase
    end

    // Moore output: out=1 only in state B
    assign out = (present_state == B);

endmodule

