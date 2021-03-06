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

TARGET = log

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

TESTRES  = $(REP)/log___0.txt
TESTRES += $(REP)/log___1.txt
TESTRES += $(REP)/log__10.txt
TESTRES += $(REP)/log__11.txt
TESTRES += $(REP)/log__12.txt
TESTRES += $(REP)/log__13.txt
TESTRES += $(REP)/log__14.txt
TESTRES += $(REP)/log__15.txt
TESTRES += $(REP)/log_100.txt
TESTRES += $(REP)/log_101.txt
TESTRES += $(REP)/log_102.txt
TESTRES += $(REP)/log_103.txt
TESTRES += $(REP)/log_104.txt
TESTRES += $(REP)/log_105.txt
TESTRES += $(REP)/log_110.txt
TESTRES += $(REP)/log_111.txt
TESTRES += $(REP)/log_112.txt
TESTRES += $(REP)/log_113.txt
TESTRES += $(REP)/log_114.txt
TESTRES += $(REP)/log_115.txt
TESTRES += $(REP)/log_120.txt
TESTRES += $(REP)/log_121.txt
TESTRES += $(REP)/log_122.txt
TESTRES += $(REP)/log_123.txt
TESTRES += $(REP)/log_124.txt
TESTRES += $(REP)/log_125.txt
TESTRES += $(REP)/log_140.txt
TESTRES += $(REP)/log_141.txt
TESTRES += $(REP)/log_142.txt
TESTRES += $(REP)/log_143.txt
TESTRES += $(REP)/log_144.txt
TESTRES += $(REP)/log_145.txt
TESTRES += $(REP)/log_200.txt
TESTRES += $(REP)/log_201.txt
TESTRES += $(REP)/log_202.txt
TESTRES += $(REP)/log_203.txt
TESTRES += $(REP)/log_204.txt
TESTRES += $(REP)/log_205.txt
TESTRES += $(REP)/log_210.txt
TESTRES += $(REP)/log_211.txt
TESTRES += $(REP)/log_212.txt
TESTRES += $(REP)/log_213.txt
TESTRES += $(REP)/log_214.txt
TESTRES += $(REP)/log_215.txt
TESTRES += $(REP)/log_220.txt
TESTRES += $(REP)/log_221.txt
TESTRES += $(REP)/log_222.txt
TESTRES += $(REP)/log_223.txt
TESTRES += $(REP)/log_224.txt
TESTRES += $(REP)/log_225.txt
TESTRES += $(REP)/log_230.txt
TESTRES += $(REP)/log_231.txt
TESTRES += $(REP)/log_232.txt
TESTRES += $(REP)/log_233.txt
TESTRES += $(REP)/log_234.txt
TESTRES += $(REP)/log_235.txt
TESTRES += $(REP)/log_240.txt
TESTRES += $(REP)/log_241.txt
TESTRES += $(REP)/log_242.txt
TESTRES += $(REP)/log_243.txt
TESTRES += $(REP)/log_244.txt
TESTRES += $(REP)/log_245.txt


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
