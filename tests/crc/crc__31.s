;
; XMBurner test - xmb_crc.s, case 31
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
; Tests xmb_crc_isramok with bad CRC.
;


#include <avr/io.h>
.include "crc_inc.inc"



.section .data

buf:
	.space 16


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  31

	; Prepare for test

	ldi   ZL,      lo8(buf)
	ldi   ZH,      hi8(buf)
	ldi   r16,     0x45
	st    Z+,      r16
	ldi   r16,     0x91
	st    Z+,      r16
	ldi   r16,     0xF2
	st    Z+,      r16
	ldi   r16,     0x47
	st    Z+,      r16
	ldi   r16,     0xBD
	st    Z+,      r16
	ldi   r16,     0xFF    ; Bad CRC
	st    Z+,      r16
	st    Z+,      r16
	st    Z+,      r16
	st    Z+,      r16

	; Run test

	ldi   r24,     lo8(buf)
	ldi   r25,     hi8(buf)
	ldi   r22,     9
	ldi   r23,     0       ; Length of buffer with (bad) CRC32
	call  xmb_crc_isramok

	; If routine reports true (1), then failed.

	cpi   r24,     1
	breq  fail
	jmp   print_pass
fail:
	jmp   print_fail



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	jmp   print_fail_val
