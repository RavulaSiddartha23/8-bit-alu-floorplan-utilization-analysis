module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] result,
    output reg carry
);

always @(*) begin
    carry = 1'b0;
    result = 8'b0;

    case (opcode)
        3'b000: {carry, result} = {1'b0, A} + {1'b0, B};
        3'b001: result = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
        3'b100: result = A ^ B;
        3'b101: result = ~A;
        3'b110: result = A << 1;
        3'b111: result = A >> 1;
        default: begin
            result = 8'b0;
            carry = 1'b0;
        end
    endcase
end

endmodule
