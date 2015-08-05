LLVM_ROOT=/usr
#LLVM_ROOT=~/Downloads/clang+llvm-3.5.0-macosx-apple-darwin

LLVM_CONFIG=$(LLVM_ROOT)/bin/llvm-config

BASECXXFLAGS= -std=c++11 -g -fPIC -DNDEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
CXXFLAGS=  $(BASECXXFLAGS)  -I`$(LLVM_CONFIG) --includedir`
#CXXFLAGS="-IC:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\include" -IC:\llvm-3.5.0\llvm-3.5.0.src\llvm-3.5.0.src\include -IC:\llvm-3.5.0\bin\include  /EHsc /DWIN32 /D_WINDOWS /W3 /MP -D_CRT_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_SCL_SECURE_NO_DEPRECATE -D_SCL_SECURE_NO_WARNINGS -wd4146 -wd4180 -wd4244 -wd4267 -wd4291 -wd4345 -wd4351 -wd4355 -wd4503 -wd4624 -wd4722 -wd4800 -w14062 -we4238 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS

LDFLAGS=`$(LLVM_CONFIG) --ldflags` 
LIBS=`$(LLVM_CONFIG) --libs --system-libs`
#LDFLAGS=/LIBPATH:C:/llvm-3.5.0/bin/Debug/lib
OBJS=lexer.o
CPP=clang++

#CPP+cl.exe
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
