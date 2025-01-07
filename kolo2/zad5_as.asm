.686
.model flat

public _szyfruj

.code
	_szyfruj PROC
        push ebp            
        mov ebp, esp       
        push ebx
        push esi
        push edi
        
        mov esi, [ebp + 8] ; adres tekstu
        mov edx, 52525252h ; liczba losowa
        xor ecx, ecx ; dlugosc tekstu
        xor ebx, ebx

        dlugosc:
        mov al, [esi][ecx]
        cmp al, 0
        je dalej
        inc ecx
        jmp dlugosc

        dalej:
        mov al, [esi] ; pobranie pierwszego znaku
        xor al, dl ; xorowanie z losowa liczba (najmlodszymi 8 bitami)
        mov [esi], al ; zapisanie zaszyfrowanego znaku
        inc ebx
        dec ecx
        cmp ecx, 0
        je koniec

        petla:
        ; szyfrowanie
        mov eax, 80000000h ; maska na 31 bit
        and eax, edx ; w eax jest najstarszy bit
        mov edi, 40000000h ; maska na 30 bit
        and edi, edx ; w edi jest drugi najstarszy bit
        rol edi, 1 ; przesuniecie bitowe w lewo
        xor eax, edi
        bt eax, 31
        rcl edx, 1

        ; zapisanie
        mov al, [esi][ebx]
        xor al, dl
        mov [esi][ebx], al
        inc ebx
        loop petla

        koniec:
        pop edi
        pop esi
        pop ebx
        pop ebp         
        ret
    _szyfruj ENDP
END