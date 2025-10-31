module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] x;
    always@(posedge clk)begin
        x <= in;
        if(reset)
            out<=0;
        else
            out<=out | (x& ~in);
    end
endmodule
