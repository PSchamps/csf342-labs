`timescale 1ns/1ps
̃̃
module reg_file(
    input clk,
    input reset,
    input reg_write_en,
    input [4:0] rs1, rs2, rd,
    input [31:0] wd,
    output [31:0] rdata1, rdata2
);

wire [31:0] we_lines;
wire [31:0] reg_out [31:0];

decoder5to32 dec(rd, reg_write_en, we_lines);

genvar i;

generate
for(i = 0; i < 32; i = i + 1) begin: REG_ARRAY

    if(i == 0) begin
        assign reg_out[i] = 32'b0;   // x0 hardwired
    end
    else begin
        reg32 r (
            .clk(clk),
            .reset(reset),
            .we(we_lines[i]),
            .d(wd),
            .q(reg_out[i])
        );
    end

end
endgenerate

// Read ports (mux behavior with delay)

assign #1 rdata1 = reg_out[rs1];
assign #1 rdata2 = reg_out[rs2];

endmodule