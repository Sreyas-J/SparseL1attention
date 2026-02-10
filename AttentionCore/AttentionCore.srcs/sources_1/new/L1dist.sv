`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2026 05:53:03 PM
// Design Name: 
// Module Name: dotProduct
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


module L1dist#(
    parameter DATA_WIDTH=32,
    parameter MAX_H=64,
    
    parameter zero=$shortrealtobits(0.0)
)(
    input logic clk,val,
    input logic [DATA_WIDTH-1:0] A, B,
    input logic [$clog2(MAX_H):0] H,
    
    output logic [$clog2(MAX_H)-1:0] slicedCnt,
    output logic done,
    output logic [DATA_WIDTH-1:0] c
    );
    
    logic fusedVal,fusedDone,valBuff,flg;
    logic [DATA_WIDTH-1:0] fusedA,fusedB,fusedC,fusedOut;
    logic [$clog2(MAX_H):0] cnt;
    
    fusedAcc#(
    .DATA_WIDTH(DATA_WIDTH)
    ) uut (
        .clk(clk),
        .val(fusedVal),
        .a(fusedA),
        .b(fusedB),
        .c(fusedC),
        .done(fusedDone),
        .out(fusedOut)
    );
    
    always_ff@(posedge clk)begin
//        if(!done)begin            
//            if(cnt!=0 || valBuff)begin
                if(fusedVal) cnt<=cnt+1;
//            end    
//        end
        
        valBuff<=val;
        if(val)begin
            done<=0;
            cnt<=0;
            flg<=0;
        end     
        else if(cnt==H+1) done<=1;
        
        if(cnt==H-1)flg<=1;
        
        if(done)begin
            done<=0;
            cnt<=0;
        end
    end
    
    always_comb begin

        if(valBuff || fusedDone && !done) fusedVal=1;
        else fusedVal=0; 
        
        if(valBuff) fusedC=zero;
        else fusedC=fusedOut;
        
        fusedA=A;
        fusedB=B;

        c=fusedOut;
        
        slicedCnt=cnt[$clog2(MAX_H)-1:0];

    end
    
endmodule
