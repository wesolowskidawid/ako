/*

Wzoruj¹c siê na podanych przyk³adach napisaæ program w jêzyku C i w
asemblerze, który wyznaczy sumy odpowiadaj¹cych sobie elementów dwóch tablic
liczby_A i liczby_B, z których ka¿da zawiera 16 liczb 8-bitowych ze znakiem (typ
char)
Do sumowania wykorzystaæ rozkaz PADDSB (wersja SSE), który sumuje, z
uwzglêdnieniem nasycenia, dwa wektory 16-elementowe z³o¿one z liczb ca³kowitych 8-
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
