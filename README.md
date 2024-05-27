# GCD_Algorithm
This repository contains the Verilog Implementation of Euclid's GCD algorithm to find the Greatest Common Divisor between two Numbers Iteratively

## Description:

The `GCD.v` file contains the Verilog code for implementing the gcd calculation system. It consists of two main modules: the data path (`datapath`) and the control path (`controlpath`). The data path performs the actual gcd calculation by manipulating input values and computing the remainder using subtraction, while the control path manages the sequencing of operations in the system using a finite state machine (FSM).

The `GCD_Testbench.v` file contains the Verilog test bench for validating the functionality of the `GCD.v` module. It provides stimuli to the system, including input operands and clock signals, and verifies the correctness of the output gcd value.

`EE5516_Exp3_LabReport.pdf`: Lab Report containg the Schematic (DataPath and ControlPath) , Theory, Abstract, Result and Conclusion for the Experiment.

## Getting Started

1. Clone the repository
2. Open the Verilog files in your preferred Verilog simulator or FPGA development environment.
3. Run the testbench to verify the design.

## License

This project is licensed under the  Apache License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

This implementation is part of the lab work for the EE5516 VLSI Architectures for Signal Processing and Machine Learning course.
