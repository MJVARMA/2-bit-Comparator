`timescale 1 ns/1 ns
module fag2(S,C,A,B,CIN);
input A,B,CIN;
output S,C;
wire [4:1]W;
xor X1(W[1],A,B);
xor X3(S,W[1],CIN);
and X2(W[2],A,B);
and X4(W[3],CIN,A);
and X5(W[4],CIN,B);
or X6(C,W[2],W[3],W[4]);
endmodule

module fag2_tb;
reg A,B,CIN;
wire S,C;
fag2 A1(S,C,A,B,CIN);
initial
repeat(100)
begin
A=$random;
B=$random;
CIN=$random;
#100;
end
endmodule

