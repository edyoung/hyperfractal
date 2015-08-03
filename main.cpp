#include <iostream>

#include "Scanner.h"

#include "llvm/IR/Verifier.h"
#include "llvm/IR/IRBuilder.h"

using namespace llvm;

static Module *TheModule;
static IRBuilder<> Builder(getGlobalContext());

int main()
{
    std::cout << "hello\n";

    Scanner scanner("formulas/gf4d.frm","-");
    while(scanner.lex())
    {
	std::cout << scanner.matched() << std::endl;
    }
    
    Value *c1 = ConstantFP::get(getGlobalContext(), APFloat(2.0));
    Value *c2 = ConstantFP::get(getGlobalContext(), APFloat(2.0));
    Value *sum = Builder.CreateFAdd(c1,c2, "addtmp");

}
