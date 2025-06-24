module top_module (
    input  [7:0] a, b,  // 8-bit 2's complement inputs
    output [7:0] s,     // 8-bit sum
    output overflow     // 1 if signed overflow occurred
);
    // Perform addition
    assign s = a + b;

    // Overflow occurs if:
    // 1. Two positives sum to a negative (a[7]=0, b[7]=0, s[7]=1), OR
    // 2. Two negatives sum to a positive (a[7]=1, b[7]=1, s[7]=0)
    assign overflow = (~a[7] & ~b[7] & s[7]) | (a[7] & b[7] & ~s[7]);
endmodule
