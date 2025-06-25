module COUNTER ( 
input clk,
output reg [1:0] counter
);
reg [25:0] cycle_count;

always @(posedge clk) begin

      if (cycle_count == 26'd49999999) begin
		    counter <= counter - 1;
			 cycle_count <= 0;
	    end 
		 else begin
		    cycle_count <= cycle_count + 1;
		 end 
end 
endmodule