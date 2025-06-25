module LED_FROM_TIMER3(
    input clk,
    input rst,
    input tick,        
    output reg led1,
    output reg led2
);
    always @(posedge clk) begin
        if (!rst)
            tick_counter <= 0;
        else if (tick)
            tick_counter <= tick_counter + 1;
    end

    // LED2 pattern:
	 reg [3:0] tick_counter;
	 

    always @(posedge clk) begin
        if (!rst)
            led2 <= 0;
        else if (tick) begin
            case (tick_counter)
                1, 4, 9,16: begin 
					 led2 <= 1 ;
					 led1<=1 ;  // ON
					 end
                2,6,12,20: begin 
					 led2 <= 0;
					 led1<=0 ;// OFF
					 end
                default: led2 <= led2;          // Hold previous state
            endcase
        end
    end

endmodule
