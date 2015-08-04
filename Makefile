LLVM_ROOT=/usr
#LLVM_ROOT=~/Downloads/clang+llvm-3.5.0-macosx-apple-darwin

LLVM_CONFIG=$(LLVM_ROOT)/bin/llvm-config

BASECXXFLAGS= -std=c++11 -g -fPIC -DNDEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
CXXFLAGS=  $(BASECXXFLAGS)  -I`$(LLVM_CONFIG) --includedir`
LDFLAGS=`$(LLVM_CONFIG) --ldflags` 
LIBS=`$(LLVM_CONFIG) --libs --system-libs`
OBJS=lexer.o
CPP=clang++

.SUFFIXES : .o .cpp

all: hyperfractal tests

hyperfractal: $(OBJS) main.o
	$(CPP) $(LDFLAGS) $^ -o $@ $(LIBS)

tests: $(OBJS) test.o
	$(CPP) $(LDFLAGS) $^ -o $@ $(LIBS)

lexer.o : lexer.cpp
	$(CPP) $(BASECXXFLAGS) -c $^

.cpp.o:
	$(CPP) $(CXXFLAGS) -c $<

lexer.cpp Scannerbase.h: lexer.lpp
	flexc++ --lex-source=lexer.cpp --case-insensitive $<

clean:
	rm -f *.o hyperfractal lexer.cpp Scannerbase.h Scanner.h
