# GCD_Algorithm
This repository contains the Verilog Implementation of Euclid's GCD algorithm to find the Greatest Common Divisor between two Numbers Iteratively

## Repository Structure:

- `GCD.v`: Verilog module implementing the gcd calculation system. It consists of the top-level module `top_module`, along with sub-modules `datapath` and `controlpath`.
  
- `GCD_Testbench.v`: Verilog test bench for testing the functionality of the `GCD.v` module. It provides stimuli to the system and verifies the correctness of the output.

- `GCD_Testbench.v`: Verilog test bench for testing the functionality of the `GCD.v` module. It provides stimuli to the system and verifies the correctness of the output.

## Description:

The `GCD.v` file contains the Verilog code for implementing the gcd calculation system. It consists of two main modules: the data path (`datapath`) and the control path (`controlpath`). The data path performs the actual gcd calculation by manipulating input values and computing the remainder using subtraction, while the control path manages the sequencing of operations in the system using a finite state machine (FSM).

The `GCD_Testbench.v` file contains the Verilog test bench for validating the functionality of the `GCD.v` module. It provides stimuli to the system, including input operands and clock signals, and verifies the correctness of the output gcd value.

## Usage:

1. Include the `GCD.v` module in your Verilog project.
2. Instantiate the `top_module` module in your top-level design.
3. Connect the inputs and outputs as required, including clock and reset signals, input operands, and acknowledgment signals.
4. Use the `GCD_Testbench.v` file to simulate and test the functionality of the gcd calculation system. Ensure that the test bench covers various input scenarios to validate the behavior of the system under different conditions.

## Authors:

- [Your Name]

## Acknowledgments:

- This code was developed as part of a project for [Your Institution].
