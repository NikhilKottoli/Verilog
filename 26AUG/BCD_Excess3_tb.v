`timescale 1ns/1ns
`include "BCD_Excess3.v"

module TestBench;
    reg [3:0] data;//int data[4]
    reg [3:0] data2;
    wire W,X,Y,Z;
    wire P,Q,R,S;

    BCD_Excess3_Dataflow case1(.A(data[3]), .B(data[2]), .C(data[1]), .D(data[0]), .W(W), .X(X), .Y(Y), .Z(Z));
    BCD_Excess3_Gate case2(.A(data2[3]), .B(data2[2]), .C(data2[1]), .D(data2[0]), .W(P), .X(Q), .Y(R), .Z(S));

    initial begin

        $dumpfile("BCD_Excess3_tb.vcd");
        $dumpvars(0,TestBench);

        $display("Converting BCD Into EXCESS-3 Using Dataflow\n");
        $display("BCD\tEXCESS-3");
        $display("----\t--------");
        for(data=0; data<10; data=data+1) begin
            #10 $display("%b\t%b%b%b%b", data, W, X, Y, Z);
        end

        $display("\n\nConverting EXCESS-3 Into BCD Using Structural\n");

        for(data2 = 0;data2<10;data2=data2+1) begin
            #10 $display("%b\t%b%b%b%b", data2, P, Q, R, S);
        end
    end


endmodule