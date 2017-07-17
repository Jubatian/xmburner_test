;
; XMBurner test - xmb_creg.s, case 156
;
; Copyright (C) 2017 Sandor Zsuga (Jubatian)
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
; Tests r16, bit 2 stuck 1 on xmb_creg_cr1.
;


#include <avr/io.h>
.include "creg_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  156

	; Prepare for test

	LD_FPTR_R24_25 xmb_creg_cr1
	MOD_STUCK_R16  0x04, 0xFF, 0x0010 ; Stuck bits on r16
	MOD_ENA_R16

	; Run test

	call  runner_run

	; If routine completes, then fails

	jmp   print_fail_nodet



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	; Evaulate

	cpi   r24,     0x04
	brcc  fail             ; Must be < 0x04
	cpi   r24,     0x02
	brcs  fail             ; Must be >= 0x02
	cpi   r25,     0x00
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val