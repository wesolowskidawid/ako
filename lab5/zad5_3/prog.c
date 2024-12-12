/*

Wzoruj�c si� na podanych przyk�adach napisa� program w j�zyku C i w
asemblerze, kt�ry wyznaczy sumy odpowiadaj�cych sobie element�w dw�ch tablic
liczby_A i liczby_B, z kt�rych ka�da zawiera 16 liczb 8-bitowych ze znakiem (typ
char)
Do sumowania wykorzysta� rozkaz PADDSB (wersja SSE), kt�ry sumuje, z
uwzgl�dnieniem nasycenia, dwa wektory 16-elementowe z�o�one z liczb ca�kowitych 8-
bitowych.

*/

#include <stdio.h>
void dodaj_SSE(char*, char*, char*);
int main()
{
	char liczby_A[16] = { -128, -127, -126, -125, -124, -123, -122,
-121, 120, 121, 122, 123, 124, 125, 126, 127 };
	char liczby_B[16] = { -3, -3, -3, -3, -3, -3, -3, -3,
	3, 3, 3, 3, 3, 3, 3, 3 };
	char r[16];
	dodaj_SSE(liczby_A, liczby_B , r);
	for (int i = 0; i < 16; i++)
		printf("r[%d] = %c\n", i, r[i]);
	return 0;
}
