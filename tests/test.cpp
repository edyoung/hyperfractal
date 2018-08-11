#include "pch.h"

#include "LibFractal.h"

TEST(BasicTests, CallExportedFunction) {
  EXPECT_EQ(2, functionToTest(1));
}

TEST(BasicTests, RunBenchMark) {
	EXPECT_EQ(0, runBenchmark(0, NULL));
}