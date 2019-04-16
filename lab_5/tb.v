
`timescale 1 ns / 100 ps

//testbench
module tb;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [4:0] value;

    // creating the instance of the module we want to test
    adder dut (a, b, value);

    initial begin
        #10; a = 4'h1; b = 4'h2;
        #10; a = 4'h4; b = 4'h3;
        #10; a = 4'h9; b = 4'h3;
        #10; a = 4'ha; b = 4'hb;
        #10;
    end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor ("a=%4b %1h b=%4b %1h q=%5b %2h", a, a, b, b, value, value);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
