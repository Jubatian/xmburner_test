;
; XMBurner test - xmb_cond.s, case 1
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
; Tests whether the module can pass on a correctly operating microcontroller.
;


#include <avr/io.h>
.include "cond_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  1

	; Prepare for test
	; Set up the execution chain value correctly

	LD_QUAD_R20_23 exec_id_from
	LD_FPTR_R24_25 xmb_cond

	; Run test

	call  runner_run

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
