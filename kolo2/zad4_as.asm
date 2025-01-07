.686
.model flat

public _szukaj_elem_min

.code
	_szukaj_elem_min PROC
        push ebp            
        mov ebp, esp       
        push ebx
        push esi
        push edi
        
        mov esi, [ebp + 8] ; adres tablicy
        mov ecx, [ebp + 12] ; ilosc elementow
        mov eax, esi

        mov edx, [esi]
        dec ecx

        petla:
        add esi, 4
        mov ebx, [esi]
        cmp edx, ebx
        jg zmiana
        loop petla
        jmp koniec

        zmiana:
        mov edx, ebx
        mov eax, esi
        loop petla
        jmp koniec


        koniec:
        pop edi
        pop esi
        pop ebx
        pop ebp         
        ret
    _szukaj_elem_min ENDP
END