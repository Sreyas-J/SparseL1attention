`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2026 04:16:01 PM
// Design Name: 
// Module Name: top
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


module top(

    );
    
    ADD add (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(addVal),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(),            // output wire s_axis_a_tready
      .s_axis_a_tdata(addA),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(addVal),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(),            // output wire s_axis_b_tready
      .s_axis_b_tdata(addB),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(addReady),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(addVal),  // input wire m_axis_result_tready
      .m_axis_result_tdata(sum)    // output wire [31 : 0] m_axis_result_tdata
    );
endmodule
