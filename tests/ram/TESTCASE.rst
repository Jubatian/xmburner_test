
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



Case 20 - 27
------------------------------------------------------------------------------


Tests stuck to 0 bits in RAM on the RAM check (xmb_ram_check). It must detect
any stuck 0 bit.

ALU modifications: Each case tests a different stuck to 0 bit on a RAM cell.


Case 30 - 37
------------------------------------------------------------------------------


Tests stuck to 1 bits in RAM on the RAM check (xmb_ram_check). It must detect
any stuck 1 bit.

ALU modifications: Each case tests a different stuck to 1 bit on a RAM cell.