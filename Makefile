#LLVM_ROOT=~/Downloads/clang+llvm-3.5.0-macosx-apple-darwin
LLVM_ROOT=c:/llvm-3.5.0/bin/Debug

LLVM_CONFIG=$(LLVM_ROOT)/bin/llvm-config

#CPPFLAGS= -std=c++11 `$(LLVM_CONFIG) --cppflags`
CPPFLAGS="-IC:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\include" -IC:\llvm-3.5.0\llvm-3.5.0.src\llvm-3.5.0.src\include -IC:\llvm-3.5.0\bin\include  /EHsc /DWIN32 /D_WINDOWS /W3 /MP -D_CRT_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_SCL_SECURE_NO_DEPRECATE -D_SCL_SECURE_NO_WARNINGS -wd4146 -wd4180 -wd4244 -wd4267 -wd4291 -wd4345 -wd4351 -wd4355 -wd4503 -wd4624 -wd4722 -wd4800 -w14062 -we4238 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
#LDFLAGS=`$(LLVM_CONFIG) --ldflags`
LDFLAGS=/LIBPATH:C:/llvm-3.5.0/bin/Debug/lib
LIBS=`$(LLVM_CONFIG) --libs --system-libs`
LIBS=LLVMIRReader.lib LLVMAsmParser.lib LLVMXCoreDisassembler.lib LLVMXCoreCodeGen.lib LLVMXCoreDesc.lib LLVMXCoreInfo.lib LLVMXCoreAsmPrinter.lib LLVMSystemZDisassembler.lib LLVMSystemZCodeGen.lib LLVMSystemZAsmParser.lib LLVMSystemZDesc.lib LLVMSystemZInfo.lib LLVMSystemZAsmPrinter.lib LLVMSparcDisassembler.lib LLVMSparcCodeGen.lib LLVMSparcAsmParser.lib LLVMSparcDesc.lib LLVMSparcInfo.lib LLVMSparcAsmPrinter.lib LLVMR600CodeGen.lib LLVMR600Desc.lib LLVMR600Info.lib LLVMR600AsmPrinter.lib LLVMPowerPCDisassembler.lib LLVMPowerPCCodeGen.lib LLVMPowerPCAsmParser.lib LLVMPowerPCDesc.lib LLVMPowerPCInfo.lib LLVMPowerPCAsmPrinter.lib LLVMNVPTXCodeGen.lib LLVMNVPTXDesc.lib LLVMNVPTXInfo.lib LLVMNVPTXAsmPrinter.lib LLVMMSP430CodeGen.lib LLVMMSP430Desc.lib LLVMMSP430Info.lib LLVMMSP430AsmPrinter.lib LLVMMipsDisassembler.lib LLVMMipsCodeGen.lib LLVMMipsAsmParser.lib LLVMMipsDesc.lib LLVMMipsInfo.lib LLVMMipsAsmPrinter.lib LLVMHexagonCodeGen.lib LLVMHexagonAsmPrinter.lib LLVMHexagonDesc.lib LLVMHexagonInfo.lib LLVMCppBackendCodeGen.lib LLVMCppBackendInfo.lib LLVMARMDisassembler.lib LLVMARMCodeGen.lib LLVMARMAsmParser.lib LLVMARMDesc.lib LLVMARMInfo.lib LLVMARMAsmPrinter.lib LLVMAArch64Disassembler.lib LLVMAArch64CodeGen.lib LLVMAArch64AsmParser.lib LLVMAArch64Desc.lib LLVMAArch64Info.lib LLVMAArch64AsmPrinter.lib LLVMAArch64Utils.lib LLVMMCDisassembler.lib LLVMMCJIT.lib LLVMRuntimeDyld.lib LLVMTableGen.lib LLVMX86Disassembler.lib LLVMX86AsmParser.lib LLVMX86CodeGen.lib LLVMSelectionDAG.lib LLVMAsmPrinter.lib LLVMX86Desc.lib LLVMX86Info.lib LLVMX86AsmPrinter.lib LLVMX86Utils.lib LLVMJIT.lib LLVMInterpreter.lib LLVMExecutionEngine.lib LLVMCodeGen.lib LLVMMCAnalysis.lib gtest_main.lib gtest.lib LLVMLTO.lib LLVMObjCARCOpts.lib LLVMLinker.lib LLVMipo.lib LLVMVectorize.lib LLVMScalarOpts.lib LLVMInstCombine.lib LLVMBitWriter.lib LLVMOption.lib LLVMDebugInfo.lib LLVMObject.lib LLVMMCParser.lib LLVMBitReader.lib LLVMLineEditor.lib LLVMInstrumentation.lib LLVMTransformUtils.lib LLVMipa.lib LLVMAnalysis.lib LLVMTarget.lib LLVMMC.lib LLVMCore.lib LLVMProfileData.lib LLVMSupport.lib

OBJS=main.obj
#CPP=clang++
CPP=cl.exe
LINKER=link.exe
.SUFFIXES : .o .cpp
.cpp.obj:
	$(CPP) $(CPPFLAGS) /MACHINE:X86 -c $<

hyperfractal: $(OBJS)
	"$(LINKER)" $(LDFLAGS) $(OBJS) /MACHINE:X86 /OUT:$@ $(LIBS)
