.686
.model flat

public _size_of_files
extern _FindNextFileW@8 : proc

;typedef struct _WIN32_FIND_DATA {
;    DWORD dwFileAttributes;      // Offset 0
;    FILETIME ftCreationTime;     // Offset 4 (qword, 8 bajtów)
;    FILETIME ftLastAccessTime;   // Offset 12 (qword, 8 bajtów)
;    FILETIME ftLastWriteTime;    // Offset 20 (qword, 8 bajtów)
;    DWORD nFileSizeHigh;         // Offset 28
;    DWORD nFileSizeLow;          // Offset 32
;    DWORD dwOID;                 // Offset 36
;    TCHAR cFileName[MAX_PATH];   // Offset 40 (MAX_PATH = 260 znaków)
;} WIN32_FIND_DATA;

.code
	_size_of_files PROC
		push ebp ; zapisanie zawartoœci EBP na stosie
		mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
		push esi
		push edi
		push ebx
		sub esp, 320

		finit
		fldz
		
		; argumenty funkcji
		; [ebp+8] - int handle (FindFirstFile)
		; [ebp+12] - wchar_t* parent_path

		petla:
		lea eax, [ebp-320]
		push eax

		mov eax, [ebp+8]
		push eax

		call _FindNextFileW@8

		test eax, eax
		jz koniec_petli

		; sprawdzenie czy plik to katalog
		mov eax, [ebp-320]
		test eax, 10h
		jnz petla

		; pobranie 64-bit rozmiaru pliku
		mov eax, [ebp-320+32]
		mov edx, [ebp-320+28]

		; wrzucenie na stos
		push edx
		push eax
		; zaladowanie na stos koprocesora
		fild qword ptr [esp]
		add esp, 8

		faddp

		jmp petla

		koniec_petli:

		pop ebx
		pop esi
		pop edi
		mov esp, ebp
		pop ebp
		ret
	_size_of_files ENDP
END