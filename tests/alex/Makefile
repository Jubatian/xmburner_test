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

TARGET = alex

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

TESTRES  = $(REP)/alex___0.txt
TESTRES += $(REP)/alex___1.txt
TESTRES += $(REP)/alex__10.txt
TESTRES += $(REP)/alex__11.txt
TESTRES += $(REP)/alex__12.txt
TESTRES += $(REP)/alex__13.txt
TESTRES += $(REP)/alex__14.txt
TESTRES += $(REP)/alex__15.txt
TESTRES += $(REP)/alex__16.txt
TESTRES += $(REP)/alex__21.txt
TESTRES += $(REP)/alex__22.txt
TESTRES += $(REP)/alex__23.txt
TESTRES += $(REP)/alex__24.txt
TESTRES += $(REP)/alex__25.txt
TESTRES += $(REP)/alex__26.txt
TESTRES += $(REP)/alex__30.txt
TESTRES += $(REP)/alex__32.txt
TESTRES += $(REP)/alex__33.txt
TESTRES += $(REP)/alex__34.txt
TESTRES += $(REP)/alex__35.txt
TESTRES += $(REP)/alex__42.txt
TESTRES += $(REP)/alex__43.txt
TESTRES += $(REP)/alex__44.txt
TESTRES += $(REP)/alex__45.txt
TESTRES += $(REP)/alex__50.txt
TESTRES += $(REP)/alex__52.txt
TESTRES += $(REP)/alex__53.txt
TESTRES += $(REP)/alex__54.txt
TESTRES += $(REP)/alex__55.txt
TESTRES += $(REP)/alex__62.txt
TESTRES += $(REP)/alex__63.txt
TESTRES += $(REP)/alex__64.txt
TESTRES += $(REP)/alex__65.txt
TESTRES += $(REP)/alex__70.txt
TESTRES += $(REP)/alex__71.txt
TESTRES += $(REP)/alex__72.txt
TESTRES += $(REP)/alex__73.txt
TESTRES += $(REP)/alex__74.txt
TESTRES += $(REP)/alex__75.txt
TESTRES += $(REP)/alex__81.txt
TESTRES += $(REP)/alex__82.txt
TESTRES += $(REP)/alex__83.txt
TESTRES += $(REP)/alex__84.txt
TESTRES += $(REP)/alex__85.txt
TESTRES += $(REP)/alex__90.txt
TESTRES += $(REP)/alex__91.txt
TESTRES += $(REP)/alex__92.txt
TESTRES += $(REP)/alex__93.txt
TESTRES += $(REP)/alex__94.txt
TESTRES += $(REP)/alex__95.txt
TESTRES += $(REP)/alex_101.txt
TESTRES += $(REP)/alex_102.txt
TESTRES += $(REP)/alex_103.txt
TESTRES += $(REP)/alex_104.txt
TESTRES += $(REP)/alex_105.txt
TESTRES += $(REP)/alex_110.txt
TESTRES += $(REP)/alex_111.txt
TESTRES += $(REP)/alex_112.txt
TESTRES += $(REP)/alex_113.txt
TESTRES += $(REP)/alex_114.txt
TESTRES += $(REP)/alex_115.txt
TESTRES += $(REP)/alex_121.txt
TESTRES += $(REP)/alex_122.txt
TESTRES += $(REP)/alex_123.txt
TESTRES += $(REP)/alex_124.txt
TESTRES += $(REP)/alex_125.txt
TESTRES += $(REP)/alex_130.txt


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
