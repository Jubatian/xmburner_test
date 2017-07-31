;
; XMBurner test - xmb_crc.s, case 21
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
; Tests whether the CRC check in xmb_crc_isromok can fail if the CRC doesn't
; match (assuming actual CRC is not 0xFFFFFFFF, in case of failure this
; should be checked: if by accident the ROM's CRC actually has this CRC, the
; test will fail incorrectly)
;


#include <avr/io.h>
.include "crc_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  21

	; Prepare for test

	LD_FPTR_Z      xmb_crc_isromok
	MOD_STROM_R16  0xFF, 0xFF, BINSIZE - 4
	MOD_STROM_R16  0xFF, 0xFF, BINSIZE - 3
	MOD_STROM_R16  0xFF, 0xFF, BINSIZE - 2
	MOD_STROM_R16  0xFF, 0xFF, BINSIZE - 1
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
