#include <stdio.h>
#include <windows.h>

#pragma comment(lib, "Kernel32.lib")  // Dodaje bibliotekê do linkera

double size_of_files(int handle, wchar_t* parent_path);

int main()
{
	int handle;
	WIN32_FIND_DATA FindFileData;
	handle = FindFirstFile(L"F:\\ako\\egzamin\\*", &FindFileData);
	/*do {
		printf("%ls\n", FindFileData.cFileName);
	} while (FindNextFile(handle, &FindFileData));*/
	printf("Total: %f\n", size_of_files(handle, L"F:\\ako\\egzamin\\"));
	return 0;
}
