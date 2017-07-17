
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



Case 10
------------------------------------------------------------------------------


Tests whether it is detected when the CPSE instruction is unable to evaulate
to branch, on xmb_cond_cpse.

ALU modifications: Turns CPSE into a NOP.



Case 11
------------------------------------------------------------------------------


Tests whether it is detected when the CPSE instruction is unable to evaulate
to no-branch, on xmb_cond_cpse.

ALU modifications: Forces CPSE to always skip.



Case 20 - 27
------------------------------------------------------------------------------


Tests the BRBS instructions whether it is detected when they are unable to
evaulate to branch, on xmb_cond_brb1.

ALU modifications: Each case tests by turning a BRBS into a NOP.



Case 30 - 37
------------------------------------------------------------------------------


Tests the BRBS instructions whether it is detected when they are unable to
evaulate to no-branch, on xmb_cond_brb1.

ALU modifications: Each case tests by forcing a BRBS to always branch.



Case 40 - 47
------------------------------------------------------------------------------


Tests the BRBC instructions whether it is detected when they are unable to
evaulate to branch, on xmb_cond_brb1.

ALU modifications: Each case tests by turning a BRBC into a NOP.



Case 50 - 57
------------------------------------------------------------------------------


Tests the BRBC instructions whether it is detected when they are unable to
evaulate to no-branch, on xmb_cond_brb1.

ALU modifications: Each case tests by forcing a BRBC to always branch.



Case 60 - 67
------------------------------------------------------------------------------


Tests the SBRS instructions whether it is detected when they are unable to
evaulate to skip, on xmb_cond_sbr1.

ALU modifications: Each case tests by turning an SBRS into a NOP.



Case 70 - 77
------------------------------------------------------------------------------


Tests the SBRS instructions whether it is detected when they are unable to
evaulate to no-skip, on xmb_cond_sbr1.

ALU modifications: Each case tests by forcing an SBRS to always skip.



Case 80 - 87
------------------------------------------------------------------------------


Tests the SBRC instructions whether it is detected when they are unable to
evaulate to skip, on xmb_cond_sbr1.

ALU modifications: Each case tests by turning an SBRC into a NOP.



Case 90 - 97
------------------------------------------------------------------------------


Tests the SBRC instructions whether it is detected when they are unable to
evaulate to no-skip, on xmb_cond_sbr1.

ALU modifications: Each case tests by forcing an SBRC to always skip.



Case 100 - 107
------------------------------------------------------------------------------


Tests the SBIS instructions whether it is detected when they are unable to
evaulate to skip, on xmb_cond_sbi1.

ALU modifications: Each case tests by turning an SBIS into a NOP.



Case 110 - 117
------------------------------------------------------------------------------


Tests the SBIS instructions whether it is detected when they are unable to
evaulate to no-skip, on xmb_cond_sbi1.

ALU modifications: Each case tests by forcing an SBIS to always skip.



Case 120 - 127
------------------------------------------------------------------------------


Tests the SBIC instructions whether it is detected when they are unable to
evaulate to skip, on xmb_cond_sbi1.

ALU modifications: Each case tests by turning an SBIC into a NOP.



Case 130 - 137
------------------------------------------------------------------------------


Tests the SBIC instructions whether it is detected when they are unable to
evaulate to no-skip, on xmb_cond_sbi1.

ALU modifications: Each case tests by forcing an SBIC to always skip.
