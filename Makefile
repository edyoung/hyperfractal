
OBJS=main.o
CPP=clang++
.SUFFIXES : .o .cpp
.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

hyperfractal: $(OBJS)
	$(CPP) $< -o $@
