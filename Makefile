LLVM_ROOT=/usr
#LLVM_ROOT=~/Downloads/clang+llvm-3.5.0-macosx-apple-darwin

LLVM_CONFIG=$(LLVM_ROOT)/bin/llvm-config

CXXFLAGS= -std=c++11 `$(LLVM_CONFIG) --cxxflags`
LDFLAGS=`$(LLVM_CONFIG) --ldflags` -L/usr/lib/x86_64-linux-gnu
LIBS=`$(LLVM_CONFIG) --libs --system-libs`
OBJS=main.o
CPP=clang++
.SUFFIXES : .o .cpp
.cpp.o:
	$(CPP) $(CXXFLAGS) -c $<

hyperfractal: $(OBJS)
	$(CPP) $(LDFLAGS) $< -o $@ $(LIBS)
