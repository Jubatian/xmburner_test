
Test case descriptions
==============================================================================

:Author:    Sandor Zsuga (Jubatian)
:License:   GNU GPLv3 (version 3 of the GNU General Public License)




Overview
------------------------------------------------------------------------------


This is a brief summary of what each test case are doing, for reference. For
the more accurate description of each test, see the corresponding source.



Case 0
------------------------------------------------------------------------------


Tests the proper handling of the execution chain, whether it can detect an
incorrect source.

No ALU modifications are present.



Case 1
------------------------------------------------------------------------------


Tests whether the module can run properly when there are no anomalies in the
ALU. This means that the module returns without calling the fault handler.

No ALU modifications are present.



Case 20 - 51
------------------------------------------------------------------------------


Tests various bits stuck to 0 in each CPU register on the upper block
(xmb_creg_cr0) of the module. It should detect all these flaws and call the
fault handler accordingly.

ALU modifications: A stuck 0 bit in registers r0 - r31 (each test case tests
one bit in one CPU register).



Case 60 - 91
------------------------------------------------------------------------------


Tests various bits stuck to 1 in each CPU register on the upper block
(xmb_creg_cr0) of the module. It should detect all these flaws and call the
fault handler accordingly. The bits selected for testing in each register are
the same as in Case 20 - 51 to verify whether the module tests both possible
values for that bit.

ALU modifications: A stuck 1 bit in registers r0 - r31 (each test case tests
one bit in one CPU register).



Case 100 - 131
------------------------------------------------------------------------------


Tests various bits stuck to 0 in each CPU register on the lower block
(xmb_creg_cr1) of the module. It should detect all these flaws and call the
fault handler accordingly.

ALU modifications: A stuck 0 bit in registers r0 - r31 (each test case tests
one bit in one CPU register).



Case 140 - 171
------------------------------------------------------------------------------


Tests various bits stuck to 1 in each CPU register on the lower block
(xmb_creg_cr1) of the module. It should detect all these flaws and call the
fault handler accordingly. The bits selected for testing in each register are
the same as in Case 100 - 131 to verify whether the module tests both possible
values for that bit.

ALU modifications: A stuck 1 bit in registers r0 - r31 (each test case tests
one bit in one CPU register).



Case 180 - 187
------------------------------------------------------------------------------


Tests stuck to 0 bits in the Status Register (SREG) on the status register
block (xmb_creg_sreg).

ALU modifications: Each case tests a stuck to 0 bit in SREG.



Case 190 - 197
------------------------------------------------------------------------------


Tests stuck to 1 bits in the Status Register (SREG) on the status register
block (xmb_creg_sreg).

ALU modifications: Each case tests a stuck to 1 bit in SREG.



Case 200 - 207
------------------------------------------------------------------------------


Tests whether the BSET instruction is tested (setting individual flag bits in
the status register) on the status register block (xmb_creg_sreg).

ALU modifications: Each case tests by turning a BSET into a NOP.



Case 210 - 217
------------------------------------------------------------------------------


Tests whether the BCLR instruction is tested (clearing individual flag bits in
the status register) on the status register block (xmb_creg_sreg).

ALU modifications: Each case tests by turning a BCLR into a NOP.
