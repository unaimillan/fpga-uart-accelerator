`timescale 1ns / 1ps

module dut;

    initial $dumpvars;
    
    parameter expWidth   = 8;
    parameter sigWidth   = 24;
    parameter FLOAT_SIZE = 32;
    parameter BYTE_WIDTH = 1;

    wire [     FLOAT_SIZE - 1:0 ] a;
    wire [     FLOAT_SIZE - 1:0 ] b;
    wire [ 8 * BYTE_WIDTH - 1:0 ] op;
    wire [     FLOAT_SIZE - 1:0 ] result;
    wire [                  7:0 ] flags;

    fpu # (
        .expWidth   ( expWidth   ),
        .sigWidth   ( sigWidth   ),
        .FLOAT_SIZE ( FLOAT_SIZE ),
        .BYTE_WIDTH ( BYTE_WIDTH )
    ) 
    dut
    (
        .a      ( a      ),
        .b      ( b      ),
        .op     ( op     ),
        .result ( result ),
        .flags  ( flags  )
    );

endmodule
