LLVM_ROOT=~/Downloads/clang+llvm-3.5.0-macosx-apple-darwin

LLVM_CONFIG=$(LLVM_ROOT)/bin/llvm-config

CPPFLAGS= -std=c++11 `$(LLVM_CONFIG) --cppflags`
LDFLAGS=`$(LLVM_CONFIG) --ldflags`
LIBS=`$(LLVM_CONFIG) --libs --system-libs`
OBJS=main.o
CPP=clang++
.SUFFIXES : .o .cpp
.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

hyperfractal: $(OBJS)
	$(CPP) $(LDFLAGS) $< -o $@ $(LIBS)
