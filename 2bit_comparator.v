//`timescale 1 ns/1 ns
module comp2bit(Y1,Y2,Y3,A,B);
input [1:0]A,B;
output Y1,Y2,Y3;
wire [5:0]W;
fag X1(W[1],W[0],B[1],~A[1],W[2]);
fag X2(W[3],W[2],B[0],~A[0],1'b0);
assign W[4]=W[3]&1'b1;
assign W[5]=W[1]&W[4];
assign Y1=W[5];         //A=B
assign Y2=W[0];         //A<B
assign Y3=W[5]^~W[0];   //A>B
endmodule

module fag(S,C,A,B,CIN);
input A,B,CIN;
output S,C;
wire [3:1]W;
xor X1(W[1],A,B);
and X2(W[2],A,B);
xor X3(S,W[1],CIN);
and X4(W[3],CIN,W[1]);
or X5(C,W[2],W[3]);
endmodule

//test bench
/*module comp2bit_tb;
reg [1:0]A,B;
wire Y1,Y2,Y3;
comp2bit X1(Y1,Y2,Y3,A,B);
initial
repeat(100)
begin
A=$random;
B=$random;
#100;
end
endmodule*/
