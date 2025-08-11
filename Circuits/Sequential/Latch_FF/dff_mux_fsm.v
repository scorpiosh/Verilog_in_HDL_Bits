module top_module (
    input clk,
    input x,
    output z
); 
	wire out1,out2,out3,q1,q2,q3, q_bar1,q_bar2,q_bar3;
    assign out1=x^q1;
    assign out2=x&q_bar2;
    assign out3=x|q_bar3;
    assign z=~(q1|q2|q3);
        
    d_ff df1(.clk(clk),.D(out1),.Q(q1), .Q_bar(q_bar1));
    d_ff df2(.clk(clk),.D(out2),.Q(q2), .Q_bar(q_bar2));
    d_ff df3(.clk(clk),.D(out3),.Q(q3), .Q_bar(q_bar3));
    
endmodule
module d_ff(input clk, input D, output Q,output Q_bar);
    initial Q=1'b0;
    
    always@(posedge clk)
        Q<=D;
    assign Q_bar=~Q;
endmodule