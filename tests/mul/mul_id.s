;
; XMBurner test - xmb_mul.s, Test ID string
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


#include <avr/io.h>


.section .text


.global mul_id
mul_id:
	.byte 'x', 'm', 'b', '_', 'm', 'u', 'l', '.', 's', 0

.balign 2
