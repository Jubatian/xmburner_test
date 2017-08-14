;
; XMBurner test - xmb_ram.s, case 4
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
; Tests whether xmb_ram_isramok can fail when there is a stuck 0 bit in a RAM
; cell.
;


#include <avr/io.h>
.include "ram_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  4

	; Prepare for test

	LD_FPTR_Z      xmb_ram_isramok
	MOD_STUCK_R16  0x00, 0xEF, RAMEND - 103 ; Stuck 0 bit
	MOD_ENA_R16

	; Run test

	rcall rut

	; If routine reports true (1), then failed.

	cpi   r24,     1
	breq  fail
	jmp   print_pass
fail:
	jmp   print_fail

rut:
	ijmp                   ; Needed to enable ALU mods



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	jmp   print_fail_val
