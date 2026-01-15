
module dut(input clk,reset,
            output [3:0] count);

DFF D0(.clk(clk),.reset(reset),.d(~count[0]),.q(count[0]));
DFF D1(.clk(~count[0]),.reset(reset),.d(~count[1]),.q(count[1]));
DFF D2(.clk(~count[1]),.reset(reset),.d(~count[2]),.q(count[2]));
DFF D3(.clk(~count[2]),.reset(reset),.d(~count[3]),.q(count[3]));

endmodule