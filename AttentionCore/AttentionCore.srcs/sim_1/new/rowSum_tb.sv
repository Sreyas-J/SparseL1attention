`timescale 1ns / 1ps

module rowSum_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter MAX_W = 16;
    parameter MAX_H = 4;
    parameter GRPS = MAX_W * 2 / MAX_H; // Results in 8
    
    // Inputs
    logic clk;
    logic val;
    shortreal Z [0:MAX_W*2-1];
    logic [$clog2(MAX_H):0] H;
    logic [DATA_WIDTH-1:0] dataIn [0:MAX_W*2-1];
    
    // Outputs
    logic [DATA_WIDTH-1:0] res;
    logic done;

    // Instantiate UUT
    rowSum #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W),
        .MAX_H(MAX_H)
    ) uut (
        .clk(clk),
        .val(val),
        .dataIn(dataIn),
        .H(H),
        .sum(res),
        .done(done)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        val = 0;
        H = MAX_H;
        
        // Initialize Z to zero
        for (int i = 0; i < MAX_W*2; i++) begin
            dataIn[i] = '0;
        end
        
        // Initialize the helper array with floating point values
        for (int i = 0; i < MAX_W*2; i++) begin

                Z[i] = shortreal'(i);
        end

        #20;

        // Start the process
        @(posedge clk);
        val <= 1;
        @(posedge clk);
        val<=0;
        
        // Feed the data slice by slice
        for (int i = 0; i < MAX_W*2; i++) begin
//            for (int i = 0; i < GRPS; i++) begin
                    // Convert the real value to bits for the logic input
            dataIn[i] <= $shortrealtobits(Z[i]);
        end
//            @(posedge clk);
//        end

        // Wait for completion
        wait(done);

        #100;
//        $display("Simulation Finished. 'done' received.");
        $finish;
    end

endmodule