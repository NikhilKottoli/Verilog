module Majority(A, B, C, D, R, T);
input A, B, C, D;
output reg R, T;

integer count=0;

always @(*) begin
    count=0;
    
    if(A) count = count + 1;
    if(B) count = count + 1;
    if(C) count = count + 1;
    if (D) count = count + 1;

    if(count >= 3) begin
        R = 1;
        T = 0;
    end
    else if(count == 2) begin
        R = 0;
        T = 1;
    end
    else begin
        R = 0;
        T = 0;
    end
end

endmodule