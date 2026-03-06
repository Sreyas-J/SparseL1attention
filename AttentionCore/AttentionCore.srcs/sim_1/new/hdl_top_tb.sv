`timescale 1ns / 1ps

module tb_hdl_top();

    // -----------------------------------------
    // Parameters (Scaled down for faster sim)
    // -----------------------------------------
    parameter DATA_WIDTH = 32;
    parameter MAX_W = 4;  // Scaled down from 256
    parameter MAX_H = 4;  // Scaled down from 64
    parameter N = 2;
    parameter M = 4;

    // -----------------------------------------
    // Signals
    // -----------------------------------------
    logic clk;
    logic reset;
    logic [$clog2(MAX_H)-1:0] ADDR;
    logic [DATA_WIDTH-1:0] IN,out_slice;
    
    logic [$clog2(MAX_H):0] H;
    logic [$clog2(MAX_W*2):0] W;

    // 2-bit index for 2:4 sparsity
    logic [$clog2(M)-1:0] VI_in; 
    
    logic sDone, done;

    // -----------------------------------------
    // Unit Under Test (UUT)
    // -----------------------------------------
    hdl_top #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W),
        .MAX_H(MAX_H)
    ) uut (
        .clk(clk),
        .reset(reset),
        .ADDR(ADDR),
        .IN(IN),
        .VI_in(VI_in),
        .sDone(sDone),
        .done(done),
        .out_slice(out_slice)
    );

    // -----------------------------------------
    // Clock Generation (100MHz)
    // -----------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // -----------------------------------------
    // Main Stimulus
    // -----------------------------------------
    initial begin
        // Variables for floating point conversion
        shortreal q_float;
        shortreal k_float;
        shortreal v_float;
        int module_idx;
        
        // Variables for simultaneous sparse tracking
        int block_idx;
        int pos_in_block;
        int n_idx;
        int offset;
        int actual_pos;

        // 1. Initialize Default Values
        ADDR = 0;
        IN=0;
        VI_in = 0;
        
        H = MAX_H; 
        W = MAX_W;
        
        // 2. Drive Reset High then Low
        reset = 1;
        #50;
        @(posedge clk);
        reset = 0;
        
        // --- PHASE 4a: DENSE DATAPATH (Q ONLY) ---
//        for (module_idx = 0; module_idx < MAX_W * 2; module_idx++) begin
            for (int addr = 0; addr < H; addr++) begin
                
                ADDR = addr;
                q_float = shortreal'((module_idx * H) + addr + 1);
                IN = $shortrealtobits(q_float); 
                VI_in = 0;
 
                @(posedge clk);
            end
//        end
        // --- PHASE 4b: DENSE DATAPATH (K ONLY) ---
        for (module_idx = 0; module_idx < MAX_W * 2; module_idx++) begin
            for (int addr = 0; addr < H; addr++) begin
                ADDR = addr;
                k_float = shortreal'((module_idx * H) + addr + 2);
                IN = $shortrealtobits(k_float);
                VI_in = 0;
                
                @(posedge clk); 
            end
        end
        
        @(posedge clk); 
        // --- PHASE 4c: SPARSE DATAPATH (V ONLY) ---
        for (module_idx = 0; module_idx < MAX_W * 2; module_idx++) begin
            for (int addr = 0; addr < H; addr+=2) begin
                
                block_idx = addr / M;
                pos_in_block = addr % M;
                
                if (pos_in_block < N) begin
                    n_idx = pos_in_block; 
                end else begin
                    n_idx = N - 1; 
                end
                
                offset = n_idx * 2; 
                actual_pos = (block_idx * M) + offset;
                
                ADDR = (block_idx * N) + n_idx; 
                VI_in = offset; 
                
                v_float = shortreal'((module_idx * H) + actual_pos + 1);
                IN = $shortrealtobits(v_float);
                
                @(posedge clk); 
            end
        end

        ADDR = 0;
        IN = 0;
        VI_in = 0;

        // ---------------------------------------------------------
        // 6. Wait for sDone and Transfer New Row of Q
        // ---------------------------------------------------------
        @(posedge sDone); // Wait for the sDone pulse to arrive
        
//        we = 1; 
//        for (module_idx = 0; module_idx < MAX_W * 2; module_idx++) begin
            for (int addr = 0; addr < H; addr++) begin
                @(posedge clk); 
                // --- DENSE DATAPATH (Q ONLY) ---
                ADDR = addr;
                
                // Add a distinct offset (+1000) so the new Q row is easily visible in waveforms
                q_float = shortreal'(10 + addr + 1);
                IN = $shortrealtobits(q_float); 
                VI_in = 0;
                
            end
//        end
        @(posedge clk);
        // 7. Loading Complete for the new Q row
//        we = 0;
        ADDR = 0;
        IN = 0;
        
        for (int addr = 0; addr < H; addr++) begin
            @(posedge clk); 
            // --- DENSE DATAPATH (K ONLY) ---
            ADDR = addr;
            
            // Add a distinct offset (+2000) so the new K row is easily visible
            k_float = shortreal'(5 + addr + 1);
            IN = $shortrealtobits(k_float); 
            VI_in = 0;
        end
        @(posedge clk); // Allow the final K value to be sampled
        
        // 9. Loading Complete for the new K row
        ADDR = 0;
        IN = 0;
        
//        @(posedge vDone); // Wait for the vDone pulse
        
        for (int addr = 0; addr < H; addr++) begin
            @(posedge clk); 
            
            // --- SPARSE DATAPATH (V ONLY) ---
            block_idx = addr / M;
            pos_in_block = addr % M;
            
            // Check if we are within the N non-zero elements of the current M block
            if (pos_in_block < N) begin
                n_idx = pos_in_block; // Fetch new valid V data
            end else begin
                n_idx = N - 1; // Hold the last valid V data to safely overwrite
            end
            
            // Example pattern for 2:4 sparsity: non-zero elements at index 0 and 2
            offset = n_idx *2+1; 
            actual_pos = (block_idx * M) + offset;
            
            ADDR = (block_idx * N) + n_idx; 
            VI_in = offset; 
            
            // Add a distinct offset (+3000) so the new V row is easily visible
            v_float = shortreal'((actual_pos + 1)*0.3);
            IN = $shortrealtobits(v_float);;
        end
        @(posedge clk); // Allow the final V value to be sampled
        
        // 11. Loading Complete for the new V row
        ADDR = 0;
        IN = 0;
        VI_in = 0;

        // Wait for final processing to complete
//        wait(done);
//        #500;
//        $finish;
    end

endmodule