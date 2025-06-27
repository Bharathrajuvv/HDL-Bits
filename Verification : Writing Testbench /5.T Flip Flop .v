module top_module ();
    reg clk,reset,t;
    wire q;
    
    tff duv(clk,reset,t,q);
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        t=0;
        reset=1;
        #10reset=0;
        #10 t=1;
        #10 t=1;
        #10 t=0;
        #10 t=1;
        #10 t=0;
        #10 t=1;
        #20 $finish;
    end
endmodule
