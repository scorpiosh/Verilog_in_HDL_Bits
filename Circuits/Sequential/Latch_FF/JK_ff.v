module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
   // always@(posedge clk)begin 
     //   if (j==k)
       //     Q<=(j&k?~Q:Q);  
       // else Q<=j;
   // end
    wire D, Q_bar;
    reg Q_reg;

    // D input logic for JK flip-flop
    assign D = (j & ~Q_reg) | (~k & Q_reg);

    always @(posedge clk) begin
        Q_reg <= D;
    end

    assign Q = Q_reg;
        
endmodule
