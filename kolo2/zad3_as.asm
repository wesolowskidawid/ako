.686
.model flat

public _komunikat
extern _malloc : proc

.code
	_komunikat PROC
        push ebp            
        mov ebp, esp       
        push ebx
        push esi
        push edi
        
        mov esi, [ebp + 8] ; adres komunikatu
        xor ecx, ecx
        xor ebx, ebx ; wskaznik na znak

        ileznakow:
        mov dl, [esi][ecx]
        cmp dl, 0
        je dalej
        inc ecx
        jmp ileznakow

        dalej:
        cmp ecx, 0
        je koniec

        ; rezerwacja miejsca w pamieci (malloc)
        add ecx, 5 ; miejsce na "B³¹d."
        push ecx
        call _malloc
        pop ecx
        sub ecx, 5

        petla:
        mov dl, [esi][ebx]
        mov [eax][ebx], dl ; przeniesienie znaku do nowej tablicy
        inc ebx
        loop petla

        mov [eax][ebx], byte ptr 'B'
        inc ebx
        mov [eax][ebx], byte ptr 'l'
        inc ebx
        mov [eax][ebx], byte ptr 'a'
        inc ebx
        mov [eax][ebx], byte ptr 'd'
        inc ebx
        mov [eax][ebx], byte ptr '.'
        inc ebx


        koniec:
        pop edi
        pop esi
        pop ebx
        pop ebp         
        ret
    _komunikat ENDP
END