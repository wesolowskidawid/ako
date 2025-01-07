.686
.model flat
public _liczba_procesorow
extern _GetSystemInfo@4 : proc
extern _malloc : proc
.code
_liczba_procesorow PROC
push ebp
mov ebp, esp
push ebx
mov eax, 32
push eax
call _malloc
add esp, 4
mov ebx, eax
push ebx
; stdcall zwalnia sam stos
call _GetSystemInfo@4
mov eax, dword ptr [ebx+20]
pop ebx
pop ebp
ret
_liczba_procesorow ENDP
END