`timescale 1ns / 1ps

module fusedAcc_tb;

    // 1. Parameters
    parameter DATA_WIDTH = 32;

    // 2. Signals
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] a,b,c;
    
    logic [DATA_WIDTH-1:0] out;
    logic done;

    // 3. Instantiate the Unit Under Test (UUT)
    fusedAcc#(
    .DATA_WIDTH(DATA_WIDTH)
    ) uut (
        .clk(clk),
        .val(val),
        .a(a),
        .b(b),
        .c(c),
        .done(done),
        .out(out)
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
        
        a=0; b=0; c=0;

        // Wait for global reset
        repeat(5) @(posedge clk);
        $display("--- Simulation Start ---");

        // ---------------------------------------------------------
        // Test Case 1: Simple Inputs (q=10, k=2, v=5)
        // ---------------------------------------------------------
        
        // Align to clock edge
        @(posedge clk); 
        // Use Non-Blocking Assignments (<=) to avoid race conditions
        a<=$shortrealtobits(10.0);
        b<=$shortrealtobits(2.0);
        c<=$shortrealtobits(5.0);
        val <= 1'b1;
        
        // ---------------------------------------------------------
        // Test Case 2: Change inputs (q=3, k=2, v=1.5)
        // ---------------------------------------------------------
        @(posedge clk);
        
        a<=$shortrealtobits(3.0);
        b<=$shortrealtobits(2.0);
        c<=$shortrealtobits(1.5);
        // val stays 1
        
        // End Valid pulse
        @(posedge clk);
        val <= 0; 

        // Wait for results
        wait(done);
        repeat(10) @(posedge clk);
        
        $finish;
    end

endmodule
