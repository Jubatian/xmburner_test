######################
# Make - definitions #
######################
#
#  Copyright (C) 2017
#    Sandor Zsuga (Jubatian)
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
#
# This file holds general definitions used by any makefile, like compiler
# flags, optimization and such. OS - specific building schemes should also
# be written here.
#
#

CC      = avr-gcc
MCU     = atmega644

## Compile options common for all C compilation units.
CFLAGS  = -mmcu=$(MCU)
CFLAGS += -Wall -gdwarf-2 -std=gnu99 -Os -fsigned-char -ffunction-sections
CFLAGS += -fno-toplevel-reorder -fno-tree-switch-conversion

## Assembly specific flags
ASMFLAGS  = $(CFLAGS)
ASMFLAGS += -x assembler-with-cpp -Wa,-gdwarf2

## Linker flags
LDFLAGS  = -mmcu=$(MCU)
LDFLAGS += -Wl,-gc-sections

## Intel Hex file production flags
HEX_FLASH_FLAGS = -R .eeprom
