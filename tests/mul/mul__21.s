;
; XMBurner test - xmb_mul.s, case 21
;
; Copyright (C) 2018 Sandor Zsuga (Jubatian)
;
;  This program is free software: you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation, either version 3 of the License, or
;  (at your option) any later version.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;
;
; Tests whether the MULS instruction is executed and the C flag is examined.
;


#include <avr/io.h>
.include "mul_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  21

	; Prepare for test

	call  xmb_mul_init
	LD_FPTR_R24_25 xmb_mul_test
	MOD_FLAG_R16   0xFF00, 0x0200, 0x00, 0xFE ; MULS, C flag always clear
	MOD_ENA_R16

	; Run test

	call  runner_run

	; If routine completes, then failed

	jmp   print_fail_nodet



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	; Evaluate

	cpi   r24,     0x01
	brne  fail             ; Must be 0x01
	cpi   r25,     0x0B
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
