`timescale 1ns/1ns
`include "Voting.v"

module Result_tb;
reg [3:0] data;
wire R, T;

Majority M1(.A(data[3]), .B(data[2]), .C(data[1]), .D(data[0]), .R(R), .T(T));

initial begin
    $display("A B C D | Result | Tie");

    // Initialize data
    data = 4'b0000;

    // Loop to test all possible combinations of inputs
    for (data = 0; data < 16; data = data + 1) begin
        #10;
        $display("%b %b %b %b | %b      | %b", data[3], data[2], data[1], data[0], R, T);
        if(data == 15) begin
            $display("Test complete");
            $finish;
        end
    end

    $finish;
end
endmodule
