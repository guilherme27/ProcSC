module ProcessadorSingleClock (Xh, Di, In, select, LE, clk, SBA, SBB, OutA, OutB, Out);
	input logic [7:0] Xh, Di, In;
	input logic [3:0] select, SBA, SBB;
	input logic clk, LE;
	output logic [7:0] OutA, OutB, Out;
	
	demuxReg demux();
	register reg0(Di, demux, clk, en);
	selectRegister selReg(clk, select, LE, reg0);
	
	always @(posedge clk)
		begin
			
		end
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
	output logic [14:0] sRegister;
	
	always @(posedge clk)
		begin
			case(select)
				4'd0: sRegister = 15'b100000000000000;
				4'd1: sRegister = 15'b010000000000000;
				4'd2: sRegister = 15'b001000000000000;
				4'd3: sRegister = 15'b000100000000000;
				4'd4: sRegister = 15'b000010000000000;
				4'd5: sRegister = 15'b000001000000000;
				4'd6: sRegister = 15'b000000100000000;
				4'd7: sRegister = 15'b000000010000000;
				4'd8: sRegister = 15'b000000001000000;
				4'd9: sRegister = 15'b000000000100000;
				4'd10: sRegister = 15'b000000000010000;
				4'd11: sRegister = 15'b000000000001000;
				4'd12: sRegister = 15'b000000000000100;
				4'd13: sRegister = 15'b000000000000010;
				4'd14: sRegister = 15'b000000000000001;
				default: sRegister = 15'b000000000000000;
			endcase
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