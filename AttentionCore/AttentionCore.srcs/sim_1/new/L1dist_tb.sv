`timescale 1ns / 1ps

module L1dist_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter MAX_H = 4;
    parameter zero = $shortrealtobits(0.0);

    // TB signals
    logic clk;
    logic val, val_reg;
    logic [DATA_WIDTH-1:0] A_data, B_data;
    logic [$clog2(MAX_H):0] H;
    
    // BRAM specific signals
    logic [1:0] addr; 
    logic ena;

    // Outputs
    logic [$clog2(MAX_H):0] cnt;
    logic done;
    logic [DATA_WIDTH-1:0] c;

    // Instantiate BRAM for A
    Q bram_A (
      .clka(clk),
      .ena(ena),
      .wea(1'b0),      // Read only
      .addra(addr),
      .dina(32'b0),
      .douta(A_data)
    );

    // Instantiate BRAM for B
    V bram_B (
      .clka(clk),
      .ena(ena),
      .wea(1'b0),      // Read only
      .addra(addr),
      .dina(32'b0),
      .douta(B_data)
    );

    // Instantiate UUT
    L1dist #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .zero(zero)
    ) uut (
        .clk(clk),
        .val(val), // Using the delayed val to match BRAM latency
//        .en(ena),
        .A(A_data),
        .B(B_data),
        .H(H),
        .cnt(addr),
        .done(done),
        .c(c)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Address and Control Logic
    initial begin
        // Initialize
        clk = 0;
        val = 0;
//        val_reg = 0;
        ena = 1;
        H = MAX_H;

        #100;

        // Start reading from BRAM
        @(posedge clk);
//        ena <= 1;
        val <= 1; // Trigger signal
        
        // Loop through addresses
//        for (int i = 0; i < MAX_H; i++) begin
//            addr <= i;
//            @(posedge clk);
//            // Delay val by 1 clock to align with BRAM output latency
//            val_reg <= val; 
//            val <= (i == MAX_H-1) ? 0 : 1; 
//        end
        
        // Final pulse to clear the pipeline
        @(posedge clk);
        val <= 0;
//        ena <= 0;

        // Wait for accumulator completion
        wait(done);

        #50;
//        $display("Final Result c: %h", c);
//        $finish;
    end

endmodule