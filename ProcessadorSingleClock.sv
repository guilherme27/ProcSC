module ProcessadorSingleClock (Di, Xh, In, clk, SRD, LE, SBA, SBB, OutA, OutB, Out);
	input logic [7:0] Di, Xh, In;
	input logic [3:0] SRD, SBA, SBB;
	input logic clk, LE;
	output logic [7:0] OutA, OutB, Out;
	
	logic [15:0] OutSelectRegister;
	logic [7:0] OutRegistors [15:0];
	
	demuxReg demuxA(OutRegistors, SBA, OutA);
	demuxReg demuxB(OutRegistors, SBB, OutB);
	
	register reg0(Di, OutRegistors[0], clk, OutSelectRegister[0]);
	register reg1(Di, OutRegistors[1], clk, OutSelectRegister[1]);
	register reg2(Di, OutRegistors[2], clk, OutSelectRegister[2]);
	register reg3(Di, OutRegistors[3], clk, OutSelectRegister[3]);
	register reg4(Di, OutRegistors[4], clk, OutSelectRegister[4]);
	register reg5(Di, OutRegistors[5], clk, OutSelectRegister[5]);
	register reg6(Di, OutRegistors[6], clk, OutSelectRegister[6]);
	register reg7(Di, OutRegistors[7], clk, OutSelectRegister[7]);
	register reg8(Di, OutRegistors[8], clk, OutSelectRegister[8]);
	register reg9(Di, OutRegistors[9], clk, OutSelectRegister[9]);
	register regPIN(In, OutRegistors[10], clk, OutSelectRegister[10]);
	register regPOUT(Di, OutRegistors[11], clk, OutSelectRegister[11]);
	register regRcTimer(Di, OutRegistors[12], clk, OutSelectRegister[12]);
	register regTimer(Di, OutRegistors[13], clk, OutSelectRegister[13]);
	register regXh(Xh, OutRegistors[14], clk, OutSelectRegister[14]);
	register regXl(Di, OutRegistors[15], clk, OutSelectRegister[15]);
	
	selectRegister selReg(clk, SRD, LE, OutSelectRegister);
	
	assign Out = OutRegistors[11];
	
endmodule: ProcessadorSingleClock

module demuxReg(In, sel, Out);
	input logic [7:0] In [15:0];
	input logic [3:0] sel;
	output logic [7:0] Out;	
	
	always_comb 
		begin
			case(sel)
				4'd0: Out = In[0];
				4'd1: Out = In[1];
				4'd2: Out = In[2];
				4'd3: Out = In[3];
				4'd4: Out = In[4];
				4'd5: Out = In[5];
				4'd6: Out = In[6];
				4'd7: Out = In[7];
				4'd8: Out = In[8];
				4'd9: Out = In[9];
				4'd10: Out = In[10];
				4'd11: Out = In[11];
				4'd12: Out = In[12];
				4'd13: Out = In[13];
				4'd14: Out = In[14];
				4'd15: Out = In[15];
				default: Out = 7'b0;
			endcase
		end
endmodule: demuxReg


module selectRegister(clk, select, LE, sRegister);
	input logic [3:0] select;
	input logic LE, clk;
	output logic [15:0] sRegister;
	
	always @(posedge clk)
		begin
			if(LE == 1'b1)	
				case(select)
					4'd0: sRegister =  15'b1000000000000000;
					4'd1: sRegister =  15'b0100000000000000;
					4'd2: sRegister =  15'b0010000000000000;
					4'd3: sRegister =  15'b0001000000000000;
					4'd4: sRegister =  15'b0000100000000000;
					4'd5: sRegister =  15'b0000010000000000;
					4'd6: sRegister =  15'b0000001000000000;
					4'd7: sRegister =  15'b0000000100000000;
					4'd8: sRegister =  15'b0000000010000000;
					4'd9: sRegister =  15'b0000000001000000;
					4'd10: sRegister = 15'b0000000000100000;
					4'd11: sRegister = 15'b0000000000010000;
					4'd12: sRegister = 15'b0000000000001000;
					4'd13: sRegister = 15'b0000000000000100;
					4'd14: sRegister = 15'b0000000000000010;
					4'd15: sRegister = 15'b0000000000000001;
					default: sRegister = 15'b0000000000000000;
				endcase
			else
				sRegister = 15'b0000000000000000;
		end
endmodule: selectRegister

module register(In, Out, clk, en);
	
	input logic [7:0] In;
	input logic clk, en;
	output logic [7:0] Out;
	
	always @(posedge clk)
		begin
			if (en == 1'd1)
				Out = In;
		end 
endmodule: register