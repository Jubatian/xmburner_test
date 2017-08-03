;
; XMBurner test - xmb_ram.s, case 25
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
; Tests RAM location bit 5 stuck 0 on xmb_ram_check
;


#include <avr/io.h>
.include "ram_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  25

	; Prepare for test

	call  xmb_ram_init
	ldi   XL,      lo8((RAMEND + 1 - RAMSTART) / 16)
	ldi   XH,      hi8((RAMEND + 1 - RAMSTART) / 16)
	MOD_STUCK_R16  0x00, 0xDF, RAMEND - 27 ; Stuck 0 bit
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

	cpi   r24,     0x01
	brne  fail             ; Must be 0x01
	cpi   r25,     0x04
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
