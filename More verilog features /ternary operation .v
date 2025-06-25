module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire [7:0] i,j;
    assign i = a<b ? a:b;
    assign j = i<c ? i:c;
    assign min = j<d ? j:d;

    // assign intermediate_result1 = compare? true: false;

endmodule
