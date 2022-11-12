

MY_DEBUG_TESTRUNNER = true


CC = gcc
ifeq ($(shell uname -s), Darwin)
CC = clang
endif
ifeq ($(findstring clang, $(CC)), clang)
E = -Weverything
CFLAGS += $E -Wno-unknown-warning-option -Wno-missing-prototypes
CFLAGS += -Wno-unused-macros -Wno-padded -Wno-missing-noreturn
endif
CFLAGS += -std=c99 -pedantic -Wall -Wextra -Werror
#CFLAGS += -Wconversion #disabled because if falsely complains about the isinf and isnan macros
CFLAGS += -Wno-switch-enum -Wno-double-promotion
CFLAGS += -Wno-poison-system-directories
CFLAGS += -Wbad-function-cast -Wcast-qual -Wold-style-definition -Wshadow -Wstrict-overflow \
          -Wstrict-prototypes -Wswitch-default -Wundef
DEBUG = -O0 -g
CFLAGS += $(DEBUG)
UNITY_SUPPORT_64 = -D UNITY_SUPPORT_64
UNITY_INCLUDE_DOUBLE = -D UNITY_INCLUDE_DOUBLE

#DEFINES =  -D UNITY_OUTPUT_CHAR=putcharSpy
#DEFINES += -D UNITY_OUTPUT_CHAR_HEADER_DECLARATION=putcharSpy\(int\)
#DEFINES += -D UNITY_OUTPUT_FLUSH=flushSpy
#DEFINES += -D UNITY_OUTPUT_FLUSH_HEADER_DECLARATION=flushSpy\(void\)


DEFINES += -D UNITY_USE_FLUSH_STDOUT

DEFINES += $(UNITY_SUPPORT_64) $(UNITY_INCLUDE_DOUBLE)
#SRC1 = ../src/unity.c tests/test_unity_arrays.c build/test_unity_arraysRunner.c
SRC2 = ../src/unity.c tests/test_unity_core.c build/test_unity_coreRunner.c
#SRC3 = ../src/unity.c tests/test_unity_doubles.c build/test_unity_doublesRunner.c
SRC4 = ../src/unity.c tests/test_unity_floats.c build/test_unity_floatsRunner.c
#SRC5 = ../src/unity.c tests/test_unity_integers.c build/test_unity_integersRunner.c
#SRC6 = ../src/unity.c tests/test_unity_integers_64.c build/test_unity_integers_64Runner.c
#SRC7 = ../src/unity.c tests/test_unity_memory.c build/test_unity_memoryRunner.c
#SRC8 = ../src/unity.c tests/test_unity_strings.c build/test_unity_stringsRunner.c
INC_DIR = -I ../src
COV_FLAGS = -fprofile-arcs -ftest-coverage -I ../../src
BUILD_DIR = build
#TARGET = build/testunity-cov.exe
TARGET = build/my_testunity.exe



TARGET_ARRAYS      = test_unity_arrays.exe
TARGET_CORE        = test_unity_core.exe
TARGET_DOUBLES     = test_unity_doubles.exe
TARGET_FLOATS      = test_unity_floats.exe
TARGET_INTEGERS    = test_unity_integers.exe
TARGET_INTEGERS_64 = test_unity_integers_64.exe
TARGET_MEMORY      = test_unity_memory.exe
TARGET_STRINGS     = test_unity_strings.exe

# To generate coverage, call 'make -s', the default target runs.
# For verbose output of all the tests, run 'make test'.
default: test
.PHONY: default test clean

test_unity_core: $(SRC2)
	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC2) -o $(BUILD_DIR)/$(TARGET_CORE)

test_unity_floats: $(SRC4)
	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC4) -o $(BUILD_DIR)/$(TARGET_FLOATS)

#test: $(SRC1) $(SRC2) $(SRC3) $(SRC4) $(SRC5) $(SRC6) $(SRC7) $(SRC8)
test: $(SRC2) $(SRC4)
	@echo [Target test]
#	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC1) -o $(TARGET)
#	./$(TARGET)
	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC2) -o $(TARGET_CORE)
