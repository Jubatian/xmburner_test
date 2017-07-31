;
; XMBurner test - xmb_crc.s, case 2
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
; Tests whether the CRC check can pass (a full cycle) on a correctly
; operating microcontroller.
;


#include <avr/io.h>
.include "crc_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  2

	; Prepare for test

	call  xmb_crc_init
	ldi   XL,      lo8(BINSIZE / 64)
	ldi   XH,      hi8(BINSIZE / 64)

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

	; If full cycle completes, then passes

	jmp   print_pass



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	; Failed test

	jmp   print_fail_val
