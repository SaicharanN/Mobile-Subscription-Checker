`timescale 1ns/10ps
module t_telephone;
wire s0,s1,s2,s3,s4,s;
reg [5:0]a0,a1,a2,a3,a4;
reg [5:0]b0,b1,b2,b3,b4,c0,c1,c2,c3,c4;
reg [2:0]r1,r2;
reg [5:0]budjet,avgtalk,avgdata;
telephone1 m1(a0,a1,a2,a3,a4,b0,b1,b2,b3,b4,c0,c1,c2,c3,c4,r1,r2,budjet,avgtalk,avgdata,s0,s1,s2,s3,s4,s);
initial
begin
$dumpfile("t_telephone.vcd");
$dumpvars(0,t_telephone);
a0=6'b010010;
a1=6'b010010;
a2=6'b010010;
a3=6'b010010;
a4=6'b010010;
b0=6'b010000;
b1=6'b010001;
b2=6'b010010;
b3=6'b010011;
b4=6'b010100;
c0=6'b010100;
c1=6'b010011;
c2=6'b010010;
c3=6'b010001;
c4=6'b010000;
r1=3'b010;
r2=3'b011;
budjet=6'b010100;
avgtalk=6'b010000;
avgdata=6'b010000;
#10
a0=6'b010010;
a1=6'b010010;
a2=6'b010010;
a3=6'b010010;
a4=6'b010010;
b0=5'b10000;
b1=5'b10010;
b2=5'b10100;
b3=5'b10110;
b4=5'b11000;
c0=5'b10100;
c1=5'b10011;
c2=5'b10010;
c3=5'b10001;
c4=5'b10000;
r1=3'b001;
r2=3'b010;
budjet=6'b010100;
avgtalk=6'b010000;
avgdata=6'b010000;

end
initial #50 $finish;
endmodule