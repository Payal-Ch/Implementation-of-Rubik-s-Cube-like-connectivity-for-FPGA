# Implementation-of-Rubik-s-Cube-like-connectivity-for-FPGA

# Project Design Overview
This project models a 3x3 Rubik's Cube, where each face contains 9 Computational Units (CUs). The CUs support 16 different operations such as addition, multiplication, logical shifts, and more. Data flows across the cube in two distinct cycles, with input provided externally to the top face, and outputs taken from the left face.

The cube's design supports both normal data flow and a shortest path for efficient operation. The data flow follows the pattern:
Start → Top Face → Front Face → Right Face → Bottom Face → Back Face → Left Face → Final Output. The shortest path skips unnecessary cycles:
Start → Top Face → Front Face → Bottom Face → Final Output.

Block Diagram Details
Cycle 1 and Cycle 2: Data flows through various faces based on the cycle selector. In Cycle 1, external input is fed to the top face, while in Cycle 2, input is taken from the left face.

Multiplexers: 16x1 and 2x1 multiplexers are used for selecting operations and routing data. The 16x1 multiplexer is used within each CU to support multiple operations, while the 2x1 multiplexers determine the data flow between cycles and the shortest path.

Operations and Data Flow
Operations in the CUs include addition, multiplication, shifts, and logical operations, with outputs truncated to fit 3-bit results.
Multiplexers in the design support selector lines that control the data flow between different parts of the cube.
This design is intended to efficiently route data between different faces of the Rubik's Cube, while also allowing for reconfiguration based on the selected cycle or shortest path.
