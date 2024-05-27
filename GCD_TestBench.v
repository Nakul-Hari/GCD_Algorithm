module gcd_test;
  	reg [7:0] A_in, B_in, A_gen, B_gen;
	reg clk,reset, operands_val, ack_rcvd;
 	wire [7:0] GCD, out_behav;
	wire gcd_valid;

integer delay,i;

gcd top_module(
	.A_in(A_in),
	.B_in(B_in),
	.Rst(Rst),
	.Clk(Clk),
	.operands_val(operands_val),
	.ack(ack_rcvd),
  	.gcd_out(GCD),
	.gcd_valid(gcd_valid)
	);

gcd_behav gcd_behav1(.inA(A_in), .inB(B_in), .Y(out_behav));

always
#10 clk = ~clk;

initial begin
  $dumpfile("dump.vcd");
$dumpvars(0);
end

initial begin
drive_reset;

  for (i=0;i<5;i=i+1)
begin
A_gen = 24;
B_gen = 36;
drive_input(A_gen, B_gen);
check_output;
end

repeat(20)@(negedge clk)
$finish;
end

task drive_reset;
  begin
  $display ("Driving the reset");
clk = 1'b0;
@ (negedge clk)
reset = 0;
@ (negedge clk)
reset = 1;
@ (negedge clk)
reset = 0;
  end
endtask

  task drive_input(input [7:0] A_gen, B_gen);
  begin
  $display ("Driving the Input");
@ (negedge clk)
operands_val = 1;
A_in = A_gen;

B_in= B_gen;
@ (negedge clk)
operands_val = 0;
  end
endtask

task check_output;
  begin
@ (posedge gcd_valid)
    $display ("Recieved GCD Valid");
  if(GCD == out_behav)
    $display ("Test Succeeded");
else
  $display("Test failed");
delay = 10;
repeat(delay)@(negedge clk)
ack_rcvd = 1;
    @(negedge clk)
    ack_rcvd=0;
  end
endtask

endmodule

module gcd_behav(  input [7:0] inA, inB, output [7:0] Y);

 	reg [7:0] A, B, Y, swap;
	integer done;

always @(*)

begin
	done = 0;
	A = inA; B = inB;
while ( !done )
begin
  if ( A < B )
	begin
		swap = A;
		A = B;
		B = swap;
	end
	else if ( B != 0 )
      begin
		A = A - B;
      end
	else
      begin
		done = 1;
	end
		Y = A;
end
end
endmodule
