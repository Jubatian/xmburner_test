
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



Case 10 - 11
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
compared. This is done by transforming each to a NOP, expecting an according
response.

ALU modification: Turns one of the add instructions into NOP for each test.



Case 20 - 21
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the C (carry) flag is compared. This is done by masking the C to zero for each
instruction (making each behaving like they would clear it).

ALU modification: The C flag cleared for one of the instructions in each test.



Case 30 - 31
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the Z (zero) flag is compared. This is done by masking the Z to zero for each
instruction (making each behaving like they would clear it).

ALU modification: The Z flag cleared for one of the instructions in each test.



Case 40 - 41
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the N (negative) flag is compared. This is done by masking the N to zero for
each instruction (making each behaving like they would clear it).

ALU modification: The N flag cleared for one of the instructions in each test.



Case 50 - 51
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the V (overflow) flag is compared. This is done by masking the V to zero for
each instruction (making each behaving like they would clear it).

ALU modification: The V flag cleared for one of the instructions in each test.



Case 60 - 61
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the S (sign) flag is compared. This is done by masking the S to zero for each
instruction (making each behaving like they would clear it).

ALU modification: The S flag cleared for one of the instructions in each test.



Case 120 - 121
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the C (carry) flag is compared. This is done by masking the C to one for each
instruction (making each behaving like they would set it).

ALU modification: The C flag set for one of the instructions in each test.



Case 130 - 131
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the Z (zero) flag is compared. This is done by masking the Z to one for each
instruction (making each behaving like they would set it).

ALU modification: The Z flag set for one of the instructions in each test.



Case 140 - 141
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the N (negative) flag is compared. This is done by masking the N to one for
each instruction (making each behaving like they would set it).

ALU modification: The N flag set for one of the instructions in each test.



Case 150 - 151
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the V (overflow) flag is compared. This is done by masking the V to one for
each instruction (making each behaving like they would set it).

ALU modification: The V flag set for one of the instructions in each test.



Case 160 - 161
------------------------------------------------------------------------------


Tests whether each of the 2 wide ALU instructions (ADIW, SBIW) is executed and
the S (sign) flag is compared. This is done by masking the S to one for each
instruction (making each behaving like they would set it).

ALU modification: The S flag set for one of the instructions in each test.
