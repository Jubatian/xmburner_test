
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
