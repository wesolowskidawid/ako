/*

Napisaæ podprogram w asemblerze przystosowany do wywo³ywania z poziomu
jêzyka C. Podprogram powinien zamieniæ dwie liczby ca³kowite typu int umieszczone w
tablicy calkowite na dwie liczby zmiennoprzecinkowe typu float i umieœciæ je w tablicy
zmienno_przec. Napisaæ tak¿e krótki program w jêzyku C ilustruj¹cy sposób
wywo³ywania obu wersji podprogramu.

*/

#include <stdio.h>
void int2float(int* calkowite, float* zmienno_przec);
int main()
{
	int a[2] = { -17, 24 };
	float r[4];
	int2float(a, r);
	printf("\nKonwersja = %f %f\n", r[0], r[1]);
	return 0;
}
