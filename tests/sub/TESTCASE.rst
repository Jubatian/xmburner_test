
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



Case 10 - 16
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and compared. This is done by transforming each to a
NOP, expecting an according response.

ALU modification: Turns one of the sub instructions into NOP for each test.



Case 20 - 26
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the C (carry) flag is compared. This is done by
masking the C to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The C flag cleared for one of the instructions in each test.



Case 30 - 36
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the Z (zero) flag is compared. This is done by
masking the Z to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The Z flag cleared for one of the instructions in each test.



Case 40 - 46
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the N (negative) flag is compared. This is done by
masking the N to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The N flag cleared for one of the instructions in each test.



Case 50 - 56
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the V (overflow) flag is compared. This is done by
masking the V to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The V flag cleared for one of the instructions in each test.



Case 60 - 66
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the S (sign) flag is compared. This is done by
masking the S to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The S flag cleared for one of the instructions in each test.



Case 70 - 76
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the H (half carry) flag is compared. This is done
by masking the H to zero for each instruction (making each behaving like they
would clear it).

ALU modification: The H flag cleared for one of the instructions in each test.



Case 120 - 126
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the C (carry) flag is compared. This is done by
masking the C to one for each instruction (making each behaving like they
would set it).

ALU modification: The C flag set for one of the instructions in each test.



Case 130 - 136
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the Z (zero) flag is compared. This is done by
masking the Z to one for each instruction (making each behaving like they
would set it).

ALU modification: The Z flag set for one of the instructions in each test.



Case 140 - 146
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the N (negative) flag is compared. This is done by
masking the N to one for each instruction (making each behaving like they
would set it).

ALU modification: The N flag set for one of the instructions in each test.



Case 150 - 156
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the V (overflow) flag is compared. This is done by
masking the V to one for each instruction (making each behaving like they
would set it).

ALU modification: The V flag set for one of the instructions in each test.



Case 160 - 166
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the S (sign) flag is compared. This is done by
masking the S to one for each instruction (making each behaving like they
would set it).

ALU modification: The S flag set for one of the instructions in each test.



Case 170 - 176
------------------------------------------------------------------------------


Tests whether each of the 7 sub type instructions (SUB, CP, SUBI, CPI, SBC,
CPC, SBCI) is executed and the H (half carry) flag is compared. This is done
by masking the H to one for each instruction (making each behaving like they
would set it).

ALU modification: The H flag set for one of the instructions in each test.
