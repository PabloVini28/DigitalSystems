# Practice 01 - Logic Gates and Flip-Flops

## FPGA used in the practice: 
[![Zybo Z7](https://img.shields.io/badge/Zybo_Z7-006400?style=for-the-badge&logo=xilinx&logoColor=white)](https://digilent.com/reference/programmable-logic/zybo-z7/start)

## Remarks 📝

- The project consists of several VHDL codes related to the implementation of various logic gates and Flip-Flops.
  
- The TestBench is adapted so that the simulation can be performed on the FPGA, in this case, the AND and OR gates and the HalfAdder.
  
- Adaptations can be made to the TestBench and the .xdc file to run other logic gates on the FPGA without issues.
  
- Place the TestBench in the sim_ folder, the .xdc file in the constrs folder, and the rest in the designs folder.
  
- Synthesize in a cross-compilation environment and generate the binary, then send it to the board and execute.
