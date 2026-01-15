

module dut(
        input clk,reset,serial_in,
        output [3:0]q
);

DFF D0(.clk(clk),.reset(reset),.d(serial_in),.q(q[0]));
DFF D1(.clk(clk),.reset(reset),.d(q[0]),.q(q[1]));
DFF D2(.clk(clk),.reset(reset),.d(q[1]),.q(q[2]));
DFF D3(.clk(clk),.reset(reset),.d(q[2]),.q(q[3]));

endmodule