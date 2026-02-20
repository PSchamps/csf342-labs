`timescale 1ns/1ps

module dut(
    input clk,
    input reset,
    input [31:0] instruction,
    output [31:0] rd_val
);

// ---------------- FIELD EXTRACTION ----------------

wire [4:0] rs1 = instruction[19:15];
wire [4:0] rs2 = instruction[24:20];
wire [4:0] rd  = instruction[11:7];
wire [2:0] funct3 = instruction[14:12];
wire [6:0] funct7 = instruction[31:25];

// ---------------- INTERNAL WIRES ----------------

wire [31:0] rdata1, rdata2;
wire [31:0] alu_result;
wire [2:0] alu_control;

// ---------------- REGISTER FILE ----------------

reg_file RF (
    .clk(clk),
    .reset(reset),
    .reg_write_en(1'b1),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(alu_result),
    .rdata1(rdata1),
    .rdata2(rdata2)
);

// ---------------- ALU CONTROL ----------------

alu_ctrl CTRL (
    .funct3(funct3),
    .funct7(funct7),
    .alu_ctrl(alu_control)
);

// ---------------- ALU ----------------
// ⚠️ Match these ports to your Lab-4 ALU

alu ALU (
    .a(rdata1),
    .b(rdata2),
    .alu_ctrl(alu_control),
    .result(alu_result)
);

assign rd_val = alu_result;

endmodule