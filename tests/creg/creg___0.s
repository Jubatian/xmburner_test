;
; XMBurner test - xmb_creg.s, case 0
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
; Tests whether the execution chain functions properly.
;


#include <avr/io.h>
.include "creg_inc.inc"


.section .text


.global main
main:

	; Output test ID

	ldi   r22,     0
	ldi   r24,     lo8(creg_id)
	ldi   r25,     hi8(creg_id)
	call  print_test_id

	; Prepare for test
	; Try to call the xmb_creg routine without a suitable execution chain
	; value

	clr   r20
	clr   r21
	clr   r22
	clr   r23
	ldi   r24,     lo8(pm(xmb_creg))
	ldi   r25,     hi8(pm(xmb_creg))

	; Run test

	call  runner_run

	; If routine completes, then failed

	call  print_fail_nodet
	rjmp  exit



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	ldi   r16,     0x00
	sts   0x00F0,  r16     ; Cancel behaviour modifications

	; Evaulate

	cpi   r24,     0xFF
	brne  fail
	cpi   r25,     0x00
	brne  fail

	; Passed test

	call  print_pass
	rjmp  exit



;
; Failed test
;
fail:

	call  print_fail_val
	rjmp  exit



;
; Done, exit
;
exit:

	ldi   r16,     0x00
	sts   0x00EC,  r16     ; Terminate program
	rjmp  .-2


.section .data

dummy:
	.space 4
