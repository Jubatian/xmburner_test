;
; XMBurner test - xmb_log.s, case 205
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
; Tests whether the COM instruction is executed and the C flag is examined.
;


#include <avr/io.h>
.include "log_inc.inc"


.section .text


.global main
main:

	; Output test ID

	PRINT_TEST_ID  205

	; Prepare for test

	LD_FPTR_R24_25 xmb_log_test
	MOD_FLAG_R16   0xFE0F, 0x9400, 0x01, 0xFF ; COM, C flag always set
	MOD_ENA_R16

	; Run test

	call  runner_run

	; Normally failure should be passing without detection, but since COM
	; generates a fixed '1' carry, this anomaly is redundant, so this must
	; pass.

	jmp   print_pass



;
; XMBurner fault handler
;
.global xmb_fault
xmb_fault:

	MOD_DIS_R16

	jmp   print_fail_val
