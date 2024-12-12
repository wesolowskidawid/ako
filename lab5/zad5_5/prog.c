/*

Napisaæ podprogram w asemblerze przystosowany do wywo³ywania z poziomu
jêzyka C.
Podprogram ten, korzystaj¹c z rozkazu ADDSUBPS (grupa SSE3) powinien dodaæ 1 do
elementów tablicy o indeksach nieparzystych i odj¹æ 1 od pozosta³ych elementów tablicy. Do
testowania opracowanego podprogramu mo¿na wykorzystaæ poni¿szy program w jêzyku C.


*/

#include <stdio.h>
void pm_jeden(float* tabl);
int main()
{
	float tablica[4] = { 27.5,143.57,2100.0, -3.51 };
	printf("\n%f %f %f %f\n", tablica[0],
		tablica[1], tablica[2], tablica[3]);
	pm_jeden(tablica);
	printf("\n%f %f %f %f\n", tablica[0],
		tablica[1], tablica[2], tablica[3]);
	return 0;
}
