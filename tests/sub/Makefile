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

TARGET = sub

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

TESTRES  = $(REP)/sub___0.txt
TESTRES += $(REP)/sub___1.txt
TESTRES += $(REP)/sub__10.txt
TESTRES += $(REP)/sub__11.txt
TESTRES += $(REP)/sub__12.txt
TESTRES += $(REP)/sub__13.txt
TESTRES += $(REP)/sub__14.txt
TESTRES += $(REP)/sub__15.txt
TESTRES += $(REP)/sub__16.txt
TESTRES += $(REP)/sub__20.txt
TESTRES += $(REP)/sub__21.txt
TESTRES += $(REP)/sub__22.txt
TESTRES += $(REP)/sub__23.txt
TESTRES += $(REP)/sub__24.txt
TESTRES += $(REP)/sub__25.txt
TESTRES += $(REP)/sub__26.txt
TESTRES += $(REP)/sub__30.txt
TESTRES += $(REP)/sub__31.txt
TESTRES += $(REP)/sub__32.txt
TESTRES += $(REP)/sub__33.txt
TESTRES += $(REP)/sub__34.txt
TESTRES += $(REP)/sub__35.txt
TESTRES += $(REP)/sub__36.txt
TESTRES += $(REP)/sub__40.txt
TESTRES += $(REP)/sub__41.txt
TESTRES += $(REP)/sub__42.txt
TESTRES += $(REP)/sub__43.txt
TESTRES += $(REP)/sub__44.txt
TESTRES += $(REP)/sub__45.txt
TESTRES += $(REP)/sub__46.txt
TESTRES += $(REP)/sub__50.txt
TESTRES += $(REP)/sub__51.txt
TESTRES += $(REP)/sub__52.txt
TESTRES += $(REP)/sub__53.txt
TESTRES += $(REP)/sub__54.txt
TESTRES += $(REP)/sub__55.txt
TESTRES += $(REP)/sub__56.txt
TESTRES += $(REP)/sub__60.txt
TESTRES += $(REP)/sub__61.txt
TESTRES += $(REP)/sub__62.txt
TESTRES += $(REP)/sub__63.txt
TESTRES += $(REP)/sub__64.txt
TESTRES += $(REP)/sub__65.txt
TESTRES += $(REP)/sub__66.txt
TESTRES += $(REP)/sub__70.txt
TESTRES += $(REP)/sub__71.txt
TESTRES += $(REP)/sub__72.txt
TESTRES += $(REP)/sub__73.txt
TESTRES += $(REP)/sub__74.txt
TESTRES += $(REP)/sub__75.txt
TESTRES += $(REP)/sub__76.txt
TESTRES += $(REP)/sub_120.txt
TESTRES += $(REP)/sub_121.txt
TESTRES += $(REP)/sub_122.txt
TESTRES += $(REP)/sub_123.txt
TESTRES += $(REP)/sub_124.txt
TESTRES += $(REP)/sub_125.txt
TESTRES += $(REP)/sub_126.txt
TESTRES += $(REP)/sub_130.txt
TESTRES += $(REP)/sub_131.txt
TESTRES += $(REP)/sub_132.txt
TESTRES += $(REP)/sub_133.txt
TESTRES += $(REP)/sub_134.txt
TESTRES += $(REP)/sub_135.txt
TESTRES += $(REP)/sub_136.txt
TESTRES += $(REP)/sub_140.txt
TESTRES += $(REP)/sub_141.txt
TESTRES += $(REP)/sub_142.txt
TESTRES += $(REP)/sub_143.txt
TESTRES += $(REP)/sub_144.txt
TESTRES += $(REP)/sub_145.txt
TESTRES += $(REP)/sub_146.txt
TESTRES += $(REP)/sub_150.txt
TESTRES += $(REP)/sub_151.txt
TESTRES += $(REP)/sub_152.txt
TESTRES += $(REP)/sub_153.txt
TESTRES += $(REP)/sub_154.txt
TESTRES += $(REP)/sub_155.txt
TESTRES += $(REP)/sub_156.txt
TESTRES += $(REP)/sub_160.txt
TESTRES += $(REP)/sub_161.txt
TESTRES += $(REP)/sub_162.txt
TESTRES += $(REP)/sub_163.txt
TESTRES += $(REP)/sub_164.txt
TESTRES += $(REP)/sub_165.txt
TESTRES += $(REP)/sub_166.txt
TESTRES += $(REP)/sub_170.txt
TESTRES += $(REP)/sub_171.txt
TESTRES += $(REP)/sub_172.txt
TESTRES += $(REP)/sub_173.txt
TESTRES += $(REP)/sub_174.txt
TESTRES += $(REP)/sub_175.txt
TESTRES += $(REP)/sub_176.txt


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
