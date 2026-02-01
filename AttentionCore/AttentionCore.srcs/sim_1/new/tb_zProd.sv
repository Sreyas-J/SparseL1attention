`timescale 1ns / 1ps

module zProd_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter MAX_H = 2;      // Reduced for faster simulation
    parameter MAX_W = 4;     // Reduced for faster simulation
    parameter GRPS = MAX_W * 2 / MAX_H; // Results in 8

    // Inputs
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] S [0:MAX_W*2-1];
    logic [DATA_WIDTH-1:0] V [0:MAX_H-1];

    // Outputs
    logic [DATA_WIDTH-1:0] prod [0:GRPS-1][0:MAX_H-1];
    logic done;

    // Instantiate the Unit Under Test (UUT)
    zProd #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .MAX_W(MAX_W)
    ) uut (
        .clk(clk),
        .val(val),
        .S(S),
        .V(V),
        .prod(prod),
        .done(done)
    );

    // Clock Generation (100MHz)
    always #5 clk = ~clk;

    // Task to initialize arrays
    initial begin
        // Initialize signals
        clk = 0;
        val = 0;
        
        // Fill V and S with dummy floating point data
        for (int i = 0; i < MAX_W*2; i++) begin
            V[i] = $shortrealtobits(1.5 + i); // Example: 1.5, 2.5, 3.5...
//            for (int j = 0; j < MAX_H ; j++) begin
            S[i]= $shortrealtobits(0.5 * i);
//            end
        end

        // Reset Wait
        #50;

        // Start Multiplication Process
        @(posedge clk);
        val <= 1;
//        $display("Starting zProd calculation...");

        // Hold val high until done is asserted
        wait(done);
        
        // De-assert val
        @(posedge clk);
        val <= 0;

//        $display("Calculation complete. Checking a sample result:");
        // Display a sample result from the first group/first element
//        $display("prod[0][0] = %h (bits)", prod[0][0]);
        
        #100;
        $finish;
    end
endmodule