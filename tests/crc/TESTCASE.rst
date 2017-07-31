
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



Case 2
------------------------------------------------------------------------------


Tests whether the module can perform a full cycle without faults when there
are no anomalies.

No ALU modifications are present.



Case 3
------------------------------------------------------------------------------


Tests whether the module can detect ROM anomalies by producing bad CRC.

ALU modifications: ROM bits on the CRC masked out.



Case 4
------------------------------------------------------------------------------


Tests whether the module can compare the two CRC algorithms it uses by
modifying an instruction used in only one of these algorithms.

ALU modifications: MUL instruction turned to NOP (used for table CRC).



Case 20
------------------------------------------------------------------------------


Tests the xmb_crc_isromok() function whether it can complete passing when
there are no anomalies present.

No ALU modifications are present.



Case 21
------------------------------------------------------------------------------


Tests the xmb_crc_isromok() function whether it fails if the CRC is bad.

ALU modifications: ROM bits on the CRC masked out.



Case 30
------------------------------------------------------------------------------


Generates CRC on a RAM buffer and checks it. Checks whether these routines can
pass proper when they are used normally.

No ALU modifications are present.



Case 31
------------------------------------------------------------------------------


Performs CRC check on a RAM buffer with bad CRC. Checks whether the RAM CRC
check can detect and report failure.

No ALU modifications are present.
