############
# Makefile #
############
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
# The main makefile of the test. XMBurner and the Emulator is assumed to be
# already built when executing this Makefile.
#
#
# make all (or make): build the program
# make clean:         to clean up
#
#

include ../../Make_defines.mk

# XMBurner components

XMB_PATH_OBJ = ../../../xmburner/_xmb_o_

# Emulator

EMU_PATH = ../../../xmburner_aluemu
EMU = $(EMU_PATH)/aluemu

# Paths (they are assumed to exist)

REP = ../../_rep_
HEX = ../../_hex_

# Output

OUT = $(REP)/creg.txt

# Usual object depencies of test cases

OBJDEPS  = $(HEX)/print.o $(HEX)/creg_id.o
OBJDEPS += $(XMB_PATH_OBJ)/xmb_creg.o $(XMB_PATH_OBJ)/xmb_glob.o

# Usual compile dependencies of test cases

CDEPS = creg_inc.inc

# List of test results

TESTRES  = $(REP)/creg___0.txt


# Build tests

all: $(OUT)

$(OUT): $(TESTRES)
	cat $(TESTRES) > $@


# 0

$(REP)/creg___0.txt: $(HEX)/creg___0.hex
	$(EMU) $(HEX)/creg___0.hex > $@

$(HEX)/creg___0.hex: $(HEX)/creg___0.elf
	avr-objcopy -O ihex $(HEX_FLASH_FLAGS) $< $@

$(HEX)/creg___0.elf: $(HEX)/creg___0.o $(OBJDEPS)
	$(CC) $(LDFLAGS) $(HEX)/creg___0.o $(OBJDEPS) -o $@

$(HEX)/creg___0.o: creg___0.s $(CDEPS)
	$(CC) $(ASMFLAGS) -c $< -o $@


# Common elements

$(HEX)/print.o: ../common/print.s
	$(CC) $(ASMFLAGS) -c $< -o $@

$(HEX)/creg_id.o: creg_id.s
	$(CC) $(ASMFLAGS) -c $< -o $@


.PHONY: all
