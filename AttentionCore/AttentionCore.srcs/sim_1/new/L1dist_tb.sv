`timescale 1ns / 1ps

module L1dist_tb;

    // 1. Parameters
    parameter DATA_WIDTH = 32;
    parameter H=4;

    // 2. Signals
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] A [0:H-1],B [0:H-1];
    
    logic [DATA_WIDTH-1:0] c;
    logic done;

    // 3. Instantiate the Unit Under Test (UUT)
//    fusedAcc#(
//    .DATA_WIDTH(DATA_WIDTH)
//    ) uut (
//        .clk(clk),
//        .val(val),
//        .a(a),
//        .b(b),
//        .c(c),
//        .done(done),
//        .out(out)
//    );
    
    L1dist#(
        .DATA_WIDTH(DATA_WIDTH),
        .H(H)
        
//        parameter zero=$shortrealtobits(0.0)
    ) uut (
        .clk(clk),
        .val(val),
        .A(A),
        .B(B),
        
        .done(done),
        .c(c)
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
        
        for(int i=0;i<H;i++)begin
            A[i] = 0; B[i] = 0;
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
            A[i]   <= $shortrealtobits(10.0-i);
            B[i]   <= $shortrealtobits(2.0+i);
        end
        val <= 1'b1;
        
        @(posedge clk);
        val <= 0; 
        
        // ---------------------------------------------------------
        // Test Case 2: Change inputs (q=3, k=2, v=1.5)
        // ---------------------------------------------------------
        wait(done);
        @(posedge clk);
        
        for(int i=0;i<H;i++)begin
            A[i]   <= $shortrealtobits(3.0+i);
            B[i]   <= $shortrealtobits(2.0+i);
        end
        val<=1;
//        // val stays 1
        
//        // ---------------------------------------------------------
//        // Test Case 3: Change inputs again
//        // ---------------------------------------------------------
//        @(posedge clk);
//        for(int i=0;i<H;i++)begin
//            A[i]   <= $shortrealtobits(2.0+i);
//            B[i]   <= $shortrealtobits(1.5+i);
//        end
        
        // End Valid pulse
         @(posedge clk);
        val <= 0; 

        // Wait for results
        wait(done);
        repeat(20) @(posedge clk);
        
        $finish;
    end

endmodule
