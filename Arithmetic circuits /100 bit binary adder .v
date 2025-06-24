module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    // Carry chain for the 100-bit adder
    wire [100:0] carry;
    assign carry[0] = cin;  // Initialize with input carry

    // Generate 100 full adders
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : full_adder_chain
            // Instantiate a full adder for each bit
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    // Final carry out
    assign cout = carry[100];

endmodule

// Full adder submodule
module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
