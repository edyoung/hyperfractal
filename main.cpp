#include <iostream>

#include "llvm/IR/Verifier.h"
#include "llvm/IR/IRBuilder.h"

using namespace llvm;

static Module *TheModule;
static IRBuilder<> Builder(getGlobalContext());

int main()
{
    std::cout << "hello\n";

}
