`timescale 1 ns/1 ns
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

module fag_tb;
reg A,B,CIN;
wire S,C;
fag A1(S,C,A,B,CIN);
initial 
repeat(50)
begin
A=$random;
B=$random;
CIN=$random;
#100;
end
endmodule

