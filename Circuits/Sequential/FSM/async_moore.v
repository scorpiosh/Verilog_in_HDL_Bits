module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;


    always @(*) begin
        case (state)
            A:      next_state = in ? A : B; // 0 -> B, 1 -> stay A
            B:      next_state = in ? B : A; // 0 -> A, 1 -> stay B
           // default next_state = B;
        endcase
    end
    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset)
            state<=B;
        else
            state<=next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == B);
endmodule
