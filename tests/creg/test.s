;
; XMBurner test - CPU register tester
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


#include <avr/io.h>


.section .text


.global main
main:

	; This now should go onto the fault path with 00:FF due to the
	; execution chain guards are not set up.

	call  xmb_creg

	ldi   r16,     'F'
	ldi   r17,     '\n'
	sts   0x00E0,  r16
	sts   0x00E0,  r17

	ret



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	ldi   r16,     0x00
	sts   0x00F0,  r16     ; Cancel behaviour modifications

	ldi   r16,     'O'
	sts   0x00E0,  r16
	ldi   r16,     ':'
	sts   0x00E0,  r16
	ldi   r16,     ' '
	sts   0x00E0,  r16

	sts   0x00E2,  r25

	ldi   r16,     ':'
	sts   0x00E0,  r16

	sts   0x00E2,  r24

	ldi   r16,     '\n'
	sts   0x00E0,  r16

	ldi   r16,     0x00
	sts   0x00EC,  r16     ; Terminate program

	rjmp  .-2

