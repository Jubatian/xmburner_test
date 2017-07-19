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
# The main makefile of the program
#
#
# make all (or make): build the program
# make clean:         to clean up
#
#

include Make_defines.mk


# Emulator

EMUPATH = ../xmburner_aluemu
EMU = $(EMUPATH)/aluemu

# XMBurner

XMBPATH = ../xmburner
XMB = $(XMBPATH)/_xmb_o_/dummy

# Directories

REP = _rep_
HEX = _hex_
DEPS = $(REP) $(HEX) $(EMU) $(XMB)

# The output report

REPORT = report.txt

# List of report components

COMPONENTS  = $(REP)/creg.txt
COMPONENTS += $(REP)/cond.txt
COMPONENTS += $(REP)/jump.txt



# Targets

all: report.txt
clean:
	rm    -f $(REPORT)
	rm    -f $(REP)/*.txt
	rm -d -f $(REP)
	rm    -f $(HEX)/*.o
	rm    -f $(HEX)/*.hex
	rm    -f $(HEX)/*.elf
	rm -d -f $(HEX)

# The full report

$(REPORT): $(COMPONENTS)
	cat $(COMPONENTS) > $@

# Emulator

$(EMU):
	cd $(EMUPATH) && $(MAKE)

# XMBurner

$(XMB):
	cd $(XMBPATH) && $(MAKE)

# Directories

$(REP):
	mkdir $(REP)

$(HEX):
	mkdir $(HEX)

# Report parts

$(REP)/creg.txt: $(DEPS) tests/creg/*
	cd tests/creg && $(MAKE)

$(REP)/cond.txt: $(DEPS) tests/cond/*
	cd tests/cond && $(MAKE)

$(REP)/jump.txt: $(DEPS) tests/jump/*
	cd tests/jump && $(MAKE)

.PHONY: all clean
