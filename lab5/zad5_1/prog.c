#include <stdio.h>

/*

Zadanie 5.1. Napisa� podprogram w asemblerze przystosowany do wywo�ywania z poziomu
j�zyka C. Prototyp funkcji implementowanej przez ten podprogram ma posta�:
float srednia_harm (float * tablica, unsigned int n);
Podprogram ten powinien obliczy� �redni� harmoniczn� 
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
