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
    parameter N='d2,
    parameter M='d4,
    
    parameter zero=$shortrealtobits(0.0)
)(
    input logic clk,we,reset,
    input logic [$clog2(MAX_H)-1:0] QKaddr,
    input logic [$clog2(M)-1:0] Vaddr,
    input logic [$clog2(M)-1:0] VI_in,
    input logic [DATA_WIDTH-1:0] Q,K,V,
    input logic [$clog2(MAX_H):0] H,
    input logic [$clog2(MAX_W*2):0] W,
    
    output logic [DATA_WIDTH-1:0] out [0:MAX_H-1],
    output logic sDone,Vdone,done
    );
    
    localparam GRPS=MAX_W*2/MAX_H;
//    localparam DIV_LATENCY=8;
//    localparam int DIVS = (MAX_H + DIV_LATENCY - 1) / DIV_LATENCY;
//    localparam int DIVS_BITS = (DIVS == 0) ? 1 : $clog2(DIVS + 1);
    
    logic attVal,vVal,zSumVal,rsVal,QKen,Ven,Zen,QKwe[0:MAX_W*2-1],Vwe[0:MAX_W*2-1],Zwe,Qwe,Zflg,zSumdone,RSdone,QupdateFlg,KupdateFlg,VupdateFlg;
    logic [$clog2(MAX_H)-1:0] wZaddr,rZaddr[0:MAX_W*2-1],Zaddr[0:MAX_W*2-1],Qaddra,Qaddr;
    logic [MAX_H-1:0] divVal;
    logic [$clog2(MAX_W*2):0] cnt;
    logic [$clog2(MAX_H)-1:0] Vaddra,VIaddra,VIaddr;
    logic [$clog2(MAX_H)*2:0] Heff;
    logic [$clog2(M)-1:0] VI_out[0:MAX_W*2-1];
    
    typedef enum logic [1:0] {
        IDLE,
        LOAD,
//        QK,
//        SV,
        EXEC,
        DONE
    } fsm_state_t;
    
    fsm_state_t fsm;
    logic [DATA_WIDTH-1:0] scale,s[0:MAX_W*2-1],Vdouta[0:MAX_W*2-1],Qout,prod[0:MAX_W*2-1],Zdout[0:MAX_W*2-1],zSum[0:MAX_H-1],Ssum;
    
    Q q (
      .clka(clk),    // input wire clka
      .ena(QKen),      // input wire ena
      .wea(Qwe),      // input wire [0 : 0] wea
      .addra(Qaddra),  // input wire [1 : 0] addra
      .dina(Q),    // input wire [31 : 0] dina
      .douta(Qout)  // output wire [31 : 0] douta
    );
    
    
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
                    .H(H),
                    .scale(scale),
                    .addr(QKaddr),
                    .Qout(Qout),
                    .Kin(K),
                    .s(s[i]),
                    .Qaddra(),
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
            
            Vi v_i (
              .clka(clk),    // input wire clka
              .ena(1'b1),      // input wire ena
              .wea(Vwe[i]),      // input wire [0 : 0] wea
              .addra(VIaddra),  // input wire [1 : 0] addra
              .dina(VI_in),    // input wire [1 : 0] dina
              .douta(VI_out[i])  // output wire [1 : 0] douta
            );
            
            Z z (
              .clka(clk),    // input wire clka
              .ena(Zen),      // input wire ena
              .wea(Zwe),      // input wire [0 : 0] wea
              .addra(Zaddr[i]),  // input wire [1 : 0] addra
              .dina(prod[i]),    // input wire [31 : 0] dina
              .douta(Zdout[i])  // output wire [31 : 0] douta
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
        .H(H),
        .scale(scale),
        .addr(QKaddr),
        .Qout(Qout),
        .Kin(K),
        .s(s[MAX_W*2-1]),
        .Qaddra(Qaddr),
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
        .H(Heff[$clog2(MAX_H):0]),
        .addr(VAddr),
        .prod(prod),
        .done(Vdone)
    );
    
    zRed #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W),
        .MAX_H(MAX_H),
        .zero(zero)
    ) zRed (
        .clk(clk),
        .val(zSumVal),
        .Z(Zdout),
        .H(H),
        .Zaddr(rZaddr),
        .res(zSum),
        .done(zSumdone)
    );
    
    
    rowSum #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W),
        .MAX_H(MAX_H)
    ) rowSum1 (
        .clk(clk),
        .val(rsVal),
        .dataIn(s),
        .H(H),
        .sum(Ssum),
        .done(RSdone)
    );
    
    for(i=0;i<MAX_H-1;i++)begin
        DIV div (
          .aclk(clk),                                  // input wire aclk
          .s_axis_a_tvalid(divVal[i]),            // input wire s_axis_a_tvalid
          .s_axis_a_tready(),            // output wire s_axis_a_tready
          .s_axis_a_tdata(zSum[i]),              // input wire [31 : 0] s_axis_a_tdata
          .s_axis_b_tvalid(divVal[i]),            // input wire s_axis_b_tvalid
          .s_axis_b_tready(),            // output wire s_axis_b_tready
          .s_axis_b_tdata(Ssum),              // input wire [31 : 0] s_axis_b_tdata
          .m_axis_result_tvalid(),  // output wire m_axis_result_tvalid
          .m_axis_result_tready(divVal[i]),  // input wire m_axis_result_tready
          .m_axis_result_tdata(out[i])    // output wire [31 : 0] m_axis_result_tdata
        );
    end
    DIV div (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(divVal[MAX_H-1]),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(),            // output wire s_axis_a_tready
      .s_axis_a_tdata(zSum[MAX_H-1]),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(divVal[MAX_H-1]),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(),            // output wire s_axis_b_tready
      .s_axis_b_tdata(Ssum),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(done),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(divVal[MAX_H-1]),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out[MAX_H-1])    // output wire [31 : 0] m_axis_result_tdata
    );
    
    always_ff@(posedge clk)begin
        if(reset)begin
            cnt<=0;
            
            fsm<=IDLE;
            QupdateFlg<=0;
            KupdateFlg<=0;
            VupdateFlg<=0;
            Zflg<=0;
            zSumVal<=0;
            divVal<=0;
            
            wZaddr<=0;
            VIaddr<=H;
        end
        else begin
            if(fsm==IDLE)begin
                fsm<=LOAD;
                QupdateFlg<=1;
            end

        end
