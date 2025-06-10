module FF_TSPC(Q, Clk, D);
    module dlatch(q,qp,d,clk);
    input d,clk;
    output q,qp;
    wire d_not,t1,t2,clk_not,en;
    not nt1(d_not,d),
        nt2(clk_not,clk);
    and n0(en,clk_not,clk);
    and a1(t1,d,en),
        a2(t2,d_not,en);
    nor n1(qp,t1,q);
    nor n2(q,t2,qp);
endmodule
endmodule


module cla_4bit(output [3:0] SUM, output C4, input [3:0] A, input [3:0] B, input C0);
    wire [3:0] P, G, C;

    // Generate and propagate
    xor (P[0], A[0], B[0]);
    xor (P[1], A[1], B[1]);
    xor (P[2], A[2], B[2]);
    xor (P[3], A[3], B[3]);

    and (G[0], A[0], B[0]);
    and (G[1], A[1], B[1]);
    and (G[2], A[2], B[2]);
    and (G[3], A[3], B[3]);
    
    // Carry 
    or (C[1], G[0], (P[0] & C0));
    or (C[2], G[1], (P[1] & C[1]));
    or (C[3], G[2], (P[2] & C[2]));
    or (C4, G[3], (P[3] & C[3]));

    // Sum 
    xor (SUM[0], P[0], C0);
    xor (SUM[1], P[1], C[1]);
    xor (SUM[2], P[2], C[2]);
    xor (SUM[3], P[3], C[3]);
endmodule


module top_module(output [3:0] SUM, output C4, input [3:0] A, input [3:0] B, input C0, input CLK);
    wire [3:0] A_reg, B_reg, SUM_reg;
    wire C4_middle;

    // Input 
    FF_TSPC dff_A0(A_reg[0], CLK, A[0]);
    FF_TSPC dff_A1(A_reg[1], CLK, A[1]);
    FF_TSPC dff_A2(A_reg[2], CLK, A[2]);
    FF_TSPC dff_A3(A_reg[3], CLK, A[3]);

    FF_TSPC dff_B0(B_reg[0], CLK, B[0]);
    FF_TSPC dff_B1(B_reg[1], CLK, B[1]);
    FF_TSPC dff_B2(B_reg[2], CLK, B[2]);
    FF_TSPC dff_B3(B_reg[3], CLK, B[3]);

    // Carry lookahead adder
    cla_4bit cla(SUM_reg, C4_middle, A_reg, B_reg, C0);

    // Output 
    FF_TSPC dff_SUM0(SUM[0], CLK, SUM_reg[0]);
    FF_TSPC dff_SUM1(SUM[1], CLK, SUM_reg[1]);
    FF_TSPC dff_SUM2(SUM[2], CLK, SUM_reg[2]);
    FF_TSPC dff_SUM3(SUM[3], CLK, SUM_reg[3]);

    FF_TSPC dff_C4(C4, CLK, C4_middle);
endmodule
