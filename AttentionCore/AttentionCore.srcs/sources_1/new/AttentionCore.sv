`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2026 04:20:04 PM
// Design Name: 
// Module Name: AttentionCore
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AttentionCore#(
    parameter DATA_WIDTH=32,
    parameter MAX_H=64,
            
    parameter zero=$shortrealtobits(0.0)
    )(
        input logic clk,val,we,en,
        input logic [DATA_WIDTH-1:0] Qin,Kin,
//        v[0:MAX_H-1],
        input logic [$clog2(MAX_H):0] H,
        input logic [DATA_WIDTH-1:0] scale,
        input logic [$clog2(MAX_H)-1:0] addr,
        
        output logic [DATA_WIDTH-1:0] s,
//        z [0:MAX_H-1],
        output logic sDone
//        zDone
    );
        logic [DATA_WIDTH-1:0] c,scaled,Qout,Kout;
        logic l1Val,expVal,l1Ready,expReady,scaleVal,scaleReady;
        logic [$clog2(MAX_H):0] cnt;
        logic expReadyBuff,scaleReadyBuff;
        logic [$clog2(MAX_H)-1:0] addra;
//        mulVal,mulReady
//        mulReadyBuff
        
        L1dist#(
            .DATA_WIDTH(DATA_WIDTH),
            .MAX_H(MAX_H),
            .zero(zero)
        ) L1 (
            .clk(clk),
            .val(l1Val),
            .A(Qout),
            .B(Kout),
            .H(H),
            .cnt(cnt),
            
            .done(l1Ready),
            .c(c)
            );
            
        MUL SCALE (
          .aclk(clk),                                  // input wire aclk
          .s_axis_a_tvalid(scaleVal),            // input wire s_axis_a_tvalid
          .s_axis_a_tready(),            // output wire s_axis_a_tready
          .s_axis_a_tdata(scale),              // input wire [31 : 0] s_axis_a_tdata
          .s_axis_b_tvalid(scaleVal),            // input wire s_axis_b_tvalid
          .s_axis_b_tready(),            // output wire s_axis_b_tready
          .s_axis_b_tdata(c),              // input wire [31 : 0] s_axis_b_tdata
          .m_axis_result_tvalid(scaleReady),  // output wire m_axis_result_tvalid
          .m_axis_result_tready(scaleVal),  // input wire m_axis_result_tready
          .m_axis_result_tdata(scaled)    // output wire [31 : 0] m_axis_result_tdata
        );
        
        EXP exp (
          .aclk(clk),                                  // input wire aclk
          .s_axis_a_tvalid(expVal),            // input wire s_axis_a_tvalid
          .s_axis_a_tready(),            // output wire s_axis_a_tready
          .s_axis_a_tdata(scaled),              // input wire [31 : 0] s_axis_a_tdata
          .m_axis_result_tvalid(expReady),  // output wire m_axis_result_tvalid
          .m_axis_result_tready(expVal),  // input wire m_axis_result_tready
          .m_axis_result_tdata(s)    // output wire [31 : 0] m_axis_result_tdata
        );
        
        Q q (
          .clka(clk),    // input wire clka
          .ena(en),      // input wire ena
          .wea(we),      // input wire [0 : 0] wea
          .addra(addra),  // input wire [1 : 0] addra
          .dina(Qin),    // input wire [31 : 0] dina
          .douta(Qout)  // output wire [31 : 0] douta
        );
        
        K k (
          .clka(clk),    // input wire clka
          .ena(en),      // input wire ena
          .wea(we),      // input wire [0 : 0] wea
          .addra(addra),  // input wire [1 : 0] addra
          .dina(Kin),    // input wire [31 : 0] dina
          .douta(Kout)  // output wire [31 : 0] douta
        );
        
        
        always_ff@(posedge clk)begin
//            mulReadyBuff<=mulReady;
            expReadyBuff<=expReady; 
            scaleReadyBuff<=scaleReady;   
        end
        
        
        always_comb begin
            l1Val=val;
            scaleVal=l1Ready;
            expVal=(scaleReady && !scaleReadyBuff);
            sDone=(expReady && !expReadyBuff);
            
            if(we) addra=addr;
            else addra=cnt[$clog2(MAX_H)-1:0];          
        end
        
endmodule
