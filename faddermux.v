`timescale 1 ns/1 ns
module fagmux(S,C,A,B,CIN);
input A,B,CIN;
output S,C;
wire W;
xor X1(W,A,B);
xor X2(S,W,CIN);
mux X3(C,CIN,A,W);
endmodule

module fagmux_tb;
reg A,B,CIN;
wire S,C;
fagmux A1(S,C,A,B,CIN);
initial 
repeat(100)
begin
A=$random;
B=$random;
CIN=$random;
#100;
end
endmodule

