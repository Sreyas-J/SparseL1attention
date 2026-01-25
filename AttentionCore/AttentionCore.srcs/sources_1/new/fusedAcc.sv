`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2026 06:42:15 PM
// Design Name: 
// Module Name: fusedAcc
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


module fusedAcc#(
    parameter DATA_WIDTH=32
)(
    input logic clk,val,
    input logic [DATA_WIDTH-1:0] a,b,c ,
    
    output logic done,
    output logic [DATA_WIDTH-1:0] out
    );
    
    logic subVal,subDone,addVal;
    logic [DATA_WIDTH-1:0] subA,subB,diff,addA,addB,sum;
    
    SUB sub (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(subVal),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(),            // output wire s_axis_a_tready
      .s_axis_a_tdata(subA),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(subVal),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(),            // output wire s_axis_b_tready
      .s_axis_b_tdata(subB),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(subVal),  // input wire m_axis_result_tready
      .m_axis_result_tdata(diff)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    ADD add (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(addVal),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(),            // output wire s_axis_a_tready
      .s_axis_a_tdata(addA),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(addVal),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(),            // output wire s_axis_b_tready
      .s_axis_b_tdata(addB),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(addVal),  // input wire m_axis_result_tready
      .m_axis_result_tdata(sum)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    logic [DATA_WIDTH-1:0] addBbuff;
    
    always_ff@(posedge clk)begin
        addBbuff<=c;
        subDone<=val;
        done<=subDone;
    end
    
    always_comb begin
        subA=a;
        subB=b;
        
        addA=diff;
        addB=addBbuff;
        
        out=sum;
        
        subVal=val;
        addVal=subDone;
        
//        done=addDone;
    end
    
endmodule
