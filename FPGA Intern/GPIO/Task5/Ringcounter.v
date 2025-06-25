module Ringcounter ( 
    input clk,
    input rst,
    output reg [1:0] counter
);

reg [25:0] cycle_count; // For 1-second delay with 50 MHz clock

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cycle_count <= 0;
        counter <= 2'b01;  // Initial ring pattern
    end else begin
        if (cycle_count == 26'd49999999) begin
            cycle_count <= 0;

            // Rotate left with wrap-around
            counter <= {counter[0], counter[1]};
        end else begin
            cycle_count <= cycle_count + 1;
        end
    end
end

endmodule
