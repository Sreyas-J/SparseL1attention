module Accumulator #(
    parameter DATA_WIDTH = 32,
    parameter MAX_H = 64,
    parameter zero = $shortrealtobits(0.0) // Ensure no trailing comma here
)(
    input  logic clk, val,
    input  logic [DATA_WIDTH-1:0] dataIn,
    input logic [$clog2(MAX_H):0] count,
    
    output logic [$clog2(MAX_H):0] cnt,
    output logic [DATA_WIDTH-1:0] acc,
    output logic done  // Added comma here if it was missing in your editor
);
    
    logic [DATA_WIDTH-1:0] addB;
    logic valBuff,tLast,addFlg;
    
    // IP Instantiation
    ADD add (
      .aclk(clk),
      .s_axis_a_tvalid(addFlg),
      .s_axis_a_tready(),
      .s_axis_a_tdata(dataIn),
      .s_axis_b_tvalid(addFlg),
      .s_axis_b_tready(),
      .s_axis_b_tdata(addB),
      .m_axis_result_tvalid(),
      .m_axis_result_tready(addFlg),
      .m_axis_result_tdata(acc)
    );
    
    // Sequential Logic
    always_ff @(posedge clk) begin
        valBuff <= val;
        
//        if(valBuff)begin
//            tLastBuff<=tLast;
            if(tLast) done <= 1'b1;
            else done <= 1'b0;         
//        end
        
        if(done) done<=0;
        
        if(tLast || done) cnt<=0;
        else if(val) cnt<=1;      
        else if(cnt>0) cnt<=cnt+1;
    end
    
    // Combinational Logic
    always_comb begin
        tLast=(cnt==count);
        if(valBuff) addB = zero;
        else addB = acc;
        
        addFlg=cnt>0;
    end

endmodule