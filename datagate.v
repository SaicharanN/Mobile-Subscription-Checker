module bytecomp(q, a, b); 
output q; 
input[0:15] a, b; 
wire[0:15] t, u, bbar, w1, w2, w3;
not n1[0:15](bbar, b);      // 8 not gates 
and n2[0:15](w1, bbar, a);  // 8 and gates 
and n3[0:15](w2, bbar, u);  // ...
and n3[0:15](w2, bbar, u);  // ... 
and n4[0:15](w3, a, u); 
or n5[0:15](t, w1, w2, w3);
assign u[15]   = 0;          // wire-to-wire 
assign u[0:14] = t[1:15];     //    connection 
assign q      = t[0]; 
endmodule

module limitcheck(q, a, b); 
output q; 
input[0:5] a, b; 
wire[0:5] t, u, bbar, w1, w2, w3;
not n1[0:5](bbar, b);      // 8 not gates 
and n2[0:5](w1, bbar, a);  // 8 and gates 
and n3[0:5](w2, bbar, u);  // ...
and n3[0:5](w2, bbar, u);  // ... 
and n4[0:5](w3, a, u); 
or n5[0:5](t, w1, w2, w3);
assign u[5]   = 0;          // wire-to-wire 
assign u[0:4] = t[1:5];     //    connection 
assign q      = t[0]; 
endmodule



module telephone1(a0,a1,a2,a3,a4,b0,b1,b2,b3,b4,c0,c1,c2,c3,c4,r1,r2,budjet,avgtalk,avgdata,s0,s1,s2,s3,s4,s);
input [5:0] a0,a1,a2,a3,a4,u1,v1,w1,x1;
input [5:0] b0,b1,b2,b3,b4,c0,c1,c2,c3,c4;
input [2:0] r1,r2;
input [5:0] budjet,avgtalk,avgdata;
output s0,s1,s2,s3,s4,s,z1,z2,z3,z4;
wire [15:0] sw0,sw1,sw2,sw3,sw4,sw5,store;
wire limit0,limit1,limit2,limit3,limit4;
wire [31:0] temp1;
wire [31:0] temp2;
wire [15:0] u,v,w,x;
wire key,key1,tempp,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30;
wire p1,p2,p3,p11,p12,p13,p21,p22,p23,p31,p32,p33,p41,p42,p43,np1,np2,np3,np11,np12,np13,np21,np22,np23,np31,np32,np33,np41,np42,np43;
wire m1,m2,m3,m4,m11,m12,m13,m14,m21,m22,m23,m24,m31,m32,m33,m34,m41,m42,m43,m44;

assign temp1=(b0*r1);
assign temp2=(c0*r2);
assign sw0=(temp1)+(temp2);
	    //temp1=temp1<<16,
		//temp2=a0,
		//sw0=temp1/temp2,
assign sw1=(b1*r1)+(c1*r2);
		//temp1=temp1<<16,
		//temp2=a1,
		//sw1=temp1/temp2,
assign 	sw2=(b2*r1)+(c2*r2);
		//temp1=temp1<<16,
		//temp2=a2,
		//sw2=temp1/temp2,
assign	sw3=(b3*r1)+(c3*r2);
		//temp1=temp1<<16,
		//temp2=a3,
		//sw3=temp1/temp2,
assign	sw4=(b4*r1)+(c4*r2);
		//temp1=temp1<<16,
		//temp2=a4,
		//sw4=temp1/temp2;

//Data flow modelling starts here  
		
assign  limit0=(a0<=budjet)&(b0>=avgtalk)&(c0>=avgdata),
		limit1=(a1<=budjet)&(b1>=avgtalk)&(c1>=avgdata),
		limit2=(a2<=budjet)&(b2>=avgtalk)&(c2>=avgdata),
		limit3=(a3<=budjet)&(b3>=avgtalk)&(c3>=avgdata),
		limit4=(a4<=budjet)&(b4>=avgtalk)&(c4>=avgdata);


assign  s=(~limit0) & (~limit1) & (~limit2) & (~limit3) & (~limit4);
//assign store=sw0;
//assign sw0=(s) | (limit0);
//assign sw0=sw0&store;

assign u=(sw0>=sw1)?sw0:sw1;
assign v=(sw2>=sw3)?sw2:sw3;
assign w=(u>=v)?u:v;
assign x=(w>=sw4)?w:sw4;

assign s0=(x==sw0),
		s1=(x==sw1),
		s2=(x==sw2),
		s3=(x==sw3),
		s4=(x==sw0);

assign u1=(a0<=a1)?a0:a1,
	   v1=(a2<=a3)?a2:a3,
	   w1=(u<=v)?u:v,
	   x1=(w<=a4)?w:a4;

assign z0=(x==a0)&(s),
	   z1=(x==a1)&(s),
	   z2=(x==a2)&(s),
	   z3=(x==a3)&(s),
	   z4=(x==a4)&(s);
	
