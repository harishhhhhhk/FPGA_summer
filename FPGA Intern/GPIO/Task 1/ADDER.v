module ADDER ( 
 input wire reset1,
input wire reset2,
output reg [1:0] c );

reg [1:0] a,b;

always @(*) begin 

a= 2'b00;
b= 2'b01;
c = a+b;

if (!reset1) begin 
a= 2'b01;
b= 2'b01;
c = a+b;
end

else if (!reset2) begin 
a=2'b01;
b=2'b10;
c = a+b;
end

end

endmodule 