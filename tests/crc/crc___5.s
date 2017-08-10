;
; XMBurner test - xmb_crc.s, case 4
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
; Tests whether the pointer increment's flaw in the LPM instruction is
; detected.
;


#include <avr/io.h>
.include "crc_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  5

	; Prepare for test

	call  xmb_crc_init
	ldi   XL,      lo8(BINSIZE / 64)
	ldi   XH,      hi8(BINSIZE / 64)
	MOD_INCDEC_R16 (BINSIZE - 0x11), 0x19 ; LPM(Z+) for pointer (BINSIZE - 0x11) fails
	MOD_ENA_R16

	; Run test

main_l:
	push  XL
	push  XH
	LD_FPTR_R24_25 xmb_crc_ccalc
	call  runner_run
	pop   XH
	pop   XL
	sbiw  XL,      1
	brne  main_l

	; If full cycle completes, then fails (doesn't detect increment error,
	; that is, truly it is likely stuck somewhere within the cycle never
	; completing it)

	jmp   print_fail_nodet



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	; Evaluate

	cpi   r24,     0x03
	brcs  fail             ; Must be 0x03 (Increment error)
	cpi   r25,     0x03
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
