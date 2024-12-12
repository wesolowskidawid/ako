.686
.model flat

public _srednia_harm

.code
	_srednia_harm PROC
        ; Parametry funkcji:
        ; tablica (adres) - znajduje siê na [ebp+8]
        ; n (liczba elementów) - znajduje siê na [ebp+12]

        ; Rejestry lokalne
        push ebp                ; Zapisz bazowy wskaŸnik stosu
        mov ebp, esp            ; Ustaw nowy bazowy wskaŸnik stosu

        ; Inicjalizacje
        fldz                    ; Stos FPU: 0 (inicjalizacja sumy odwrotnoœci)
        mov ecx, DWORD PTR [ebp+12] ; Pobierz n do EAX (dla pêtli)
        test ecx, ecx           ; SprawdŸ, czy n == 0
        jz _return_zero         ; Jeœli n == 0, zwróæ zero

        mov esi, DWORD PTR [ebp+8] ; Pobierz adres tablicy do ESI

    _sum_loop:
        fld DWORD PTR [esi]     ; Za³aduj tablica[i] na stos FPU
        ftst                    ; Porównaj tablica[i] z 0.0 (implicit check)
        fnstsw ax               ; Pobierz flagi statusu
        sahf                    ; Za³aduj flagi do procesora
        jbe _return_zero        ; Jeœli tablica[i] <= 0, zwróæ zero

        fld1                    ; Za³aduj 1.0 na stos FPU
        fdiv st(0), st(1)    ; Oblicz 1.0 / tablica[i]
        faddp st(2), st(0)      ; Dodaj do sumy odwrotnoœci
        fxch st(1)

        add esi, 4              ; PrzejdŸ do nastêpnego elementu tablicy
        dec ecx                 ; Zmniejsz licznik pêtli
        jnz _sum_loop           ; Powtarzaj, jeœli s¹ jeszcze elementy

        ; Obliczenie wyniku (n / suma)
        mov eax, DWORD PTR [ebp+12] ; Pobierz n do EAX
        push eax                ; Zapisz n na stosie
        fild DWORD PTR [esp]    ; Za³aduj n jako float na stos FPU
        add esp, 4              ; Usuñ n ze stosu
        fdivr st(1), st(0)      ; Oblicz n / suma (wynik na st(0))
        fstp st(0)

        jmp _exit

    _return_zero:
        fldz                    ; Zwróæ zero jako wynik

    _exit:
        mov esp, ebp            ; Przywróæ wartoœæ stosu
        pop ebp                 ; Przywróæ wskaŸnik bazowy
        ret
    _srednia_harm ENDP
END