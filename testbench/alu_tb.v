`timescale 1ns/1ps

module alu_tb;

    reg [7:0] A, B;
    reg [2:0] opcode;
    wire [7:0] result;
    wire carry;

    integer errors = 0;

    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry)
    );

    task check;
        input [7:0] expected_result;
        input expected_carry;
        input [127:0] operation;
        begin
            #10;
            if (result !== expected_result || carry !== expected_carry) begin
                $display("FAIL: %s | Expected result=%h carry=%b | Got result=%h carry=%b",
                         operation, expected_result, expected_carry, result, carry);
                errors = errors + 1;
            end
            else begin
                $display("PASS: %s | result=%h carry=%b",
                         operation, result, carry);
            end
        end
    endtask

    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, alu_tb);

        A = 8'd10; B = 8'd5; opcode = 3'b000;
        check(8'd15, 1'b0, "ADD");

        A = 8'd240; B = 8'd48; opcode = 3'b000;
        check(8'd32, 1'b1, "ADD WITH CARRY");

        A = 8'd10; B = 8'd5; opcode = 3'b001;
        check(8'd5, 1'b0, "SUB");

        A = 8'hF0; B = 8'h0F; opcode = 3'b010;
        check(8'h00, 1'b0, "AND");

        A = 8'hF0; B = 8'h0F; opcode = 3'b011;
        check(8'hFF, 1'b0, "OR");

        A = 8'hAA; B = 8'hFF; opcode = 3'b100;
        check(8'h55, 1'b0, "XOR");

        A = 8'h0F; B = 8'h00; opcode = 3'b101;
        check(8'hF0, 1'b0, "NOT");

        A = 8'h03; B = 8'h00; opcode = 3'b110;
        check(8'h06, 1'b0, "LEFT SHIFT");

        A = 8'h80; B = 8'h00; opcode = 3'b111;
        check(8'h40, 1'b0, "RIGHT SHIFT");

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d errors", errors);

        $finish;
    end

endmodule
  
