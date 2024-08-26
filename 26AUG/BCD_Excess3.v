module BCD_Excess3_Dataflow(A,B,C,D, W,X,Y,Z);
    output W,X,Y,Z;
    input A,B,C,D;

    assign W = (A & ~B ) | (B&D) | (C&B);
    assign X = (B&~C&~D)|(~B&D)|(C&~B);
    assign Y = (~C&~D) | (C&D);
    assign Z = ~D;
endmodule

module BCD_Excess3_Gate(A, B, C, D, W, X, Y, Z);
    output W, X, Y, Z;
    input A, B, C, D;

    wire b, c, d;

    not(b, B);
    not(c, C);
    not(d, D);

    wire part1_w, part2_w, part3_w;
    wire part1_x, part2_x, part3_x;
    wire part1_y, part2_y;

    // Logic for W
    and(part1_w, A, b);
    and(part2_w, B, D);
    and(part3_w, C, B);
    or(W, part1_w, part2_w, part3_w); // OUTPUT W

    // Logic for X
    and(part1_x, B, c, d);
    and(part2_x, b, D);
    and(part3_x, C, b);
    or(X, part1_x, part2_x, part3_x); // OUTPUT X

    // Logic for Y
    and(part1_y, c, d);
    and(part2_y, C, D);
    or(Y, part1_y, part2_y); // OUTPUT Y

    not(Z, D); // OUTPUT Z

endmodule