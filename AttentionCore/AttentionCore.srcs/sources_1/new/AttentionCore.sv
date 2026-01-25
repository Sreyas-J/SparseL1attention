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
        input logic clk,val,
        input logic [DATA_WIDTH-1:0] q[0:MAX_H-1],k[0:MAX_H-1],v[0:MAX_H-1],
        input logic [$clog2(MAX_H)-1:0] H,
        input logic [DATA_WIDTH-1:0] scale,
        
        output logic [DATA_WIDTH-1:0] s,z [0:MAX_H-1],
        output logic zDone,sDone
    );
        logic [DATA_WIDTH-1:0] c,scaled;
        logic l1Val,mulVal,expVal,l1Ready,mulReady,expReady,scaleVal,scaleReady;
        
        L1dist#(
            .DATA_WIDTH(DATA_WIDTH),
            .H(MAX_H),
            .zero(zero)
        ) L1 (
            .clk(clk),
            .val(l1Val),
            .A(q),
            .B(k),
            .H(H),
            
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
        
        genvar i;
        generate
        for(i=0;i<MAX_H-1;i++) begin           
            MUL mul (
              .aclk(clk),                                  // input wire aclk
              .s_axis_a_tvalid(mulVal),            // input wire s_axis_a_tvalid
              .s_axis_a_tready(),            // output wire s_axis_a_tready
              .s_axis_a_tdata(v[i]),              // input wire [31 : 0] s_axis_a_tdata
              .s_axis_b_tvalid(mulVal),            // input wire s_axis_b_tvalid
              .s_axis_b_tready(),            // output wire s_axis_b_tready
              .s_axis_b_tdata(s),              // input wire [31 : 0] s_axis_b_tdata
              .m_axis_result_tvalid(),  // output wire m_axis_result_tvalid
              .m_axis_result_tready(mulVal),  // input wire m_axis_result_tready
              .m_axis_result_tdata(z[i])    // output wire [31 : 0] m_axis_result_tdata
            );
        end
        endgenerate
        
        MUL mul (
          .aclk(clk),                                  // input wire aclk
          .s_axis_a_tvalid(mulVal),            // input wire s_axis_a_tvalid
          .s_axis_a_tready(),            // output wire s_axis_a_tready
          .s_axis_a_tdata(v[MAX_H-1]),              // input wire [31 : 0] s_axis_a_tdata
          .s_axis_b_tvalid(mulVal),            // input wire s_axis_b_tvalid
          .s_axis_b_tready(),            // output wire s_axis_b_tready
          .s_axis_b_tdata(s),              // input wire [31 : 0] s_axis_b_tdata
          .m_axis_result_tvalid(mulReady),  // output wire m_axis_result_tvalid
          .m_axis_result_tready(mulVal),  // input wire m_axis_result_tready
          .m_axis_result_tdata(z[MAX_H-1])    // output wire [31 : 0] m_axis_result_tdata
        );
        
        always_comb begin
            l1Val=val;
            scaleVal=l1Ready;
            expVal=scaleReady;
            mulVal=expReady;
            sDone=expReady;
            zDone=mulReady;          
        end
        
endmodule
