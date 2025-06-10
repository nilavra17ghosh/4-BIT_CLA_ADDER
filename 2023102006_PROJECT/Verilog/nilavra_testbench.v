`include "nilavra_cla.v"

module tb_top_module();

    reg [3:0] A, B;
    reg C0, CLK;
    wire [3:0] SUM;
    wire C4;

    top_module uut (
        .SUM(SUM),
        .C4(C4),
        .A(A),
        .B(B),
        .C0(C0),
        .CLK(CLK)
    );

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
         $monitor("Time = %0t | A = %b | B = %b | C0 = %b | SUM = %b | C4 = %b",
                 $time, A, B, C0, SUM, C4);

        A = 4'b0000; B = 4'b0000; C0 = 1'b0;
        #20;

        A = 4'b0011; B = 4'b0101; C0 = 1'b0;
        #20;

        A = 4'b1010; B = 4'b1100; C0 = 1'b0;
        #20;

        A = 4'b1111; B = 4'b1111; C0 = 1'b0;
        #20;

        A = 4'b0110; B = 4'b0011; C0 = 1'b0;
        #20;

        $finish;
    end


endmodule
