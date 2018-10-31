module bankOfRegisters (Xh, Di, In, select, LE, clk, SBA, SBB, OutA, OutB, Out)
	input logic [7:0] Xh, Di, In;
	input logic [3:0] select, SBA, SBB;
	input logic clk, LE;
	output logic [7:0] OutA, OutB, Out;
	
	demuxReg demux ();
	selectRegister selReg(clk, select, LE, 
	register reg0(Di, .demux(In[0]), clk, );
	
	always @(posedge clk)
		begin
			
		end
endmodule: bankOfRegisters

module demuxReg(In, sel, Out)
	input logic [7:0] In [15:0];
	input logic [3:0] sel;
	input logic [7:0] Out;
	
	always_comb 
		begin
			case(sel)
			3'd0: Out = In[0];
			3'd1: Out = In[1];
			3'd2: Out = In[2];
			3'd3: Out = In[3];
			3'd4: Out = In[4];
			3'd5: Out = In[5];
			3'd6: Out = In[6];
			3'd7: Out = In[7];
			3'd8: Out = In[8];
			3'd9: Out = In[9];
			3'd10: Out = In[10];
			3'd11: Out = In[11];
			3'd12: Out = In[12];
			3'd13: Out = In[13];
			3'd14: Out = In[14];
			3'd15: Out = In[15];
			default: Out = 7'b0;
		end
endmodule: demuxReg


module selectRegister(clk, Select, LE, sRegister)
	input logic [3:0] select;
	input logic LE, clk;
	input logic [14:0] sRegister;
	
	always @(posedge clk)
		case(select)
			3'd0: sRegister = 15'b100000000000000;
			3'd1: sRegister = 15'b010000000000000;
			3'd2: sRegister = 15'b001000000000000;
			3'd3: sRegister = 15'b000100000000000;
			3'd4: sRegister = 15'b000010000000000;
			3'd5: sRegister = 15'b000001000000000;
			3'd6: sRegister = 15'b000000100000000;
			3'd7: sRegister = 15'b000000010000000;
			3'd8: sRegister = 15'b000000001000000;
			3'd9: sRegister = 15'b000000000100000;
			3'd10: sRegister = 15'b000000000010000;
			3'd11: sRegister = 15'b000000000001000;
			3'd12: sRegister = 15'b000000000000100;
			3'd13: sRegister = 15'b000000000000010;
			3'd14: sRegister = 15'b000000000000001;
			default: sRegister = 15'b000000000000000;
endmodule: selectRegister

module register(In, Out, clk, en)
	
	input logic [7:0] In;
	input logic clk, en;
	output logic [7:0];
	
	always @(posedge clk)
		begin
			if (en == 1'd1)
				Out = In;
		end 
endmodule: register