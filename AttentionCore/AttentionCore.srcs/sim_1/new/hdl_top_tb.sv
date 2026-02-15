`timescale 1ns / 1ps

module tb_hdl_top();

    // -----------------------------------------
    // Parameters (Scaled down for faster sim)
    // -----------------------------------------
    parameter DATA_WIDTH = 32;
    parameter MAX_W = 4;  // Scaled down from 256
    parameter MAX_H = 4;  // Scaled down from 64

    // -----------------------------------------
    // Signals
    // -----------------------------------------
    logic clk;
    logic we;
    logic reset;
    logic val;
    logic [$clog2(MAX_H)-1:0] QKaddr,Vaddr;
    logic [DATA_WIDTH-1:0] Q;
    logic [DATA_WIDTH-1:0] K,V;
    logic [$clog2(MAX_H):0] H;
    logic [$clog2(MAX_W*2):0] W;
    
    logic sDone,vDone;

    // -----------------------------------------
    // Unit Under Test (UUT)
    // -----------------------------------------
    hdl_top #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W),
        .MAX_H(MAX_H)
    ) uut (
        .clk(clk),
        .we(we),
        .reset(reset),
//        .val(val),
        .QKaddr(QKaddr),
//        .Vaddr(Vaddr),
        .Q(Q),
        .K(K),
        .V(V),
        .H(H),
        .W(W),
        .sDone(sDone),
        .Vdone(vDone)
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
        int module_idx; // Declared here for broader scope if needed, or inline

        // 1. Initialize Default Values
        we = 0;
        val = 0;
        QKaddr = 0;
        Vaddr=0;
        Q = 0;
        K = 0;
        V=0;
        H = MAX_H; 
        W = MAX_W;
        
        // 2. Drive Reset High then Low
        reset = 1;
        #50;
        @(posedge clk);
        reset = 0;
        
        // Wait a couple of cycles for FSM to enter LOAD
        repeat(2) @(posedge clk);

        // 3. Pulse 'val' high for exactly one cycle
        val = 1;
        @(posedge clk);
        val = 0;

        // 4. Begin Writing Q and K Matrices continuously
        we = 1; 

        // The DUT expects MAX_W*2 modules to be loaded.
        for (module_idx = 0; module_idx < MAX_W * 2; module_idx++) begin
            for (int addr = 0; addr < H; addr++) begin
                QKaddr = addr;
                
                // ---------------------------------------------------------
                // UPDATED SECTION: Floating Point Assignment
                // ---------------------------------------------------------
                
                // 1. Create a floating point value (cast int to shortreal)
                q_float = shortreal'((module_idx * H) + addr + 1);
                k_float = shortreal'((module_idx * H) + addr + 2);
                v_float = shortreal'((module_idx * H) + addr);

                // 2. Convert float to IEEE 754 bits
                Q = $shortrealtobits(q_float); 
                K = $shortrealtobits(k_float);
                V = $shortrealtobits(v_float); 
                
                @(posedge clk); // Wait 1 cycle for write to register
            end
        end
        
        // 5. Loading Complete
        we = 0;
        QKaddr = 0;
        Vaddr=0;
        Q = 0;
        K = 0;
        V=0;

        // Add a small buffer before ending
        wait(vDone);
//        wait(Zwe);
        #500;
        $finish;
    end

endmodule