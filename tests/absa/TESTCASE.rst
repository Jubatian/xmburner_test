
Test case descriptions
==============================================================================

:Author:    Sandor Zsuga (Jubatian)
:License:   GNU GPLv3 (version 3 of the GNU General Public License)




Overview
------------------------------------------------------------------------------


This is a brief summary of what each test case are doing, for reference. For
the more accurate description of each test, see the corresponding source.

This component could certainly have more tests, however as of now the emulator
can not simulate ALU anomalies useful for this component. In particular the
capability of detecting stuck one or stuck zero address bits in the LDS and
STS instructions could be tested.



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



Case 10
------------------------------------------------------------------------------


Tests whether an LDS is executed. This is done by transforming it to a NOP,
expecting an according response.

ALU modification: Turns LDS into NOP.



Case 11
------------------------------------------------------------------------------


Tests whether an STS is executed. This is done by transforming it to a NOP,
expecting an according response.

ALU modification: Turns STS into NOP.
