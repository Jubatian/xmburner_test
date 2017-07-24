
Test case descriptions
==============================================================================

:Author:    Sandor Zsuga (Jubatian)
:License:   GNU GPLv3 (version 3 of the GNU General Public License)




Overview
------------------------------------------------------------------------------


This is a brief summary of what each test case are doing, for reference. For
the more accurate description of each test, see the corresponding source.

It is not possible to test this component using this automated method since
ALU failures are expected to cause it jumping to undefined locations. The
goal of the component is to cause an incapability of completion with
reasonably good certainty on a failing ALU, which, by the proper chaining of
components can result in a total failure (instead of a lurking one causing
incorrect function in the application program).

These tests cover only the basic functionality to see whether the component
goes through the intended execution path.



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



Case 10-17
------------------------------------------------------------------------------


Disables positive ranges of BRBS / BRBC instructions on xmb_jump_branch. The
reaction to each should be a properly detected failure.

ALU modifications: Turns various BRBS / BRBC instructions into NOPs.



Case 20-27
------------------------------------------------------------------------------


Disables negative ranges of BRBS / BRBC instructions on xmb_jump_branch. The
reaction to each should be a properly detected failure.

ALU modifications: Turns various BRBS / BRBC instructions into NOPs.



Case 30-37
------------------------------------------------------------------------------


Disables positive ranges (within -64 to +63 words) of the RJMP / RCALL
instructions on xmb_jump_rjump. The reaction to each should be a properly
detected failure.

ALU modifications: Turns various RJMP / RCALL instructions into NOPs.



Case 40-47
------------------------------------------------------------------------------


Disables negative ranges (within -64 to +63 words) of RJMP / RCALL
instructions on xmb_jump_rjump. The reaction to each should be a properly
detected failure.

ALU modifications: Turns various RJMP / RCALL instructions into NOPs.
