
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#include "Scanner.h"

unsigned int Factorial(unsigned int n)
{
  return n <= 1 ? 1 : Factorial(n-1)*n;
}

TEST_CASE( "Factorial", "[factorial]" ) {
  REQUIRE( Factorial(1) == 1);
  REQUIRE( Factorial(0) == 1);
}
