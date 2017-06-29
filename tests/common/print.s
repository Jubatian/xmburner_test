;
; XMBurner test - Common output routines for tests
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



;
; Print a zero terminated string
;
; Inputs:
; r25:r24: Pointer to string in ROM
; Clobbers:
; r24, r25, Z
;
.global print_str
print_str:

	movw  ZL,      r24
print_str_l:
	lpm   r24,     Z+      ; Read character
	cpi   r24,     0
	breq  print_str_le
	sts   0x00E0,  r24     ; Write to character output port (emulator)
	rjmp  print_str_l
print_str_le:
	ret



;
; Print test identifier and result prompt
;
; Inputs:
; r25:r24: Pointer to test group name in ROM
;     r22: Test identifier
; Clobbers:
; r24, r25, X, Z
;
.global print_test_id
print_test_id:

	ldi   XL,      '\n'
	sts   0x00E0,  XL

	movw  XL,      r24
	ldi   r24,     lo8(print_str_test)
	ldi   r25,     hi8(print_str_test)
	rcall print_str

	mov   r24,     XL
	rcall print_str

	ldi   XL,      ' '
	sts   0x00E0,  XL      ; Write to character output port (emulator)
	ldi   XL,      '('
	sts   0x00E0,  XL
	sts   0x00E1,  r22     ; Write to decimal output port (emulator)
	ldi   XL,      ')'
	sts   0x00E0,  XL
	ldi   XL,      '\n'
	sts   0x00E0,  XL

	ldi   r24,     lo8(print_str_result)
	ldi   r25,     hi8(print_str_result)
	rjmp  print_str



;
; Print test result: 'PASS'
;
; Inputs:
; Clobbers:
; r24, r25, Z
;
.global print_pass
print_pass:

	ldi   r24,     lo8(print_str_pass)
	ldi   r25,     hi8(print_str_pass)
	rjmp  print_str



;
; Print test result: 'FAIL'
;
; Inputs:
; Clobbers:
; r24, r25, Z
;
.global print_fail
print_fail:

	ldi   r24,     lo8(print_str_fail)
	ldi   r25,     hi8(print_str_fail)
	rjmp  print_str



print_str_test:
	.byte 'T', 'e', 's', 't', ':', ' ', 0

print_str_result:
	.byte 'R', 'e', 's', 'u', 'l', 't', ':', ' ', 0

print_str_pass:
	.byte 'P', 'A', 'S', 'S', 0

print_str_fail:
	.byte 'F', 'A', 'I', 'L', 0

; Fix alignment for further code

.balign 2