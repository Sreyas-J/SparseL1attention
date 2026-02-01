`timescale 1ns / 1ps

module zRed_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter MAX_W = 16;
    parameter MAX_H = 4;
    parameter GRPS = MAX_W * 2 / MAX_H; // Results in 8
    
    // Inputs
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] Z [0:GRPS-1][0:MAX_H-1];
    logic [$clog2(MAX_H):0] H;
    
    // Internal helper array for real number math
    shortreal M_real [0:GRPS-1][0:MAX_H-1][0:MAX_H-1];
    
    // Outputs
    logic [DATA_WIDTH-1:0] res [0:MAX_H-1];
    logic done;

    // Instantiate UUT
    zRed #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W),
        .MAX_H(MAX_H)
    ) uut (
        .clk(clk),
        .val(val),
        .Z(Z),
        .H(H),
        .res(res),
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
        for (int i = 0; i < GRPS; i++) begin
            for (int j = 0; j < MAX_H; j++) begin
                Z[i][j] = '0;
            end
        end
        
        // Initialize the helper array with floating point values
        for (int i = 0; i < GRPS; i++) begin
            for (int j = 0; j < MAX_H; j++) begin
                for(int k = 0; k < MAX_H; k++) begin
                    M_real[i][j][k] = shortreal'(i) + (0.1 * j) + (0.01 * k);
                end
            end
        end

        #20;

        // Start the process
        @(posedge clk);
        val <= 1;
        
        // Feed the data slice by slice
        for (int k = 0; k < H; k++) begin
            for (int i = 0; i < GRPS; i++) begin
                for (int j = 0; j < MAX_H; j++) begin
                    // Convert the real value to bits for the logic input
                    Z[i][j] <= $shortrealtobits(M_real[i][j][k]);
                end
            end
            @(posedge clk);
        end
        
        val <= 0;

        // Wait for completion
        wait(done);

        #100;
//        $display("Simulation Finished. 'done' received.");
        $finish;
    end

endmodule