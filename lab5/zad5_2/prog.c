#include <stdio.h>

/*

Zad 5_2 Napisz funkcjê nowy_exp(x), która oblicza wartoœæ funkcji e^x korzystaj¹c z rozwiniêcia w szereg Taylora.

*/

float nowy_exp(float x);

int main()
{
	float x = 4.0f;
	float wynik = nowy_exp(x);
	printf("Wynik: %f\n", wynik);
	return 0;
}
