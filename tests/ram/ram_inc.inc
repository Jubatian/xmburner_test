;
; XMBurner test - xmb_ram.s, Constants & Macros
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


.set exec_id_from, 0x4186EF39


.macro LD_QUAD_R20_23 v32
	ldi   r20,     ((\v32)      ) & 0xFF
	ldi   r21,     ((\v32) >>  8) & 0xFF
	ldi   r22,     ((\v32) >> 16) & 0xFF
	ldi   r23,     ((\v32) >> 24) & 0xFF
.endm


.macro LD_FPTR_R24_25 fptr
	ldi   r24,     lo8(pm(\fptr))
	ldi   r25,     hi8(pm(\fptr))
.endm


.macro LD_FPTR_Z fptr
	ldi   ZL,      lo8(pm(\fptr))
	ldi   ZH,      hi8(pm(\fptr))
.endm


.macro PRINT_TEST_ID id
	ldi   r22,     (\id)
	ldi   r24,     lo8(crc_id)
	ldi   r25,     hi8(crc_id)
	call  print_test_id
.endm


;
; Enable behaviour mods on next ijmp
;
.macro MOD_ENA_R16
	ldi   r16,     0x5A
	sts   0x00F0,  r16
.endm


;
; Disable behaviour mods
;
.macro MOD_DIS_R16
	ldi   r16,     0x00
	sts   0x00F0,  r16
.endm


;
; Stuck bits modification (OR mask, AND mask, address)
;
.macro MOD_STUCK_R16 mor mand addr
	ldi   r16,     \mor
	sts   0x00F1,  r16     ; Stuck bits, OR mask
	ldi   r16,     \mand
	sts   0x00F1,  r16     ; Stuck bits, AND mask
	ldi   r16,     lo8(\addr)
	sts   0x00F1,  r16     ; Stuck bits, address low
	ldi   r16,     hi8(\addr)
	sts   0x00F1,  r16     ; Stuck bits, address high
.endm
