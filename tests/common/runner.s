;
; XMBurner test - Runner for XMBurner components
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
; Starts a given XMBurner function with the appropriate head. Note that when
; simulation ALU anomalies, it may be desirable to enable them after entry to
; the actual function under test.
;
; Inputs:
; r25:r24: Function pointer to the XMBurner component to start
; r23:r22: Execution chain value, high word
; r21:r20: Execution chain value, low word
; Clobbers:
; r18 - XH, ZL, ZH
;
.global runner_run
runner_run:

	; Save registers the C ABI requires to preserve

	push  YH
	push  YL
	push  r17
	push  r16
	push  r15
	push  r14
	push  r13
	push  r12
	push  r11
	push  r10
	push  r9
	push  r8
	push  r7
	push  r6
	push  r5
	push  r4
	push  r3
	push  r2

	; Prepare execution chain similarly to xmb_main

	ldi   ZL,      lo8(xmb_glob_chain)
	ldi   ZH,      hi8(xmb_glob_chain)
	movw  r16,     r20
	movw  r18,     r22
	ldi   r20,     0x00
	std   Z + 2,   r20
	std   Z + 3,   r20

	; Call XMBurner function

	movw  ZL,      r24
	ijmp
