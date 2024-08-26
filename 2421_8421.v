module gates(w,x,y,z,a,b,c,d);
    input x,y,w,z;
    output a,b,c,d;

    
    assign a = x&y;
    assign b = (x&(~y))|(w&(~x));
    assign c = w ^ y;
    assign d = z;
    
    
endmodule