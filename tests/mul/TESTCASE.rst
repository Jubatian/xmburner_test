
Test case descriptions
==============================================================================

:Author:    Sandor Zsuga (Jubatian)
:License:   GNU GPLv3 (version 3 of the GNU General Public License)




Overview
------------------------------------------------------------------------------


This is a brief summary of what each test case are doing, for reference. For
the more accurate description of each test, see the corresponding source.

The multiplication test is a multiple pass test. In these tests only the first
pass is executed and required to pass all the tests. Setting up the
multiplication test so it passes these ensures that it can detect the most
common type of failures immediately (that is within the first XMBurner test
cycle).



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



Case 2
------------------------------------------------------------------------------


Tests whether the included PRNG actually covers all 16 bit numbers, which is
essential for executing all operand combinations on the instructions.

No ALU modifications present.



Case 10 - 15
------------------------------------------------------------------------------


Tests whether whether each of the 6 mul type instructions (MUL, MULS, MULSU,
FMUL, FMULS, FMULSU) is executed and compared. This is done by transforming
each to a NOP, expecting an according response.

ALU modification: Turns one of the add instructions into NOP for each test.



Case 20 - 25
------------------------------------------------------------------------------


Tests whether whether each of the 6 mul type instructions (MUL, MULS, MULSU,
FMUL, FMULS, FMULSU) is executed and the C (carry) flag is compared. This is
done by masking C to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The C flag cleared for one of the instructions in each test.



Case 30 - 35
------------------------------------------------------------------------------


Tests whether whether each of the 6 mul type instructions (MUL, MULS, MULSU,
FMUL, FMULS, FMULSU) is executed and the Z (zero) flag is compared. This is
done by masking Z to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The Z flag cleared for one of the instructions in each test.



Case 120 - 125
------------------------------------------------------------------------------


Tests whether whether each of the 6 mul type instructions (MUL, MULS, MULSU,
FMUL, FMULS, FMULSU) is executed and the C (carry) flag is compared. This is
done by masking C to one for each instruction (making each behaving like they
would set it).

ALU modification: The C flag set for one of the instructions in each test.



Case 130 - 135
------------------------------------------------------------------------------


Tests whether whether each of the 6 mul type instructions (MUL, MULS, MULSU,
FMUL, FMULS, FMULSU) is executed and the Z (zero) flag is compared. This is
done by masking Z to one for each instruction (making each behaving like they
would set it).

ALU modification: The Z flag set for one of the instructions in each test.
