`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2026 06:05:15 PM
// Design Name: 
// Module Name: zProd
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


module zProd#(
    parameter DATA_WIDTH=32,
    parameter MAX_H=64,
    parameter MAX_W=256
    
//    parameter GRPS=MAX_W*2/MAX_H
)(
    input logic clk,val,
    input logic [DATA_WIDTH-1:0] S [0:MAX_W*2-1],V[0:MAX_W*2-1],
    input logic [$clog2(MAX_H):0] H,
    
    output logic [$clog2(MAX_H)-1:0] addr,
    output logic [DATA_WIDTH-1:0] prod[0:MAX_W*2-1],
    output logic done
    );
    
    logic [$clog2(MAX_W*2):0] cnt;
    logic ready[0:MAX_W*2-1],readyBuff,startFlg,mulVal;
//    logic [DATA_WIDTH-1:0] prodB [0:GRPS-1][0:MAX_H-1];
    
    genvar i;
    generate
        for(i=0;i<MAX_W*2;i++)begin
//            for(j=0;j<2;j++)begin
                MUL mul (
                  .aclk(clk),                                  // input wire aclk
                  .s_axis_a_tvalid(mulVal),            // input wire s_axis_a_tvalid
                  .s_axis_a_tready(),            // output wire s_axis_a_tready
                  .s_axis_a_tdata(V[i]),              // input wire [31 : 0] s_axis_a_tdata
                  .s_axis_b_tvalid(mulVal),            // input wire s_axis_b_tvalid
                  .s_axis_b_tready(),            // output wire s_axis_b_tready
                  .s_axis_b_tdata(S[i]),              // input wire [31 : 0] s_axis_b_tdata
                  .m_axis_result_tvalid(ready[i]),  // output wire m_axis_result_tvalid
                  .m_axis_result_tready(mulVal),  // input wire m_axis_result_tready
                  .m_axis_result_tdata(prod[i])    // output wire [31 : 0] m_axis_result_tdata
                );
            end
//        end
    endgenerate
    
    always_ff@(posedge clk)begin
        readyBuff<=ready[0];
        if(!val && !startFlg)begin
            done<=0;
            cnt<=0;
        end
        if(val) cnt<=1;
        
        if(cnt==H+1) done<=1;
        else if(cnt>0) cnt<=cnt+1; 
        
        if(done)begin
            cnt<=0;
            done<=0;
        end
    end 
    
    always_comb begin
        if(val) addr=0;
       else addr=cnt[$clog2(MAX_H)-1:0];
        
       if(cnt>0) startFlg=1;
       else startFlg=0;
       
       mulVal=val || startFlg;
    end
    
endmodule