//        if(fsm==LOAD && ~QupdateFlg) QupdateFlg<=1;
        if(fsm!=IDLE)begin
            QKen<=1;
            Ven<=1;
        end
        
//        if(fsm==LOAD)begin
//            if(QKaddr==H-1 && ~QupdateFlg) cnt<=cnt+1;
//        end
        
        if(sDone)begin
//            QKen<=0;
            vVal<=1;
            Zen<=1;
            rsVal<=1;
        end
        if(Vdone)begin
            Ven<=0;
            Zflg<=1;         
        end
        if(zSumdone) divVal[0]<=1;
        if(done)begin
            divVal<=0;
            attVal<=1;
            done<=0;
        end
        
        if(wZaddr==Heff-1)begin
            Zflg<=0;
            wZaddr<=0;
            zSumVal<=1;
        end
        else if(Zwe) wZaddr<=wZaddr+1;
        
        if(VAddr==H) VIaddr<=0;
        if(VIaddr<H) VIaddr<=VIaddr+1;
        
        if(vVal) vVal<=0;
        if(attVal) attVal<=0;
        if(zSumVal) zSumVal<=0;
        if(rsVal) rsVal<=0;
        if(divVal>0) divVal<=divVal<<1;
        
        
        if(sDone) QupdateFlg<=1;
        if(QupdateFlg && Qaddra==H-1)begin
            QupdateFlg<=0;
            KupdateFlg<=1;
        end

        if(KupdateFlg)begin                           
            if(fsm==EXEC && QKaddr==H-1)begin
                KupdateFlg<=0;
                VupdateFlg<=1;
            end
            
            if(fsm==LOAD)begin                        
                if(QKaddr==H-1) cnt<=cnt+1;
            
                if(cnt==W*2)begin
                    KupdateFlg<=0;
                    VupdateFlg<=1;
                    cnt<=0;
                end
            end
        end
            
        if(VupdateFlg)begin
            if(fsm==EXEC && Vaddr==Heff-1)begin
                VupdateFlg<=0;
                cnt<=cnt+1;
            end
            
            if(fsm==LOAD)begin
                if(Vaddr==Heff-1) cnt<=cnt+1;
                
                if(cnt==W*2)begin
                    VupdateFlg<=0;
                    attVal<=1;
                    fsm<=EXEC;
                    cnt<=0;
                end
            end
        end
    end
    
    always_comb begin
        Heff=H*N/M;

        Zwe=Vdone || Zflg;
        
        if(Zwe)begin
            for(int i=0;i<MAX_W*2;i++)begin
                Zaddr[i]=( { {$clog2(MAX_H){1'b0}},wZaddr}*N)/M+VI_out[i];
            end
        end
        else begin
            for(int i=0;i<MAX_W*2;i++)begin
                Zaddr[i]=rZaddr[i];
            end
        end  
        scale=SCALE;
        
        //Q
        if(QupdateFlg || sDone)begin
            Qaddra=QKaddr;
            Qwe=1'b1;
        end
        else begin
            Qwe=1'b0;
            Qaddra=Qaddr;
        end
        
        
        //K
        if(KupdateFlg)begin
            for(int i=0;i<MAX_W*2;i++)begin
                if(i==cnt)begin
                    QKwe[i]=1;
                end
                else begin
                    QKwe[i]=0;
                end
            end
        end
        else begin
            for(int i=0;i<MAX_W*2;i++)begin
                QKwe[i]=0;
            end
        end
        
        //V
        if(VupdateFlg)begin
            Vaddra=Vaddr;
            VIaddra=Vaddra;
            
            for(int i=0;i<MAX_W*2;i++)begin
                if(i==cnt)begin
                    Vwe[i]=1;
                end
                else begin
                    Vwe[i]=0;
                end
            end
        end
        else begin
            Vaddra=VAddr;
            VIaddra=VIaddr;
            
            for(int i=0;i<MAX_W*2;i++)begin
                Vwe[i]=0;
            end
        end
        
    end
endmodule
