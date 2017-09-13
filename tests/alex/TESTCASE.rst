
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


Tests whether NEG is executed and compared on xmb_alex_neg. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns NEG into NOP.



Case 11 - 16
------------------------------------------------------------------------------


Tests each of the C, Z, N, V, S and H flags whether they are compared. This is
done by masking a flag bit to zero for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V, S and H is masked to zero for NEG.



Case 21 - 26
------------------------------------------------------------------------------


Tests each of the C, Z, N, V, S and H flags whether they are compared. This is
done by masking a flag bit to one for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V, S and H is masked to one for NEG.



Case 30
------------------------------------------------------------------------------


Tests whether INC is executed and compared on xmb_alex_idec. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns INC into NOP.



Case 32 - 35
------------------------------------------------------------------------------


Tests each of the Z, N, V and S flags whether they are compared. This is done
by masking a flag bit to zero for each of the tests and expecting an according
response.

ALU modification: One of Z, N, V and S is masked to zero for INC.



Case 42 - 45
------------------------------------------------------------------------------


Tests each of the Z, N, V and S flags whether they are compared. This is done
by masking a flag bit to one for each of the tests and expecting an according
response.

ALU modification: One of Z, N, V, and S is masked to one for INC.



Case 50
------------------------------------------------------------------------------


Tests whether DEC is executed and compared on xmb_alex_idec. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns DEC into NOP.



Case 52 - 55
------------------------------------------------------------------------------


Tests each of the Z, N, V and S flags whether they are compared. This is done
by masking a flag bit to zero for each of the tests and expecting an according
response.

ALU modification: One of Z, N, V and S is masked to zero for DEC.



Case 62 - 65
------------------------------------------------------------------------------


Tests each of the Z, N, V and S flags whether they are compared. This is done
by masking a flag bit to one for each of the tests and expecting an according
response.

ALU modification: One of Z, N, V, and S is masked to one for DEC.



Case 70
------------------------------------------------------------------------------


Tests whether ASR is executed and compared on xmb_alex_shr. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns ASR into NOP.



Case 71 - 75
------------------------------------------------------------------------------


Tests each of the C, Z, N, V and S flags whether they are compared. This is
done by masking a flag bit to zero for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V and S is masked to zero for ASR.



Case 81 - 85
------------------------------------------------------------------------------


Tests each of the C, Z, N, V and S flags whether they are compared. This is
done by masking a flag bit to one for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V and S is masked to one for ASR.



Case 90
------------------------------------------------------------------------------


Tests whether LSR is executed and compared on xmb_alex_shr. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns LSR into NOP.



Case 91 - 95
------------------------------------------------------------------------------


Tests each of the C, Z, N, V and S flags whether they are compared. This is
done by masking a flag bit to zero for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V and S is masked to zero for LSR.



Case 101 - 105
------------------------------------------------------------------------------


Tests each of the C, Z, N, V and S flags whether they are compared. This is
done by masking a flag bit to one for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V and S is masked to one for LSR.



Case 110
------------------------------------------------------------------------------


Tests whether ROR is executed and compared on xmb_alex_shr. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns ROR into NOP.



Case 111 - 115
------------------------------------------------------------------------------


Tests each of the C, Z, N, V and S flags whether they are compared. This is
done by masking a flag bit to zero for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V and S is masked to zero for ROR.



Case 121 - 125
------------------------------------------------------------------------------


Tests each of the C, Z, N, V and S flags whether they are compared. This is
done by masking a flag bit to one for each of the tests and expecting an
according response.

ALU modification: One of C, Z, N, V and S is masked to one for ROR.



Case 130
------------------------------------------------------------------------------


Tests whether SWAP is executed and compared on xmb_alex_swap. This is done by
transforming it to a NOP, expecting an according response.

ALU modification: Turns SWAP into NOP.
