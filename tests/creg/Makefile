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

OBJDEPS  = $(HEX)/print.o $(HEX)/runner.o $(HEX)/creg_id.o
OBJDEPS += $(XMB_PATH_OBJ)/xmb_creg.o $(XMB_PATH_OBJ)/xmb_glob.o

# Usual compile dependencies of test cases

CDEPS = creg_inc.inc

# List of test results

TESTRES  = $(REP)/creg___0.txt
TESTRES += $(REP)/creg___1.txt
TESTRES += $(REP)/creg__10.txt
TESTRES += $(REP)/creg__11.txt
TESTRES += $(REP)/creg__12.txt
TESTRES += $(REP)/creg__13.txt
TESTRES += $(REP)/creg__14.txt
TESTRES += $(REP)/creg__15.txt
TESTRES += $(REP)/creg__20.txt
TESTRES += $(REP)/creg__21.txt
TESTRES += $(REP)/creg__22.txt
TESTRES += $(REP)/creg__23.txt
TESTRES += $(REP)/creg__24.txt
TESTRES += $(REP)/creg__25.txt
TESTRES += $(REP)/creg__26.txt
TESTRES += $(REP)/creg__27.txt
TESTRES += $(REP)/creg__28.txt
TESTRES += $(REP)/creg__29.txt
TESTRES += $(REP)/creg__30.txt
TESTRES += $(REP)/creg__31.txt
TESTRES += $(REP)/creg__32.txt
TESTRES += $(REP)/creg__33.txt
TESTRES += $(REP)/creg__34.txt
TESTRES += $(REP)/creg__35.txt
TESTRES += $(REP)/creg__36.txt
TESTRES += $(REP)/creg__37.txt
TESTRES += $(REP)/creg__38.txt
TESTRES += $(REP)/creg__39.txt
TESTRES += $(REP)/creg__40.txt
TESTRES += $(REP)/creg__41.txt
TESTRES += $(REP)/creg__42.txt
TESTRES += $(REP)/creg__43.txt
TESTRES += $(REP)/creg__44.txt
TESTRES += $(REP)/creg__45.txt
TESTRES += $(REP)/creg__46.txt
TESTRES += $(REP)/creg__47.txt
TESTRES += $(REP)/creg__48.txt
TESTRES += $(REP)/creg__49.txt
TESTRES += $(REP)/creg__50.txt
TESTRES += $(REP)/creg__51.txt
TESTRES += $(REP)/creg__60.txt
TESTRES += $(REP)/creg__61.txt
TESTRES += $(REP)/creg__62.txt
TESTRES += $(REP)/creg__63.txt
TESTRES += $(REP)/creg__64.txt
TESTRES += $(REP)/creg__65.txt
TESTRES += $(REP)/creg__66.txt
TESTRES += $(REP)/creg__67.txt
TESTRES += $(REP)/creg__68.txt
TESTRES += $(REP)/creg__69.txt
TESTRES += $(REP)/creg__70.txt
TESTRES += $(REP)/creg__71.txt
TESTRES += $(REP)/creg__72.txt
TESTRES += $(REP)/creg__73.txt
TESTRES += $(REP)/creg__74.txt
TESTRES += $(REP)/creg__75.txt
TESTRES += $(REP)/creg__76.txt
TESTRES += $(REP)/creg__77.txt
TESTRES += $(REP)/creg__78.txt
TESTRES += $(REP)/creg__79.txt
TESTRES += $(REP)/creg__80.txt
TESTRES += $(REP)/creg__81.txt
TESTRES += $(REP)/creg__82.txt
TESTRES += $(REP)/creg__83.txt
TESTRES += $(REP)/creg__84.txt
TESTRES += $(REP)/creg__85.txt
TESTRES += $(REP)/creg__86.txt
TESTRES += $(REP)/creg__87.txt
TESTRES += $(REP)/creg__88.txt
TESTRES += $(REP)/creg__89.txt
TESTRES += $(REP)/creg__90.txt
TESTRES += $(REP)/creg__91.txt
TESTRES += $(REP)/creg_100.txt
TESTRES += $(REP)/creg_101.txt
TESTRES += $(REP)/creg_102.txt
TESTRES += $(REP)/creg_103.txt
TESTRES += $(REP)/creg_104.txt
TESTRES += $(REP)/creg_105.txt
TESTRES += $(REP)/creg_106.txt
TESTRES += $(REP)/creg_107.txt
TESTRES += $(REP)/creg_108.txt
TESTRES += $(REP)/creg_109.txt
TESTRES += $(REP)/creg_110.txt
TESTRES += $(REP)/creg_111.txt
TESTRES += $(REP)/creg_112.txt
TESTRES += $(REP)/creg_113.txt
TESTRES += $(REP)/creg_114.txt
TESTRES += $(REP)/creg_115.txt
TESTRES += $(REP)/creg_116.txt
TESTRES += $(REP)/creg_117.txt
TESTRES += $(REP)/creg_118.txt
TESTRES += $(REP)/creg_119.txt
TESTRES += $(REP)/creg_120.txt
TESTRES += $(REP)/creg_121.txt
TESTRES += $(REP)/creg_122.txt
TESTRES += $(REP)/creg_123.txt
TESTRES += $(REP)/creg_124.txt
TESTRES += $(REP)/creg_125.txt
TESTRES += $(REP)/creg_126.txt
TESTRES += $(REP)/creg_127.txt
TESTRES += $(REP)/creg_128.txt
TESTRES += $(REP)/creg_129.txt
TESTRES += $(REP)/creg_130.txt
TESTRES += $(REP)/creg_131.txt
TESTRES += $(REP)/creg_140.txt
TESTRES += $(REP)/creg_141.txt
TESTRES += $(REP)/creg_142.txt
TESTRES += $(REP)/creg_143.txt
TESTRES += $(REP)/creg_144.txt
TESTRES += $(REP)/creg_145.txt
TESTRES += $(REP)/creg_146.txt
TESTRES += $(REP)/creg_147.txt
TESTRES += $(REP)/creg_148.txt
TESTRES += $(REP)/creg_149.txt
TESTRES += $(REP)/creg_150.txt
TESTRES += $(REP)/creg_151.txt
TESTRES += $(REP)/creg_152.txt
TESTRES += $(REP)/creg_153.txt
TESTRES += $(REP)/creg_154.txt
TESTRES += $(REP)/creg_155.txt
TESTRES += $(REP)/creg_156.txt
TESTRES += $(REP)/creg_157.txt
TESTRES += $(REP)/creg_158.txt
TESTRES += $(REP)/creg_159.txt
TESTRES += $(REP)/creg_160.txt
TESTRES += $(REP)/creg_161.txt
TESTRES += $(REP)/creg_162.txt
TESTRES += $(REP)/creg_163.txt
TESTRES += $(REP)/creg_164.txt
TESTRES += $(REP)/creg_165.txt
TESTRES += $(REP)/creg_166.txt
TESTRES += $(REP)/creg_167.txt
TESTRES += $(REP)/creg_168.txt
TESTRES += $(REP)/creg_169.txt
TESTRES += $(REP)/creg_170.txt
TESTRES += $(REP)/creg_171.txt
TESTRES += $(REP)/creg_180.txt
TESTRES += $(REP)/creg_181.txt
TESTRES += $(REP)/creg_182.txt
TESTRES += $(REP)/creg_183.txt
TESTRES += $(REP)/creg_184.txt
TESTRES += $(REP)/creg_185.txt
TESTRES += $(REP)/creg_186.txt
TESTRES += $(REP)/creg_187.txt
TESTRES += $(REP)/creg_190.txt
TESTRES += $(REP)/creg_191.txt
TESTRES += $(REP)/creg_192.txt
TESTRES += $(REP)/creg_193.txt
TESTRES += $(REP)/creg_194.txt
TESTRES += $(REP)/creg_195.txt
TESTRES += $(REP)/creg_196.txt
TESTRES += $(REP)/creg_197.txt
TESTRES += $(REP)/creg_200.txt
TESTRES += $(REP)/creg_201.txt
TESTRES += $(REP)/creg_202.txt
TESTRES += $(REP)/creg_203.txt
TESTRES += $(REP)/creg_204.txt
TESTRES += $(REP)/creg_205.txt
TESTRES += $(REP)/creg_206.txt
TESTRES += $(REP)/creg_207.txt
TESTRES += $(REP)/creg_210.txt
TESTRES += $(REP)/creg_211.txt
TESTRES += $(REP)/creg_212.txt
TESTRES += $(REP)/creg_213.txt
TESTRES += $(REP)/creg_214.txt
TESTRES += $(REP)/creg_215.txt
TESTRES += $(REP)/creg_216.txt
TESTRES += $(REP)/creg_217.txt


# Build tests

all: $(OUT)

$(OUT): $(TESTRES)
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

$(HEX)/creg_id.o: creg_id.s
	$(CC) $(ASMFLAGS) -c $< -o $@


.PHONY: all
