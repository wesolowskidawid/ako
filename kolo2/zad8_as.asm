.686
.model flat

public _main
extern _ExitProcess@4 : PROC

.code
	_main PROC
        
    mov ebx, 00000080h ; przykladowa wartosc
    mov edx, ebx
    shr edx, 7 ; przesuniecie bitowe w prawo o 7 miejsc
    cmp edx, 0 ; sprawdzenie czy to co zostalo w edx jest rowne 0
    je zero
    stc ; ustawienie cf na 1
    jmp koniec

    zero:
    clc ; ustawienie cf na 0

    koniec:
    push 0
    call _ExitProcess@4

    _main ENDP
END