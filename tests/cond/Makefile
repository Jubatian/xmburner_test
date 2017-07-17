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

TARGET = cond

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

TESTRES  = $(REP)/cond___0.txt
TESTRES += $(REP)/cond___1.txt
TESTRES += $(REP)/cond__10.txt
TESTRES += $(REP)/cond__11.txt
TESTRES += $(REP)/cond__20.txt
TESTRES += $(REP)/cond__21.txt
TESTRES += $(REP)/cond__22.txt
TESTRES += $(REP)/cond__23.txt
TESTRES += $(REP)/cond__24.txt
TESTRES += $(REP)/cond__25.txt
TESTRES += $(REP)/cond__26.txt
TESTRES += $(REP)/cond__27.txt
TESTRES += $(REP)/cond__30.txt
TESTRES += $(REP)/cond__31.txt
TESTRES += $(REP)/cond__32.txt
TESTRES += $(REP)/cond__33.txt
TESTRES += $(REP)/cond__34.txt
TESTRES += $(REP)/cond__35.txt
TESTRES += $(REP)/cond__36.txt
TESTRES += $(REP)/cond__37.txt
TESTRES += $(REP)/cond__40.txt
TESTRES += $(REP)/cond__41.txt
TESTRES += $(REP)/cond__42.txt
TESTRES += $(REP)/cond__43.txt
TESTRES += $(REP)/cond__44.txt
TESTRES += $(REP)/cond__45.txt
TESTRES += $(REP)/cond__46.txt
TESTRES += $(REP)/cond__47.txt
TESTRES += $(REP)/cond__50.txt
TESTRES += $(REP)/cond__51.txt
TESTRES += $(REP)/cond__52.txt
TESTRES += $(REP)/cond__53.txt
TESTRES += $(REP)/cond__54.txt
TESTRES += $(REP)/cond__55.txt
TESTRES += $(REP)/cond__56.txt
TESTRES += $(REP)/cond__57.txt
TESTRES += $(REP)/cond__60.txt
TESTRES += $(REP)/cond__61.txt
TESTRES += $(REP)/cond__62.txt
TESTRES += $(REP)/cond__63.txt
TESTRES += $(REP)/cond__64.txt
TESTRES += $(REP)/cond__65.txt
TESTRES += $(REP)/cond__66.txt
TESTRES += $(REP)/cond__67.txt
TESTRES += $(REP)/cond__70.txt
TESTRES += $(REP)/cond__71.txt
TESTRES += $(REP)/cond__72.txt
TESTRES += $(REP)/cond__73.txt
TESTRES += $(REP)/cond__74.txt
TESTRES += $(REP)/cond__75.txt
TESTRES += $(REP)/cond__76.txt
TESTRES += $(REP)/cond__77.txt
TESTRES += $(REP)/cond__80.txt
TESTRES += $(REP)/cond__81.txt
TESTRES += $(REP)/cond__82.txt
TESTRES += $(REP)/cond__83.txt
TESTRES += $(REP)/cond__84.txt
TESTRES += $(REP)/cond__85.txt
TESTRES += $(REP)/cond__86.txt
TESTRES += $(REP)/cond__87.txt
TESTRES += $(REP)/cond__90.txt
TESTRES += $(REP)/cond__91.txt
TESTRES += $(REP)/cond__92.txt
TESTRES += $(REP)/cond__93.txt
TESTRES += $(REP)/cond__94.txt
TESTRES += $(REP)/cond__95.txt
TESTRES += $(REP)/cond__96.txt
TESTRES += $(REP)/cond__97.txt
TESTRES += $(REP)/cond_100.txt
TESTRES += $(REP)/cond_101.txt
TESTRES += $(REP)/cond_102.txt
TESTRES += $(REP)/cond_103.txt
TESTRES += $(REP)/cond_104.txt
TESTRES += $(REP)/cond_105.txt
TESTRES += $(REP)/cond_106.txt
TESTRES += $(REP)/cond_107.txt
TESTRES += $(REP)/cond_110.txt
TESTRES += $(REP)/cond_111.txt
TESTRES += $(REP)/cond_112.txt
TESTRES += $(REP)/cond_113.txt
TESTRES += $(REP)/cond_114.txt
TESTRES += $(REP)/cond_115.txt
TESTRES += $(REP)/cond_116.txt
TESTRES += $(REP)/cond_117.txt
TESTRES += $(REP)/cond_120.txt
TESTRES += $(REP)/cond_121.txt
TESTRES += $(REP)/cond_122.txt
TESTRES += $(REP)/cond_123.txt
TESTRES += $(REP)/cond_124.txt
TESTRES += $(REP)/cond_125.txt
TESTRES += $(REP)/cond_126.txt
TESTRES += $(REP)/cond_127.txt
TESTRES += $(REP)/cond_130.txt
TESTRES += $(REP)/cond_131.txt
TESTRES += $(REP)/cond_132.txt
TESTRES += $(REP)/cond_133.txt
TESTRES += $(REP)/cond_134.txt
TESTRES += $(REP)/cond_135.txt
TESTRES += $(REP)/cond_136.txt
TESTRES += $(REP)/cond_137.txt


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
	$(CC) $(LDFLAGS) $< $(OBJDEPS) -o $@

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
