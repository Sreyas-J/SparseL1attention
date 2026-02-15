`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2026 11:50:39 AM
// Design Name: 
// Module Name: rowSum
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


module rowSum#(
    parameter DATA_WIDTH=32,
    parameter MAX_W=256,
    parameter MAX_H=64,
    parameter GRPS=MAX_W*2/MAX_H,
    
    parameter zero=$shortrealtobits(0.0)
)(

    input logic [DATA_WIDTH-1:0] dataIn [0:MAX_W*2-1],
//    input logic [$clog2(MAX_W):0] W,
    input logic [$clog2(MAX_H):0] H,
    input logic clk,val,
    
    output logic [DATA_WIDTH-1:0] sum,
    output logic done
    );
    
    logic [DATA_WIDTH-1:0] rowSum1 [0:GRPS-1],rowSum2In;
    logic rowSum1Flg,rowSum2Flg;
    logic [$clog2(GRPS):0] cnt;
    logic [$clog2(MAX_H):0] cnt1;
    
    genvar i;
    generate
    for(i=0;i<GRPS-1;i++)begin
        Accumulator #(
            .DATA_WIDTH(DATA_WIDTH),
            .MAX_H(MAX_H),
            .zero(zero)
        )acc1(
            .clk(clk), 
            .val(val),
            .dataIn(dataIn[i*MAX_H+cnt1-1]),
            .count(H),
            
            .cnt(),
            .acc(rowSum1[i]),
            .done()
        );
    end
    endgenerate
    Accumulator #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .zero(zero)
    )acc1(
        .clk(clk), 
        .val(val),
        .dataIn(dataIn[(GRPS-1)*MAX_H+cnt1-1]),
        .count(H),
        
        .cnt(cnt1),
        .acc(rowSum1[GRPS-1]),
        .done(rowSum1Flg)
    );
    
    Accumulator #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(GRPS),
        .zero(zero)
    )acc(
        .clk(clk), 
        .val(rowSum2Flg),
        .dataIn(rowSum2In),
        .count(GRPS),
        
        .cnt(cnt),
        .acc(sum),
        .done(done)
    );
    
    always_comb begin
        rowSum2In=rowSum1[cnt-1];
        
    end
    
    always_ff@(posedge clk)begin
        if(rowSum1Flg) rowSum2Flg<=1;
        if(val || rowSum2Flg) rowSum2Flg<=0;
    end
endmodule
