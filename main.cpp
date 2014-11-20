#include <iostream>

#include "llvm/ir/Verifier.h"
#include "llvm/ir/IRBuilder.h"

using namespace llvm;

static Module *TheModule;
static IRBuilder<> Builder(getGlobalContext());

int main()
{
    std::cout << "hello\n";

}
