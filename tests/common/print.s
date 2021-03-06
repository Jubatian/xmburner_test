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

	movw  XL,      r24
	ldi   r24,     lo8(print_str_test)
	ldi   r25,     hi8(print_str_test)
	rcall print_str

	movw  r24,     XL
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
; Print test result: 'PASS' and terminate.
;
; Inputs:
; Clobbers:
; r24, r25, Z
;
.global print_pass
print_pass:

	ldi   ZL,      0x00
	sts   0x00F0,  ZL      ; Disable behavior mods (if still enabled)

	ldi   r24,     lo8(print_str_pass)
	ldi   r25,     hi8(print_str_pass)
	rcall print_str

	rjmp  print_exit



;
; Print test result: 'PASS' with early detection notification and terminate.
;
; Inputs:
; r25:r24: Extra info (printed as two hex values, r25:r24 order)
; Clobbers:
; r24, r25, X, Z
;
.global print_pass_early
print_pass_early:

	ldi   ZL,      0x00
	sts   0x00F0,  ZL      ; Disable behavior mods (if still enabled)

	movw  XL,      r24

	ldi   r24,     lo8(print_str_pass)
	ldi   r25,     hi8(print_str_pass)
	rcall print_str

	ldi   r24,     lo8(print_str_early)
	ldi   r25,     hi8(print_str_early)
	rcall print_str

	sts   0x00E2,  XH      ; Write to hexadecimal output port (emulator)
	ldi   r24,     ':'
	sts   0x00E0,  r24
	sts   0x00E2,  XL
	ldi   r24,     ')'
	sts   0x00E0,  r24

	rjmp  print_exit



;
; Print test result: 'FAIL' and terminate.
;
; Inputs:
; Clobbers:
; r24, r25, Z
;
.global print_fail
print_fail:

	ldi   ZL,      0x00
	sts   0x00F0,  ZL      ; Disable behavior mods (if still enabled)

	ldi   r24,     lo8(print_str_fail)
	ldi   r25,     hi8(print_str_fail)
	rcall print_str

	rjmp  print_exit



;
; Print test result: 'FAIL (No detection)' and terminate.
;
; Inputs:
; Clobbers:
; r24, r25, Z
;
.global print_fail_nodet
print_fail_nodet:

	ldi   ZL,      0x00
	sts   0x00F0,  ZL      ; Disable behavior mods (if still enabled)

	ldi   r24,     lo8(print_str_fail)
	ldi   r25,     hi8(print_str_fail)
	rcall print_str

	ldi   r24,     lo8(print_str_nodet)
	ldi   r25,     hi8(print_str_nodet)
	rcall print_str

	rjmp  print_exit



;
; Print test result: 'FAIL' with some extra info and terminate.
;
; Inputs:
; r25:r24: Extra info (printed as two hex values, r25:r24 order)
; Clobbers:
; r24, r25, X, Z
;
.global print_fail_val
print_fail_val:

	ldi   ZL,      0x00
	sts   0x00F0,  ZL      ; Disable behavior mods (if still enabled)

	movw  XL,      r24

	ldi   r24,     lo8(print_str_fail)
	ldi   r25,     hi8(print_str_fail)
	rcall print_str

	ldi   r24,     ' '
	sts   0x00E0,  r24     ; Write to character output port (emulator)
	ldi   r24,     '('
	sts   0x00E0,  r24
	sts   0x00E2,  XH      ; Write to hexadecimal output port (emulator)
	ldi   r24,     ':'
	sts   0x00E0,  r24
	sts   0x00E2,  XL
	ldi   r24,     ')'
	sts   0x00E0,  r24

	rjmp  print_exit



print_exit:

	ldi   r16,     0x00
	sts   0x00E7,  r16     ; Terminate program (emulator)
	rjmp  .-2



print_str_test:
	.byte 'T', 'e', 's', 't', ':', ' ', 0

print_str_result:
	.byte 'R', 'e', 's', 'u', 'l', 't', ':', ' ', 0

print_str_pass:
	.byte 'P', 'A', 'S', 'S', 0

print_str_fail:
	.byte 'F', 'A', 'I', 'L', 0

print_str_nodet:
	.byte ' ', '(', 'N', 'o', ' ', 'd', 'e', 't', 'e', 'c', 't', 'i', 'o', 'n', ')', 0

print_str_early:
	.byte ' ', '(', 'E', 'a', 'r', 'l', 'y', ':', ' ', 0

; Fix alignment for further code

.balign 2
