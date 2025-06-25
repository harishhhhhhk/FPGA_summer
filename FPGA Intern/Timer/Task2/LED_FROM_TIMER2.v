module LED_FROM_TIMER2(
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

    // LED1 toggles every 2s
    always @(posedge clk) begin
        if (!rst)
            led1 <= 0;
        else if (tick)
            led1 <= ~led1;
    end

    // LED2 pattern:
	 reg [3:0] tick_counter;

    always @(posedge clk) begin
        if (!rst)
            led2 <= 0;
        else if (tick) begin
            case (tick_counter)
                1, 4, 11: led2 <= 1;  // ON
                2, 7: led2 <= 0;  // OFF
                default: led2 <= led2;          // Hold previous state
            endcase
        end
    end

endmodule
