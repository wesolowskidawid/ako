#include <stdio.h>

void szyfruj(char* tekst);

int main() {
	char tekst[] = "To jest tekst bump";
	szyfruj(tekst);
	printf("%s\n", tekst);
	return 0;
}
