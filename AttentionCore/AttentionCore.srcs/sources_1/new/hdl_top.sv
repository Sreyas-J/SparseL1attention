`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2026 03:12:19 PM
// Design Name: 
// Module Name: hdl_top
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


module hdl_top#(
    parameter DATA_WIDTH=32,
    parameter MAX_W=256,
    parameter MAX_H=64,
    parameter SCALE=$shortrealtobits(-3.0),
    
    parameter zero=$shortrealtobits(0.0)
)(
    input logic clk,we,reset,
    input logic [$clog2(MAX_H)-1:0] QKaddr,
    input logic [DATA_WIDTH-1:0] Q,K,V,
    input logic [$clog2(MAX_H):0] H,
    input logic [$clog2(MAX_W*2):0] W,
    
    output logic sDone,Vdone
    );
    
    logic attVal,vVal,QKen,Ven,QKwe[0:MAX_W*2-1],Vwe[0:MAX_W*2-1];
    logic [$clog2(MAX_H)-1:0] VAddr;
    logic [$clog2(MAX_W*2):0] cnt;
    logic [$clog2(MAX_H)-1:0] Vaddra;
    
    typedef enum logic [1:0] {
        IDLE,
        LOAD,
//        QK,
//        SV,
        EXEC,
        DONE
    } fsm_state_t;
    
    fsm_state_t fsm;
    logic [DATA_WIDTH-1:0] scale,s[0:MAX_W*2-1],Vdouta[0:MAX_W*2-1],prod[0:MAX_W*2-1];
    
//    logic [DATA_WIDTH-1:0] Qin[0:MAX_W*2-1],Kin[0:MAX_W*2-1];
    
    genvar i;
    generate
        for(i=0;i<MAX_W*2;i++)begin
        
            if(i!=MAX_W*2-1)begin
                AttentionCore #(
                    .DATA_WIDTH(DATA_WIDTH),
                    .MAX_H(MAX_H),
                    .zero(zero)
                ) Attention (
                    .clk(clk),
                    .val(attVal),
                    .en(QKen),
                    .we(QKwe[i]),
                    .addr(QKaddr), // Updated port connection
                    .Qin(Q),
                    .Kin(K), 
                    .H(H),
                    .scale(scale),
                    .s(s[i]),
                    .sDone()
                );
            end
            
            V v (
              .clka(clk),    // input wire clka
              .ena(Ven),      // input wire ena
              .wea(Vwe[i]),      // input wire [0 : 0] wea
              .addra(Vaddra),  // input wire [1 : 0] addra
              .dina(V),    // input wire [31 : 0] dina
              .douta(Vdouta[i])  // output wire [31 : 0] douta
            );
        end
    endgenerate
    
    AttentionCore #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .zero(zero)
    ) Attention (
        .clk(clk),
        .val(attVal),
        .en(QKen),
        .we(QKwe[MAX_W*2-1]),
        .addr(QKaddr),
        .Qin(Q),
        .Kin(K), 
        .H(H),
        .scale(scale),
        .s(s[MAX_W*2-1]),
        .sDone(sDone)
    );    
    
    zProd #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .MAX_W(MAX_W)
    ) zProd (
        .clk(clk),
        .val(vVal),
        .S(s),
        .V(Vdouta),
        .H(H),
        .addr(VAddr),
        .prod(prod),
        .done(Vdone)
    );
    
    always_ff@(posedge clk)begin
        if(reset)begin
            cnt<=0;
            fsm<=IDLE;
        end
        else begin
            if(fsm==IDLE) fsm<=LOAD;
            if(fsm==LOAD && cnt==MAX_W*2)begin
                fsm<=EXEC;
                cnt<=0;
                
                attVal<=1;
            end
//            if(fsm==QK && sDone)begin
//                fsm<=SV;
//            end
        end
        if(fsm!=IDLE)begin
            QKen<=1;
            Ven<=1;
        end
        
        if(fsm==LOAD)begin
            if(QKaddr==H-1) cnt<=cnt+1;
        end
        
        if(sDone)begin
            QKen<=0;
            vVal<=1;
        end
        if(Vdone) Ven<=0;
        
        if(vVal) vVal<=0;
        if(attVal) attVal<=0;
    end
    
    always_comb begin
        if(fsm==LOAD) Vaddra=QKaddr;
        else Vaddra=VAddr;
//        else Vaddra=0;
        
        scale=SCALE;
        
        if(we)begin
            for(int i=0;i<MAX_W*2;i++)begin
                if(i==cnt)begin
                    QKwe[i]=1;
                    Vwe[i]=1;
                end
                else begin
                    QKwe[i]=0;
                    Vwe[i]=0;
                end
            end
        end
        
    end
endmodule
