module telephone(a0,a1,a2,a3,a4,b0,b1,b2,b3,b4,c0,c1,c2,c3,c4,r1,r2,budjet,avgtalk,avgdata,s0,s1,s2,s3,s4,s);
input [5:0] a0,a1,a2,a3,a4;
input [5:0] b0,b1,b2,b3,b4,c0,c1,c2,c3,c4;
input [2:0] r1,r2;
input [5:0] budjet,avgtalk,avgdata;
output reg s0,s1,s2,s3,s4,s;
reg [15:0] sw0,sw1,sw2,sw3,sw4,sw5;
reg limit0,limit1,limit2,limit3,limit4;
reg [31:0] temp1;
reg [15:0] temp2;
reg [15:0] u,v,w,x;

always @ (a0 or b0 or c0 or a1 or b1 or c1 or a2 or b2 or c2 or a3 or b3 or c3 or budjet or r1 or r2 or avgtalk or avgdata)
begin 
sw0=(b0*r1)+(c0*r2);
//temp1=temp1<<16;
//temp2<=a0;
//sw0=temp1/temp2;
sw1=(b1*r1)+(c1*r2);
//temp1<=temp1<<16;
//temp2<=a1;
//sw1=temp1/temp2;
sw2=(b2*r1)+(c2*r2);
//temp1<=temp1<<16;
//temp2<=a2;
//sw3=temp1/temp2;
sw3=(b3*r1)+(c3*r2);
//temp1<=temp1<<16;
//temp2<=a3;
//sw3=temp1/temp2;
sw4=(b4*r1)+(c4*r2);
//temp1<=temp1<<16;
//temp2<=a4;
//sw4=temp1/temp2;

if(a0<=budjet && b0>=avgtalk && c0>=avgdata )
limit0=1;
else limit0=0;
if(a1<=budjet && b1>=avgtalk && c1>=avgdata )
limit1=1;
else limit1=0;
if(a2<=budjet && b2>=avgtalk && c2>=avgdata )
limit2=1;
else limit2=0;
if(a3<=budjet && b3>=avgtalk && c3>=avgdata )
limit3=1;
else limit3=0;
if(a4<=budjet && b4>=avgtalk && c4>=avgdata )
limit4=1;
else limit4=0;

if(limit0==0 && limit1==0 && limit2==0 && limit3==0 && limit4==0)
s=1;
else s=0;

if(s==0)
begin
 if(limit0==0) sw0=0;
 if(limit1==0) sw1=0;
 if(limit2==0) sw2=0;
 if(limit3==0) sw3=0;
 if(limit4==0) sw4=0;
end 

if(sw0>=sw1) u=sw0;
else u=sw1;
if(sw2>=sw3) v=sw2;
else v=sw3;
if(u>=v) w=u;
else w=v;
if(w>=sw4) x=w;
else x=sw4;

if(x==sw0) 
begin
s0=1; s1=0; s2=0; s3=0; s4=0; 
end
else if(x==sw1)
begin 
s0=0; s1=1; s2=0; s3=0; s4=0;
end
else if(x==sw2)
begin
s0=0; s1=0; s2=1; s3=0; s4=0;
end
else if(x==sw3)
begin
s0=0; s1=0; s2=0; s3=1; s4=0;
end
else if(x==sw4)
begin
s0=0; s1=0; s2=0; s3=0; s4=1;
end
end 
endmodule