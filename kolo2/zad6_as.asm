.686
.model flat

public _kwadrat

.code
	_kwadrat PROC
        push ebp            
        mov ebp, esp       
        push ebx
        push esi
        push edi
        
        mov esi, [ebp + 8] ; adres liczby
        cmp esi, 0
        je koniec
        cmp esi, 1
        je koniec

        mov eax, esi
        add eax, eax
        add eax, eax
        mov edi, eax ; w edi 4* liczba

        sub esi, 2
        push esi
        call _kwadrat
        add esp, 4
        mov esi, eax ; w esi wynik

        add esi, edi
        sub esi, 4

        koniec:
        mov eax, esi
        pop edi
        pop esi
        pop ebx
        pop ebp         
        ret
    _kwadrat ENDP
END