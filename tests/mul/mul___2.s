;
; XMBurner test - xmb_mul.s, case 2
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
; Tests whether the included PRNG covers the full 16 bit sequence.
;


#include <avr/io.h>
.include "mul_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  2

	; Prepare for test

	ldi   r24,     0
	ldi   r25,     0       ; PRNG start value
	ldi   r16,     0
	ldi   r17,     0       ; Execution counter, also fail value

	; Run test

	; Checks whether for 65535 iterations the PRNG result is nonzero, then
	; in the 65536th, it is zero. This can not happen in any other way
	; than by the PRNG covering all the 2^16 possible values as it has no
	; other state.

ploop:
	call  xmb_mul_prng
	subi  r16,     0xFF
	sbci  r17,     0xFF    ; Add 1, Z flag set at the 2^16th iteration
	breq  ploope
	ldi   r23,     0
	cp    r24,     r23
	cpc   r25,     r23
	brne  ploop            ; PRNG must not return to zero before the 2^16th iteration
	movw  r24,     r16
	rjmp  xmb_fault
ploope:
	ldi   r23,     0
	cp    r24,     r23
	cpc   r25,     r23
	movw  r24,     r16
	brne  xmb_fault        ; PRNG must return to zero in the 2^16th iteration

	; If routine completes, then passes

	jmp   print_pass



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	; Failed test

	jmp   print_fail_val
