module top_module (
    input [3:0] x,    
    input [3:0] y,   
    output [4:0] sum  
);
    wire [3:0] cout; 

    // Instantiate 4 full adders in a ripple-carry chain
    fa fa1( .x(x[0]), .y(y[0]), .cin(1'b0), .sum(sum[0]), .cout(cout[0]) );
    fa fa2( .x(x[1]), .y(y[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]) );
    fa fa3( .x(x[2]), .y(y[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]) );
    fa fa4( .x(x[3]), .y(y[3]), .cin(cout[2]), .sum(sum[3]), .cout(sum[4]) );
endmodule

module fa(
    input x, y, cin,   
    output cout, sum   
);
    assign sum = x ^ y ^ cin;                    
    assign cout = (x & y) | (y & cin) | (x & cin); 
endmodule
