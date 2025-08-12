module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm, 
    output reg [7:0] ss 
);

    wire en_m = (ss == 8'h59)? 1'b1: 0;
    wire en_h = (mm == 8'h59)?((ss == 8'h59)? 1'b1:0): 0;


    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00; // Reset seconds to 00
        end else if (ena) begin
            if (ss[3:0] < 4'd9)
                ss[3:0] <= ss[3:0] + 1'b1;
            else begin 
                ss[3:0] <= 4'd0;
                if (ss[7:4] < 4'd5)
                    ss[7:4] <= ss[7:4] + 1'b1;
                else
                    ss[7:4] <= 4'd0;
            end
        end
    end

 
    always @(posedge clk) begin
        if (reset) begin
            mm <= 8'h00; // Reset minutes to 00
        end else if (en_m) begin 
            if (mm[3:0] < 4'd9)
                mm[3:0] <= mm[3:0] + 1'b1;
            else begin 
                mm[3:0] <= 4'd0;
                if (mm[7:4] < 4'd5)
                    mm[7:4] <= mm[7:4] + 1'b1;
                else 
                    mm[7:4] <= 4'd0;
            end
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12; 
            pm <= 1'b0;  // Reset to AM (0 for AM, 1 for PM)
        end else if (en_h) begin 
            if (hh == 8'h11) begin
                hh <= 8'h12; 
                pm <= ~pm;   // Toggle AM/PM (e.g., 11 AM to 12 PM)
            end
            else if (hh == 8'h12) begin
                hh <= 8'h01; // 12 becomes 01
               
            end
            else if (hh[3:0] == 4'd9) begin
                hh[3:0] <= 4'd0;
                hh[7:4] <= hh[7:4] + 1'b1;
            end
            else begin
                hh[3:0] <= hh[3:0] + 1'b1;
            end
        end
    end
    
    

endmodule
//Create a set of counters suitable for use as a 12-hour clock (with am/pm indicator). 
//Your counters are clocked by a fast-running clk, with a pulse on ena whenever your clock should increment (i.e., once per second).

//reset resets the clock to 12:00 AM. pm is 0 for AM and 1 for PM. hh, mm, and ss are two 
//BCD (Binary-Coded Decimal) digits each for hours (01-12), minutes (00-59), and seconds (00-59). Reset has higher priority than enable,
// and can occur even when not enabled.