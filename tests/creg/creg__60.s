;
; XMBurner test - xmb_creg.s, case 60
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
; Tests r0, bit 2 stuck 1 on xmb_creg_cr0.
;


#include <avr/io.h>
.include "creg_inc.inc"


.section .text


.global main
main:

	; Output test ID

	ldi   r22,     60
	ldi   r24,     lo8(creg_id)
	ldi   r25,     hi8(creg_id)
	call  print_test_id

	; Prepare for test

	ldi   r20,     (exec_id_from      ) & 0xFF
	ldi   r21,     (exec_id_from >>  8) & 0xFF
	ldi   r22,     (exec_id_from >> 16) & 0xFF
	ldi   r23,     (exec_id_from >> 24) & 0xFF
	ldi   r24,     lo8(pm(xmb_creg_cr0))
	ldi   r25,     hi8(pm(xmb_creg_cr0))

	ldi   r16,     0x04
	sts   0x00F1,  r16     ; Stuck bits, OR mask
	ldi   r16,     0xFF
	sts   0x00F1,  r16     ; Stuck bits, AND mask
	ldi   r16,     0x00
	sts   0x00F1,  r16     ; Stuck bits, address low (0x0000: r0)
	ldi   r16,     0x00
	sts   0x00F1,  r16     ; Stuck bits, address high
	ldi   r16,     0x5A
	sts   0x00F0,  r16     ; Enable behaviour mods on next ijmp

	; Run test

	call  runner_run

	; If routine completes, then fails

	jmp   print_fail_nodet



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	ldi   r16,     0x00
	sts   0x00F0,  r16     ; Cancel behaviour modifications

	; Evaulate

	cpi   r24,     0x02
	brcc  fail             ; Must be < 0x02
	cpi   r25,     0x00
	brne  fail

	; Passed test

	jmp   print_pass



;
; Failed test
;
fail:

	jmp   print_fail_val
