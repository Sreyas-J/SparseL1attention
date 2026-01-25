`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2026 06:45:56 PM
// Design Name: 
// Module Name: zRed
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module zRed#(
    parameter DATA_WIDTH=32,
    parameter MAX_W=256,  
    parameter MAX_H=64
)(
    input logic clk,
    
    input logic [DATA_WIDTH-1:0] Z [0:MAX_H-1]
    );
endmodule
