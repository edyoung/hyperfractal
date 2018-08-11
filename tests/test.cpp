#include "pch.h"

#include "LibFractal.h"

TEST(TestCaseName, CallExportedFunction) {
  EXPECT_EQ(1, 1);
  EXPECT_TRUE(true);
  EXPECT_EQ(2, functionToTest(1));
}

TEST(BasicTests, RunBenchMark) {
	EXPECT_EQ(0, runBenchmark(0, NULL));
}