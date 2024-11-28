#include <stdio.h>

void przestaw(int tabl[], int n);

int main()
{
	int tab[5] = { 3, 2, 1, 5, 4 };
	int i;
	for (int i = 5; i > 1; i--)
	{
		przestaw(tab, i);
	}
	for (i = 0; i < 5; i++)
		printf("%d ", tab[i]);
	printf("\n");
	return 0;
}
