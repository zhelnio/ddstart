
`timescale 1 ns / 100 ps

//testbench
module tb;

    // clock and reset
    reg        clk, rst;

    initial begin
        clk <= 0;
        forever
            #10 clk <= ~clk;
    end

    initial begin
        rst <= 'b1;
        repeat(3) @(posedge clk);
        rst <= 'b0;
    end

    wire [3:0] value;

    // creating the instance of the module we want to test
    counter dut (clk, rst, value);

    // test duration
    initial begin
        repeat(50) @(posedge clk);
        $finish;
    end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor ("%0d clk %b rst %b q %b %d", $time, clk, rst, value, value);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
