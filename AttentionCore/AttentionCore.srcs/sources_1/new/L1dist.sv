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
    input logic [DATA_WIDTH-1:0] A[0:MAX_H-1], B[0:MAX_H-1],
    input logic [$clog2(MAX_H)-1:0] H,
    
    output logic done,
    output logic [DATA_WIDTH-1:0] c
    );
    
    logic [$clog2(MAX_H):0] cnt;
    logic fusedVal,fusedDone,valBuff;
    logic [DATA_WIDTH-1:0] fusedA,fusedB,fusedC,fusedOut;
    
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
        if(!done)begin
            
//            if(val) cnt<=1; 
            
            if(cnt!=0)begin
                if(fusedVal) cnt<=cnt+1;
            end    
        end
        
        valBuff<=val;
        if(val)begin
            done<=0;
            cnt<=1;
        end
        
        else if(cnt==H+1) done<=1;
    end
    
    always_comb begin
        
//        if(val) done=0;
        
//        if(!done)begin
            if(valBuff || fusedDone) fusedVal=1;
            else fusedVal=0; 
//        end
        
        if(cnt==1) fusedC=zero;
        else fusedC=fusedOut;
        
        fusedA=A[cnt-1];
        fusedB=B[cnt-1];
        
//        if(done)begin
            c=fusedOut;
//                done=1;
//        end
    end
    
endmodule
