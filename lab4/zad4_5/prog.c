#include <stdio.h>

extern __int64 suma_siedmiu_liczb(__int64 v1, __int64 v2, __int64
	v3, __int64 v4, __int64 v5, __int64 v6, __int64 v7);

int main()
{
	__int64 wyniki[7] =
	{ -15, 16, -63, 251,
	-1, 46, 2346 };
	__int64 wynik;
	wynik = suma_siedmiu_liczb(wyniki[0], wyniki[1], wyniki[2],
		wyniki[3], wyniki[4], wyniki[5], wyniki[6]);
	printf("\nSuma wynosi %I64d\n",
		wynik);
	return 0;
}
