#include <stdio.h>

/*

Zad 5_2 Napisz funkcj� nowy_exp(x), kt�ra oblicza warto�� funkcji e^x korzystaj�c z rozwini�cia w szereg Taylora.

*/

float nowy_exp(float x);

int main()
{
	float x = 4.0f;
	float wynik = nowy_exp(x);
	printf("Wynik: %f\n", wynik);
	return 0;
}
