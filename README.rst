
XMBurner tester
==============================================================================

:Author:    Sandor Zsuga (Jubatian)
:License:   GNU GPLv3 (version 3 of the GNU General Public License)




Overview
------------------------------------------------------------------------------


This is a test package for XMBurner. It uses the XMBurner AluEmu package to
simulate the CPU with a capability to simulate various anomalies in it.



Setting up
------------------------------------------------------------------------------


The XMBurner package and the XMBurner AluEmu package are necessary to run this
program. You should have the following directory structure: ::

    |
    +- xmburner_aluemu (The CPU Emulator)
    |
    +- xmburner (The XMBurner to test)
    |
    +- xmburner_test
       |
       +- README.rst (This file)

You need a Unix environment with a native gcc and avr-gcc installed.



Running the tests
------------------------------------------------------------------------------


The tests can be executed by running make. This will build and execute the
tests generating results in a report.txt file. Note that failing a test won't
halt the process, it will rather add an appropriate entry in the report.txt
file.



Interpreting test reports
------------------------------------------------------------------------------


Reports of individual tests are generated in the following format: ::

    Test: <component> (<test_case>)
    Result: PASS / FAIL

Where:

- component: The XMBurner component being tested (identified by its filename).
- test_case: The test case, same as the number in the file name in the tests
  folder.

Result most commonly will be either PASS or FAIL. It is possible that a test
can not generate a result due to a flaw in XMBurner or due to the way the
simulated processor anomaly interacts with the running code. This case
"Result:" will print without a result, which should be interpreted as a
failure.
