CXXFLAGS += -std=c++14 -Wall
TESTLIBS += -lboost_unit_test_framework

.PHONY: all
all: Ueb3Aufg2.bf

# Example Brainfuck program
Ueb3Aufg2.bf: bfg_Ueb3Aufg2
	./bfg_Ueb3Aufg2

bfg_Ueb3Aufg2: Ueb3Aufg2.o bf/generator.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)


# Tests
test: test_generator test_compiler
	for test in $^; do \
	    ./$$test; \
	done

test_generator: test/generator.o bf/generator.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(TESTLIBS)

test_compiler: test/compiler.o bf/compiler.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(TESTLIBS)


clean:
	rm -f bfg_Ueb3Aufg2 test_generator
	rm -f *.o bf/*.o test/*.o
	rm -f *.bf
