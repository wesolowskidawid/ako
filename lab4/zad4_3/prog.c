#include <stdio.h>

void odejmij_jeden(int** liczba);

int main()
{
	int k;
	int* wsk;
	wsk = &k;
	printf("\nProsze napisac liczbe: ");
	scanf_s("%d", &k);
	odejmij_jeden(&wsk);
	printf("\nWynik = %d\n", k);
	return 0;
}
