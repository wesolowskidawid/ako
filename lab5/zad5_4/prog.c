/*

Napisa� podprogram w asemblerze przystosowany do wywo�ywania z poziomu
j�zyka C. Podprogram powinien zamieni� dwie liczby ca�kowite typu int umieszczone w
tablicy calkowite na dwie liczby zmiennoprzecinkowe typu float i umie�ci� je w tablicy
zmienno_przec. Napisa� tak�e kr�tki program w j�zyku C ilustruj�cy spos�b
wywo�ywania obu wersji podprogramu.

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
