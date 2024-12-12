#include <stdio.h>

/*

Zadanie 5.1. Napisaæ podprogram w asemblerze przystosowany do wywo³ywania z poziomu
jêzyka C. Prototyp funkcji implementowanej przez ten podprogram ma postaæ:
float srednia_harm (float * tablica, unsigned int n);
Podprogram ten powinien obliczyæ œredni¹ harmoniczn¹ 
dla n liczb zmiennoprzecinkowych a1, a2, a3,..., an, zawartych w tablicy tablica.

*/

float srednia_harm(float* tablica, unsigned int n);

int main()
{
	float tab[5] = { 1.0f, 2.0f, 3.0f, 4.0f, 5.0f };
	float wynik = srednia_harm(tab, 5);
	printf("Wynik: %f\n", wynik);
	return 0;
}
