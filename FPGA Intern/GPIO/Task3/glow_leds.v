module glow_leds ( 
input clk,
input rst,
output reg [7:0] leds
);

always @(posedge clk) begin 
    if (rst) begin
	     leds <= 0;
	end  
	else begin
        leds <= 8'b11111111;	
	end 
end
endmodule