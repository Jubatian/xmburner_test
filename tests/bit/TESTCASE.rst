
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


Tests whether the CBI instruction is executed and compared for each bit. This
is done by setting CBI instructions addressing individual bits to NOPs and
checking whether the anomaly is caught.

ALU modifications: CBI instructions are transformed to NOPs.



Case 30 - 37
------------------------------------------------------------------------------


Tests whether the SBI instruction is executed and compared for each bit. This
is done by setting SBI instructions addressing individual bits to NOPs and
checking whether the anomaly is caught.

ALU modifications: SBI instructions are transformed to NOPs.



Case 40 - 47
------------------------------------------------------------------------------


Tests whether the BST instruction is executed and compared for each bit. This
is done by setting BST instructions addressing individual bits to NOPs and
checking whether the anomaly is caught.

ALU modifications: BST instructions are transformed to NOPs.



Case 50 - 57
------------------------------------------------------------------------------


Tests whether the BLD instruction is executed and compared for each bit. This
is done by setting BLD instructions addressing individual bits to NOPs and
checking whether the anomaly is caught.

ALU modifications: BLD instructions are transformed to NOPs.
