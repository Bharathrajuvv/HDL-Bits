module top_module (input a, input b, input c, output out);
    wire nand_g;

    andgate inst1 ( nand_g,a, b, c,1,1 );
    assign out = ~nand_g;
endmodule
