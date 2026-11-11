CC ?= gcc
CFLAGS ?= -O2 -Wall -Wextra -std=c99
CPPFLAGS += -Iinclude
LDLIBS += -lm
.PHONY: all test clean
all: test
galaxy_logic_test: src/main.c src/game.c include/game.h
	$(CC) $(CPPFLAGS) $(CFLAGS) src/main.c src/game.c -o $@ $(LDLIBS)
galaxy_tests: tests/test_game.c src/game.c include/game.h
	$(CC) $(CPPFLAGS) $(CFLAGS) tests/test_game.c src/game.c -o $@ $(LDLIBS)
test: galaxy_logic_test galaxy_tests
	./galaxy_logic_test
	./galaxy_tests
clean:
	rm -f galaxy_logic_test galaxy_tests test_save.bin
