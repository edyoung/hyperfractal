// LibFractal.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"


__declspec(dllexport) int functionToTest(int x)
{
	return x + 1;
}