module top_module (
    input clk,
    input d,
    output q
);
    reg a,b;
    always@(posedge clk)
        a<=d;
    always@(negedge clk)
        b<=d;
    assign q = clk ? a:b;
endmodule