//Gate modelling sarts here
/*
limitcheck l1(.q(p1),.a(a0),.b(budjet));
limitcheck l2(.q(p2),.a(avgtalk),.b(b0));
limitcheck l3(.q(p3),.a(avgdata),.b(c0));
not(np1,p1);
not(np2,p2);
not(np3,p3);
and(limit0,np1,np2,np3);

limitcheck l4(.q(p11),.a(a1),.b(budjet));
limitcheck l5(.q(p12),.a(avgtalk),.b(b1));
limitcheck l6(.q(p13),.a(avgdata),.b(c1));
not(np11,p11);
not(np12,p12);
not(np13,p13);
and(limit1,np11,np12,np13);

limitcheck l7(.q(p21),.a(a2),.b(budjet));
limitcheck l8(.q(p22),.a(avgtalk),.b(b2));
limitcheck l9(.q(p23),.a(avgdata),.b(c2));
not(np21,p21);
not(np22,p22);
not(np23,p23);
and(limit2,np21,np22,np23);

limitcheck l10(.q(p31),.a(a3),.b(budjet));
limitcheck l11(.q(p32),.a(avgtalk),.b(b3));
limitcheck l12(.q(p33),.a(avgdata),.b(c3));
not(np31,p31);
not(np32,p32);
not(np33,p33);
and(limit3,np31,np32,np33);

limitcheck l13(.q(p41),.a(a4),.b(budjet));
limitcheck l14(.q(p42),.a(avgtalk),.b(b4));
limitcheck l15(.q(p43),.a(avgdata),.b(c4));
not(np41,p41);
not(np42,p42);
not(np43,p43);
and(limit4,np41,np42,np43);

not(q21,limit0);
not(q22,limit1);
not(q23,limit2);
not(q24,limit3);
not(q25,limit4);
and(s,q21,q22,q23,q24,q25);
bytecomp bb0(.q(q1),.a(sw0),.b(sw1));
bytecomp bb1(.q(q2),.a(sw0),.b(sw2));
bytecomp bb2(.q(q3),.a(sw0),.b(sw3));
bytecomp bb3(.q(q4),.a(sw0),.b(sw4));		
and(s0,q1,q2,q3,q4);
bytecomp bb4(.q(q5),.a(sw1),.b(sw0));
bytecomp bb5(.q(q6),.a(sw1),.b(sw1));
bytecomp bb6(.q(q7),.a(sw1),.b(sw3));
bytecomp bb7(.q(q8),.a(sw1),.b(sw4));		
and(s1,q5,q6,q7,q8);
bytecomp bb8(.q(q9),.a(sw2),.b(sw0));
bytecomp bb9(.q(q10),.a(sw2),.b(sw1));
bytecomp bb10(.q(q11),.a(sw2),.b(sw3));
bytecomp bb11(.q(q12),.a(sw2),.b(sw4));		
and(s2,q9,q10,q11,q12);
bytecomp bb12(.q(q13),.a(sw3),.b(sw0));
bytecomp bb13(.q(q14),.a(sw3),.b(sw1));
bytecomp bb14(.q(q15),.a(sw3),.b(sw2));
bytecomp bb15(.q(q16),.a(sw3),.b(sw4));		
and(s3,q13,q14,q15,q16);
bytecomp bb16(.q(q17),.a(sw4),.b(sw0));
bytecomp bb17(.q(q18),.a(sw4),.b(sw1));
bytecomp bb18(.q(q19),.a(sw4),.b(sw2));
bytecomp bb19(.q(q20),.a(sw4),.b(sw3));		
and(s4,q17,q18,q19,q20);


limitcheck e1(.q(m1),.a(a1),.b(a0));
limitcheck e2(.q(m2),.a(a2),.b(a0));
limitcheck e3(.q(m3),.a(a3),.b(a0));
limitcheck e4(.q(m4),.a(a4),.b(a0));
and(z0,m1,m2,m3,m4);

limitcheck e11(.q(m11),.a(a0),.b(a1));
limitcheck e12(.q(m12),.a(a2),.b(a1));
limitcheck e13(.q(m13),.a(a3),.b(a1));
limitcheck e14(.q(m14),.a(a4),.b(a1));
and(z1,m11,m12,m13,m14);

limitcheck e21(.q(m21),.a(a0),.b(a2));
limitcheck e22(.q(m22),.a(a1),.b(a2));
limitcheck e23(.q(m23),.a(a3),.b(a2));
limitcheck e24(.q(m24),.a(a4),.b(a2));
and(z2,m21,m22,m23,m24);

limitcheck e31(.q(m31),.a(a0),.b(a3));
limitcheck e32(.q(m32),.a(a1),.b(a3));
limitcheck e33(.q(m33),.a(a2),.b(a3));
limitcheck e34(.q(m34),.a(a4),.b(a3));
and(z3,m31,m32,m33,m34);

limitcheck e41(.q(m41),.a(a0),.b(a4));
limitcheck e42(.q(m42),.a(a1),.b(a4));
limitcheck e43(.q(m43),.a(a2),.b(a4));
limitcheck e44(.q(m44),.a(a3),.b(a4));
and(z4,m41,m42,m43,m44);
*/
endmodule

