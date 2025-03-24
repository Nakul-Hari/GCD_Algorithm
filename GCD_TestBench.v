module gcd_test;

    reg [7:0] A_in, B_in, A_gen, B_gen;
    reg clk, rst, operands_val, ack_rcvd;
    wire [7:0] GCD, out_behav;
    wire gcd_valid;

    integer delay, i;

    // Instantiate DUT (Device Under Test)
    top_module gcd (
        .A_in(A_in),
        .B_in(B_in),
        .Rst(rst),
        .Clk(clk),
        .operands_val(operands_val),
        .ack(ack_rcvd),
        .gcd_out(GCD),
        .gcd_valid(gcd_valid)
    );

    // Instantiate behavioral reference model
    gcd_behav gcd_behav1 (
        .inA(A_in),
        .inB(B_in),
        .Y(out_behav)
    );

    // Clock generation
    always #10 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);

        clk = 1'b0;
        rst = 1'b0;
        operands_val = 1'b0;
        ack_rcvd = 1'b0;

        drive_reset;

        for (i = 0; i < 5; i = i + 1) begin
            A_gen = $random % 100;  // Random 8-bit number (optional: replace with specific values)
            B_gen = $random % 100;

            if (B_gen == 0) B_gen = 1; // Avoid divide by zero case in behavioral model

            drive_input(A_gen, B_gen);
            check_output;
        end

        repeat (20) @(negedge clk);
        $finish;
    end

    // Tasks
    task drive_reset;
    begin
        $display("Driving the reset");
        rst = 1;
        @(negedge clk);
        rst = 0;
        @(negedge clk);
    end
    endtask

    task drive_input(input [7:0] A_gen, B_gen);
    begin
        $display("Driving the Input A = %d, B = %d", A_gen, B_gen);
        @(negedge clk);
        operands_val = 1;
        A_in = A_gen;
        B_in = B_gen;
        @(negedge clk);
        operands_val = 0;
    end
    endtask

    task check_output;
    begin
        @(posedge gcd_valid);
        $display("Received GCD Valid, GCD = %d, Expected = %d", GCD, out_behav);

        if (GCD == out_behav)
            $display("Test Succeeded");
        else
            $display("Test Failed");

        delay = 10;
        repeat (delay) @(negedge clk);
        ack_rcvd = 1;
        @(negedge clk);
        ack_rcvd = 0;
    end
    endtask

endmodule

// Behavioral Model (Reference GCD Calculation)
module gcd_behav (
    input [7:0] inA, inB,
    output reg [7:0] Y
);

    reg [7:0] A, B, swap;

    always @(*) begin
        A = inA;
        B = inB;

        while (B != 0) begin
            if (A < B) begin
                swap = A;
                A = B;
                B = swap;
            end else begin
                A = A - B;
            end
        end

        Y = A;
    end

endmodule
