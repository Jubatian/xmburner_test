;
; XMBurner test - xmb_crc.s, case 20
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
; Tests xmb_crc_isromok on a correctly operating microcontroller.
;


#include <avr/io.h>
.include "crc_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  20

	; Prepare for test

	; Run test

	call  xmb_crc_isromok

	; If routine reports true (1), then passed.

	cpi   r24,     1
	breq  pass
	jmp   print_fail
pass:
	jmp   print_pass



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	jmp   print_fail_val
