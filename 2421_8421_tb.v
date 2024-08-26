`timescale 1ns / 1ns
`include "2421_8421.v"

module gates_tb;
    // Inputs
    reg w;
    reg x;
    reg y;
    reg z;

    // Outputs
    wire a;
    wire b;
    wire c;
    wire d;

    // Instantiate the Unit Under Test (UUT)
    gates uut (
        .w(w), 
        .x(x), 
        .y(y), 
        .z(z), 
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d)
    );

    initial begin
        // Initialize Inputs
        w = 0; x = 0; y = 0; z = 0;
        #10; // Wait for 10 time units
        
        // Apply test vectors
        w = 0; x = 0; y = 0; z = 1; #10;
        w = 0; x = 0; y = 1; z = 0; #10;
        w = 0; x = 0; y = 1; z = 1; #10;
        w = 0; x = 1; y = 0; z = 0; #10;
        w = 0; x = 1; y = 0; z = 1; #10;
        w = 0; x = 1; y = 1; z = 0; #10;
        w = 0; x = 1; y = 1; z = 1; #10;
        w = 1; x = 0; y = 0; z = 0; #10;
        w = 1; x = 0; y = 0; z = 1; #10;
        w = 1; x = 0; y = 1; z = 0; #10;
        w = 1; x = 0; y = 1; z = 1; #10;
        w = 1; x = 1; y = 0; z = 0; #10;
        w = 1; x = 1; y = 0; z = 1; #10;
        w = 1; x = 1; y = 1; z = 0; #10;
        w = 1; x = 1; y = 1; z = 1; #10;

        // Finish simulation
        $finish;
    end

    initial begin
        $dumpfile("2421_8421_tb.vcd");
        $dumpvars(0, gates_tb);
        // Monitor the inputs and outputs
        $display(" w   x   y   z    a   b   c   d");
        $monitor(" %b, %b, %b, %b | %b, %b, %b, %b", 
                  w, x, y, z, a, b, c, d);
    end
endmodule