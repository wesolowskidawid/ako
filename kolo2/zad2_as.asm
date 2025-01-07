.686
.model flat

public _kopia_tablicy
extern _malloc : proc

.code
	_kopia_tablicy PROC
        push ebp            
        mov ebp, esp       
        push ebx
        push esi
        push edi
        
        mov esi, [ebp + 8] ; adres tablicy
        mov ebx, [ebp + 12] ; rozmiar tablicy
        imul ebx, 4
        push ebx
        call _malloc
        add esp, 4
        cmp eax, 0
        je koniec

        xor edi, edi
        mov ecx, [ebp + 12]

        petla:
        mov edx, [esi + edi * 4]
        bt edx, 0
        jc nieparzysta
        mov [eax + edi * 4], edx
        inc edi
        loop petla
        jmp koniec

        nieparzysta:
        mov edx, 0
        mov [eax + edi * 4], edx
        inc edi
        loop petla
        jmp koniec

        koniec:
        pop edi
        pop esi
        pop ebx
        pop ebp         
        ret
    _kopia_tablicy ENDP
END