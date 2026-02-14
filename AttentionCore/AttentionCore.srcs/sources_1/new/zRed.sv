`timescale 1ns / 1ps

module zRed#(
    parameter DATA_WIDTH=32,
    parameter MAX_W=256,  
    parameter MAX_H=64,
    
    parameter zero=$shortrealtobits(0.0),
    
    parameter GRPS=MAX_W*2/MAX_H
)(
    input logic clk,val,    
    input logic [DATA_WIDTH-1:0] Z [0:MAX_W*2-1],
    input logic [$clog2(MAX_H):0] H,
    output logic [$clog2(MAX_H)-1:0] Zaddr[0:MAX_W*2-1],
    output logic [DATA_WIDTH-1:0] res[0:MAX_H-1],
    output logic done
    );

    logic [DATA_WIDTH-1:0] zRed1 [0:GRPS-1][0:MAX_H-1],zRed2In [0:MAX_H-1];
    logic [$clog2(MAX_H+MAX_W*2)-1:0] addr;
    logic valFlg[0:GRPS-1][0:MAX_H-1],zRed1Flg[0:GRPS-1][0:MAX_H-1];
    logic [$clog2(MAX_H):0] cnt;
    logic [$clog2(MAX_W*2)-1:0] Zaccess [0:GRPS-1][0:MAX_H-1];

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
                    .val(valFlg[i][j]),
                    .dataIn(Z[Zaccess[i][j]]),
                    .count(H),
                    
                    .cnt(),
                    .acc(zRed1[i][j]),
                    .done(zRed1Flg[i][j])
                );
            end
        end
    endgenerate
    
    Accumulator #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(GRPS),
        .zero(zero)
    )acc(
        .clk(clk), 
        .val(zRed1Flg[0][0]),
        .dataIn(zRed2In[0]),
        .count(GRPS),
        
        .cnt(),
        .acc(res[0]),
        .done(done)
    );
    
    generate
        for(i=1;i<MAX_H;i++)begin
            Accumulator #(
                .DATA_WIDTH(DATA_WIDTH),
                .MAX_H(GRPS),
                .zero(zero)
            )acc2(
                .clk(clk), 
                .val(zRed1Flg[0][i]),
                .dataIn(zRed2In[i]),
                .count(GRPS),
                
                .cnt(),
                .acc(res[i]),
                .done()
            );
        end
    endgenerate 
    
    always_comb begin
        for(int i=0;i<MAX_H;i++)begin
            // FIX 1: Cast cnt to signed. 
            // {1'b0, cnt} zero-extends it to prevent MSB interpretation as sign bit.
            zRed2In[i] = zRed1[$signed({1'b0, cnt}) - i - 1][i];
        end
        
        for(int i=0;i<GRPS;i++)begin
            for(int j=0;j<MAX_H;j++)begin
            // FIX 2: Cast addr to signed for comparison and subtraction
                if($signed({1'b0, addr}) >= j) 
                    Zaddr[i*MAX_H+j] = $signed({1'b0, addr}) - j;
                else 
                    Zaddr[i*MAX_H+j] = 0;
             end
        end
        
        for(int i=0;i<MAX_H;i++)begin
            for(int j=0;j<GRPS;j++)begin
                // FIX 3: Cast addr to signed for equality check
                if($signed({1'b0, addr}) == i + 2) 
                    valFlg[j][i] = 1;
                else 
                    valFlg[j][i] = 0;
                
                // CRITICAL FIX 4: Ensure the subtraction result can be negative!
                // Previously, (unsigned - signed) logic wrapped around to a huge positive number.
                if(j*MAX_H + $signed({1'b0, addr}) - i - 2 >= 0) 
                    Zaccess[j][i] = j*MAX_H + $signed({1'b0, addr}) - i - 2;
                else 
                    Zaccess[j][i] = 0;
            end
        end
        
    end
    
    always_ff @(posedge clk) begin
    
        if(val) begin
            addr <= 0;
            cnt <= 0;
        end
        else addr <= addr + 1;
        
        // FIX 5: Switched to Non-Blocking assignments (<=) for sequential logic logic
        if(zRed1Flg[0][0]) cnt <= 1;
        else if(cnt > 0) cnt <= cnt + 1;
    end
    
endmodule