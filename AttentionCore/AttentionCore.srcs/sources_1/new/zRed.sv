`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2026 06:45:56 PM
// Design Name: 
// Module Name: zRed
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


module zRed#(
    parameter DATA_WIDTH=32,
    parameter MAX_W=256,  
    parameter MAX_H=64,
    
    parameter zero=$shortrealtobits(0.0),
    
    parameter GRPS=MAX_W*2/MAX_H
//    parameter ACCUMULATORS=GRPS 
)(
    input logic clk,val,
    
//    (* dont_touch = "true" *) 
    input logic [DATA_WIDTH-1:0] Z [0:GRPS-1][0:MAX_H-1],
    input logic [$clog2(MAX_H):0] H,
//    input logic [$clog2(MAX_H)+$clog2(MAX_W)+1:0] grps,
//    input logic [$clog2(MAX_W):0] W,
    
    output logic [DATA_WIDTH-1:0] res[0:MAX_H-1],
    output logic done
    );

    logic [DATA_WIDTH-1:0] zRed1 [0:GRPS-1][0:MAX_H-1],zRed2In [0:MAX_H-1];
//    zRed2in [0:MAX_H-1];
    logic zRed1Flg[0:GRPS-1][0:MAX_H-1],zRed2Flg;
    logic [$clog2(GRPS):0] cnt;

    genvar i,j;
    generate
        for(i=0;i<GRPS;i++)begin
            for(j=0;j<MAX_H;j++)begin
                Accumulator #(
                    .DATA_WIDTH(DATA_WIDTH),
                    .MAX_H(MAX_H),
                    .zero(zero)
                )acc1(
                    .clk(clk), 
                    .val(val),
                    .dataIn(Z[i][j]),
                    .count(H),
                    
                    .cnt(),
                    .acc(zRed1[i][j]),
                    .done(zRed1Flg[i][j])
                );
            end
        end
    endgenerate
    
    generate
        for(i=0;i<MAX_H-1;i++)begin
            Accumulator #(
                .DATA_WIDTH(DATA_WIDTH),
                .MAX_H(GRPS),
                .zero(zero)
            )acc2(
                .clk(clk), 
                .val(zRed2Flg),
                .dataIn(zRed2In[i]),
                .count(GRPS),
                
                .cnt(),
                .acc(res[i]),
                .done()  // Added comma here if it was missing in your editor
            );
        end
        
        Accumulator #(
            .DATA_WIDTH(DATA_WIDTH),
            .MAX_H(GRPS),
            .zero(zero)
        )acc(
            .clk(clk), 
            .val(zRed2Flg),
            .dataIn(zRed2In[H-1]),
            .count(GRPS),
            
            .cnt(cnt),
            .acc(res[MAX_H-1]),
            .done(done)
        );
    endgenerate
    
    always_comb begin
        for(int i=0;i<MAX_H;i++)begin
            zRed2In[i]=zRed1[cnt-1][i];
        end
    end
    
    always_ff@(posedge clk)begin
        if(zRed1Flg[0][0]) zRed2Flg<=1;
        if(val || cnt==GRPS) zRed2Flg<=0;
    end
    
endmodule
