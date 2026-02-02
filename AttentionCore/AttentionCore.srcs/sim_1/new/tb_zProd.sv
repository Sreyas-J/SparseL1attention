`timescale 1ns / 1ps

module zProd_tb();

    // Parameters - keeping them small for simulation speed
    parameter DATA_WIDTH = 32;
    parameter MAX_H = 4;      
    parameter MAX_W = 4;     
    parameter NUM_INSTANCES = MAX_W * 2; // 16 BRAMs

    // TB Signals
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] S [0:NUM_INSTANCES-1];
    logic [$clog2(MAX_H):0] H;
    
    // Gathering BRAM outputs for the zProd V input
    logic [DATA_WIDTH-1:0] V_net [0:NUM_INSTANCES-1];
    
    logic [$clog2(MAX_H)-1:0] uut_addr;
    logic [DATA_WIDTH-1:0] prod [0:NUM_INSTANCES-1];
    logic done;

    // 1. Instantiate Parallel BRAM Bank
    genvar i;
    generate
        for (i = 0; i < NUM_INSTANCES; i++) begin : bram_bank
            V your_instance_name (
              .clka(clk),    // input wire clka
              .ena(1),      // input wire ena
              .wea(0),      // input wire [0 : 0] wea
              .addra(uut_addr),  // input wire [1 : 0] addra
              .dina(0),    // input wire [31 : 0] dina
              .douta(V_net[i])  // output wire [31 : 0] douta
            );
        end
    endgenerate

    // 2. Instantiate Unit Under Test (UUT)
    zProd #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .MAX_W(MAX_W)
    ) uut (
        .clk(clk),
        .val(val),
        .S(S),
        .V(V_net),
        .H(H),
        .addr(uut_addr),
        .prod(prod),
        .done(done)
    );

    // Clock Generation (100MHz)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        val = 0;
        H=MAX_H;
        
        for (int k = 0; k < NUM_INSTANCES; k++) S[k] = $shortrealtobits(1.0 + k);
    
        #100;
    
        @(posedge clk);
        val <= 1; // Start process
    
        // Keep val high until calculation is finished
//        
    
        @(posedge clk);
        val <= 0;
        wait(done);
        #50; // Reduced final wait
        $finish;
    end

endmodule