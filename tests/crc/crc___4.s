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
; Tests whether the two CRC algorithms are compared to each other by causing
; incorrect calculation in the table based CRC.
;


#include <avr/io.h>
.include "crc_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  4

	; Prepare for test

	call  xmb_crc_init
	LD_FPTR_R24_25 xmb_crc_ccalc
	ldi   XL,      lo8(BINSIZE / 64)
	ldi   XH,      hi8(BINSIZE / 64)
	MOD_NOP_R16    0xFC00, 0x9C00 ; MUL turned into NOP
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

	; Evaulate

	cpi   r24,     0x01
	brcs  fail             ; Must be 0x01 (Compare error)
	cpi   r25,     0x03
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
