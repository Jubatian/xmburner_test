############
# Makefile #
############
#
#  Copyright (C) 2018
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

TARGET = mul

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

TESTRES  = $(REP)/mul___0.txt
TESTRES += $(REP)/mul___1.txt
TESTRES += $(REP)/mul___2.txt
TESTRES += $(REP)/mul__10.txt
TESTRES += $(REP)/mul__11.txt
TESTRES += $(REP)/mul__12.txt
TESTRES += $(REP)/mul__13.txt
TESTRES += $(REP)/mul__14.txt
TESTRES += $(REP)/mul__15.txt
TESTRES += $(REP)/mul__20.txt
TESTRES += $(REP)/mul__21.txt
TESTRES += $(REP)/mul__22.txt
TESTRES += $(REP)/mul__23.txt
TESTRES += $(REP)/mul__24.txt
TESTRES += $(REP)/mul__25.txt
TESTRES += $(REP)/mul__30.txt
TESTRES += $(REP)/mul__31.txt
TESTRES += $(REP)/mul__32.txt
TESTRES += $(REP)/mul__33.txt
TESTRES += $(REP)/mul__34.txt
TESTRES += $(REP)/mul__35.txt
TESTRES += $(REP)/mul_120.txt
TESTRES += $(REP)/mul_121.txt
TESTRES += $(REP)/mul_122.txt
TESTRES += $(REP)/mul_123.txt
TESTRES += $(REP)/mul_124.txt
TESTRES += $(REP)/mul_125.txt
TESTRES += $(REP)/mul_130.txt
TESTRES += $(REP)/mul_131.txt
TESTRES += $(REP)/mul_132.txt
TESTRES += $(REP)/mul_133.txt
TESTRES += $(REP)/mul_134.txt
TESTRES += $(REP)/mul_135.txt


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
