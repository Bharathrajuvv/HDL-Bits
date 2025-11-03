module top_module (
    input clk,
    input areset,         // asynchronous active-high reset
    input load,           // synchronous load
    input ena,            // shift enable
    input [3:0] data,     // input data to load
    output reg [3:0] q    // 4-bit shift register
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 4'b0000;                 // async reset to 0
        else if (load)
            q <= data;                    // synchronous load
        else if (ena)
            q <= {1'b0, q[3:1]};          // shift right, insert 0 at q[3]
    end

endmodule
