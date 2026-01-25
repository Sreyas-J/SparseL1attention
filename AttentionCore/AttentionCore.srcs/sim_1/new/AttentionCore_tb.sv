`timescale 1ns / 1ps

module tb_AttentionCore;

    // 1. Parameters
    parameter DATA_WIDTH = 32;
    parameter MAX_H=64;

    // 2. Signals
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] q[0:MAX_H-1], k[0:MAX_H-1], v[0:MAX_H-1];
    logic [$clog2(MAX_H):0] H;
    
    logic [DATA_WIDTH-1:0] s, z[0:MAX_H-1],scale;
    logic sDone,zDone;

    // 3. Instantiate the Unit Under Test (UUT)
    AttentionCore #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H)
    ) uut (
        .clk(clk),
        .val(val),
        .q(q),
        .k(k),
        .v(v),
        .H(H),
        .scale(scale),
        
        .s(s),
        .z(z),
        .sDone(sDone),
        .zDone(zDone)
    );

    // 4. Clock Generation (10ns period -> 100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 5. Stimulus
    initial begin
        // Initialize Inputs
        val = 0;
        H=4;
        scale=$shortrealtobits(-3.0);
        
        for(int i=0;i<H;i++)begin
            q[i] = 0; k[i] = 0; v[i] = 0;
        end

        // Wait for global reset
        repeat(5) @(posedge clk);
        $display("--- Simulation Start ---");

        // ---------------------------------------------------------
        // Test Case 1: Simple Inputs (q=10, k=2, v=5)
        // ---------------------------------------------------------
        
        // Align to clock edge
        @(posedge clk); 
        // Use Non-Blocking Assignments (<=) to avoid race conditions
        
        for(int i=0;i<H;i++)begin
            q[i]   <= $shortrealtobits(8.0-i);
            k[i]   <= $shortrealtobits(2.0+i);
            v[i]   <= $shortrealtobits(5.0-i);
        end
        val <= 1'b1;
        
        @(posedge clk);
        val <= 0; 
        
        // ---------------------------------------------------------
        // Test Case 2: Change inputs (q=3, k=2, v=1.5)
        // ---------------------------------------------------------
        wait(zDone);
        @(posedge clk);
        
        for(int i=0;i<H;i++)begin
            q[i]   <= $shortrealtobits(3.0+i);
            k[i]   <= $shortrealtobits(2.0+i);
            v[i]   <= $shortrealtobits(0.5+i);
        end
        val <= 1'b1;
        
        @(posedge clk);
        val <= 0; 

        // Wait for results
        wait(zDone);
        repeat(20) @(posedge clk);
        
        $finish;
    end

endmodule
