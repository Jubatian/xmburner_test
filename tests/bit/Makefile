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

# Target name (XMBurner component)

TARGET = bit

# XMBurner components

XMB_PATH_OBJ = ../../../xmburner/_xmb_o_

# Emulator

EMU_PATH = ../../../xmburner_aluemu
EMU = $(EMU_PATH)/aluemu

# Paths (they are assumed to exist)

REP = ../../_rep_
HEX = ../../_hex_

# Output

OUT = $(REP)/$(TARGET).txt

# Usual object depencies of test cases

OBJDEPS  = $(HEX)/print.o $(HEX)/runner.o $(HEX)/$(TARGET)_id.o
OBJDEPS += $(XMB_PATH_OBJ)/xmb_$(TARGET).o $(XMB_PATH_OBJ)/xmb_glob.o

# Usual compile dependencies of test cases

CDEPS = $(TARGET)_inc.inc

# List of test results

TESTRES  = $(REP)/bit___0.txt
TESTRES += $(REP)/bit___1.txt
TESTRES += $(REP)/bit__20.txt
TESTRES += $(REP)/bit__21.txt
TESTRES += $(REP)/bit__22.txt
TESTRES += $(REP)/bit__23.txt
TESTRES += $(REP)/bit__24.txt
TESTRES += $(REP)/bit__25.txt
TESTRES += $(REP)/bit__26.txt
TESTRES += $(REP)/bit__27.txt
TESTRES += $(REP)/bit__30.txt
TESTRES += $(REP)/bit__31.txt
TESTRES += $(REP)/bit__32.txt
TESTRES += $(REP)/bit__33.txt
TESTRES += $(REP)/bit__34.txt
TESTRES += $(REP)/bit__35.txt
TESTRES += $(REP)/bit__36.txt
TESTRES += $(REP)/bit__37.txt
TESTRES += $(REP)/bit__40.txt
TESTRES += $(REP)/bit__41.txt
TESTRES += $(REP)/bit__42.txt
TESTRES += $(REP)/bit__43.txt
TESTRES += $(REP)/bit__44.txt
TESTRES += $(REP)/bit__45.txt
TESTRES += $(REP)/bit__46.txt
TESTRES += $(REP)/bit__47.txt
TESTRES += $(REP)/bit__50.txt
TESTRES += $(REP)/bit__51.txt
TESTRES += $(REP)/bit__52.txt
TESTRES += $(REP)/bit__53.txt
TESTRES += $(REP)/bit__54.txt
TESTRES += $(REP)/bit__55.txt
TESTRES += $(REP)/bit__56.txt
TESTRES += $(REP)/bit__57.txt


# Build tests

all: $(OUT)

$(OUT): $(REP)/$(TARGET)_m.txt $(REP)/$(TARGET)_s.txt
	cat $(REP)/$(TARGET)_m.txt $(REP)/$(TARGET)_s.txt > $@

$(REP)/$(TARGET)_s.txt: $(REP)/$(TARGET)_m.txt
	../common/summary.sh $(TARGET) $< > $@

$(REP)/$(TARGET)_m.txt: $(TESTRES)
	cat $(TESTRES) > $@


# Test cases

$(TESTRES): $(REP)/%.txt: $(HEX)/%.hex
	$(EMU) $< > $@

$(HEX)/%.hex: $(HEX)/%.elf
	avr-objcopy -O ihex $(HEX_FLASH_FLAGS) $< $@

$(HEX)/%.elf: $(HEX)/%.o $(OBJDEPS)
	$(CC) $(LDFLAGS) $(OBJDEPS) $< -o $@

$(HEX)/%.o: %.s $(CDEPS)
	$(CC) $(ASMFLAGS) -c $< -o $@


# Common elements

$(HEX)/print.o: ../common/print.s
	$(CC) $(ASMFLAGS) -c $< -o $@

$(HEX)/runner.o: ../common/runner.s
	$(CC) $(ASMFLAGS) -c $< -o $@

$(HEX)/$(TARGET)_id.o: $(TARGET)_id.s
	$(CC) $(ASMFLAGS) -c $< -o $@


.PHONY: all
