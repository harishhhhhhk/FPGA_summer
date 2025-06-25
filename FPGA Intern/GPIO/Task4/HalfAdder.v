module HalfAdder ( input a , input b, output reg sum,output reg car );
always @(*) begin
sum = (!a)^(!b);
car = (!a)&(!b);
end
endmodule