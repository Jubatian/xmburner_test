;
; XMBurner test - xmb_absa.s, case 11
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
; Tests whether the STS instruction is executed.
;


#include <avr/io.h>
.include "absa_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  11

	; Prepare for test

	LD_FPTR_R24_25 xmb_absa_check
	MOD_NOP_R16    0xFE0F, 0x9200 ; STS turned into NOP
	MOD_ENA_R16

	; Run test

	call  runner_run

	; If routine completes, then failed

	ldi   ZL,      lo8(0x00F0)
	ldi   ZH,      hi8(0x00F0)
	ldi   r16,     0x00
	st    Z,       r16     ; Disable behavior mods (STS is unavailable!)

	jmp   print_fail_nodet



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	ldi   ZL,      lo8(0x00F0)
	ldi   ZH,      hi8(0x00F0)
	ldi   r16,     0x00
	st    Z,       r16     ; Disable behavior mods (STS is unavailable!)

	; Evaluate

	cpi   r24,     0x00
	brne  fail             ; Must be 0x00
	cpi   r25,     0x0C
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
