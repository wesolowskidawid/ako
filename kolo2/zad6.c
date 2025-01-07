#include <stdio.h>

unsigned int kwadrat(unsigned int a);

int main() {
	unsigned int a = 65000;
	unsigned int wynik = kwadrat(a);
	printf("Kwadrat liczby %u to %u", a, wynik);
	return 0;
}
