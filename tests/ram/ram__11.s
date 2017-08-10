;
; XMBurner test - xmb_ram.s, case 11
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
; Tests whether a decrement fault of a pointer is caught.
;


#include <avr/io.h>
.include "ram_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  11

	; Prepare for test

	call  xmb_ram_init
	ldi   XL,      lo8((RAMEND + 1 - RAMSTART) / 16)
	ldi   XH,      hi8((RAMEND + 1 - RAMSTART) / 16)
	MOD_INCDEC_R16 RAMSTART + 255, 0x22 ; LD(-ptr) doesn't decrement for a value
	MOD_ENA_R16

	; Run test

main_l:
	push  XL
	push  XH
	LD_FPTR_R24_25 xmb_ram_check
	call  runner_run
	pop   XH
	pop   XL
	sbiw  XL,      1
	brne  main_l

	; If routine completes, then fails

	jmp   print_fail_nodet



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	; Evaluate

	cpi   r24,     0x03
	brne  fail             ; Must be 0x03 (inc/dec fault)
	cpi   r25,     0x04
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
