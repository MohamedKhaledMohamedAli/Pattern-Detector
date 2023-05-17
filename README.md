# Pattern-Detector
Implemented a “Pattern Detector” module using Finite State Machines (FSM) that is used to detect the following pattern: 11010 (starting from the left). Pattern detectors type is overlapping style.
Module ports are as follows (all ports are 1-bit wide):

![image](https://github.com/MohamedKhaledMohamedAli/Algorithm-to-find-the-Greatest-Common-Divisor-GCD-of-two-numbers/assets/104237865/32756c2e-fa65-4db0-aa62-4e1aa17550e2)

When receiving the stated pattern, the pattern_found output should be asserted for 1 clock cycle after receiving the last 0 bit of the pattern.