#	./$(TARGET)
#	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC3) -o $(TARGET)
#	./$(TARGET)

	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC4) -o $(TARGET_FLOATS)
	
	
#	./$(TARGET)
#	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC5) -o $(TARGET)
#	./$(TARGET)
#	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC6) -o $(TARGET)
#	./$(TARGET)
#	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC7) -o $(TARGET)
#	./$(TARGET)
#	$(CC) $(CFLAGS) $(DEFINES) $(INC_DIR) $(SRC8) -o $(TARGET)
#	./$(TARGET)

# Compile only, for testing that preprocessor detection works
#UNITY_C_ONLY =-c ../src/unity.c -o $(BUILD_DIR)/unity.o
#intDetection:
#	@echo [intDetection]
#	$(CC) $(CFLAGS) $(INC_DIR) $(UNITY_C_ONLY) -D UNITY_EXCLUDE_STDINT_H
#	$(CC) $(CFLAGS) $(INC_DIR) $(UNITY_C_ONLY) -D UNITY_EXCLUDE_LIMITS_H

#$(BUILD_DIR)/test_unity_arraysRunner.c: tests/test_unity_arrays.c | $(BUILD_DIR)
#	@echo [$(BUILD_DIR)/test_unity_arraysRunner.c]
#	awk $(AWK_SCRIPT) tests/test_unity_arrays.c > $@
#
$(BUILD_DIR)/test_unity_coreRunner.c: tests/test_unity_core.c | $(BUILD_DIR)
	awk $(AWK_SCRIPT) tests/test_unity_core.c > $@

#$(BUILD_DIR)/test_unity_doublesRunner.c: tests/test_unity_doubles.c | $(BUILD_DIR)
#	awk $(AWK_SCRIPT) tests/test_unity_doubles.c > $@
#
$(BUILD_DIR)/test_unity_floatsRunner.c: tests/test_unity_floats.c | $(BUILD_DIR)
	awk $(AWK_SCRIPT) tests/test_unity_floats.c > $@
#
#$(BUILD_DIR)/test_unity_integersRunner.c: tests/test_unity_integers.c | $(BUILD_DIR)
#	awk $(AWK_SCRIPT) tests/test_unity_integers.c > $@
#
#$(BUILD_DIR)/test_unity_integers_64Runner.c: tests/test_unity_integers_64.c | $(BUILD_DIR)
#	awk $(AWK_SCRIPT) tests/test_unity_integers_64.c > $@
#
#$(BUILD_DIR)/test_unity_memoryRunner.c: tests/test_unity_memory.c | $(BUILD_DIR)
#	awk $(AWK_SCRIPT) tests/test_unity_memory.c > $@
#
#$(BUILD_DIR)/test_unity_stringsRunner.c: tests/test_unity_strings.c | $(BUILD_DIR)
#	awk $(AWK_SCRIPT) tests/test_unity_strings.c > $@

ifdef MY_DEBUG_TESTRUNNER
AWK_SCRIPT=-f debug_utils/generate_test_runner.awk
else
AWK_SCRIPT=\
  '/^void test/{ declarations[d++]=$$0; gsub(/\(?void\)? ?/,""); tests[t++]=$$0; line[u++]=NR } \
  END{ print "\#include \"unity.h\" /* Autogenerated by awk in Makefile */" ;                   \
       for (i=0; i<d; i++) { print declarations[i] ";" }                                        \
       print "int main(void)\n{\n    UnityBegin(\"" FILENAME "\");" ;                           \
       for (i=0; i<t; i++) { print "    RUN_TEST(" tests[i] ", " line[i] ");" }                 \
       print "    return UNITY_END();\n}" }'
endif

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	pwd
	rm -f $(BUILD_DIR)/*.exe $(BUILD_DIR)/*.gc* $(BUILD_DIR)/test_unity_*Runner.c
	
.Phony: my_sub

my_sub:
	echo $(SRC4)
	echo "1:" $(word 1, $(SRC4))
	echo "2:" $(word 2, $(SRC4))
	echo "THIS_TEST_EXE:" $(subst tests/,,$(word 2, $(SRC4)))
	echo $(patsubst %.c, %.exe, $(subst tests/,,$(word 2, $(SRC4))))  
	
