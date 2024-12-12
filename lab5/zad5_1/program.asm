.686
.model flat

public _srednia_harm

.code
	_srednia_harm PROC
        ; Parametry funkcji:
        ; tablica (adres) - znajduje si� na [ebp+8]
        ; n (liczba element�w) - znajduje si� na [ebp+12]

        ; Rejestry lokalne
        push ebp                ; Zapisz bazowy wska�nik stosu
        mov ebp, esp            ; Ustaw nowy bazowy wska�nik stosu

        ; Inicjalizacje
        fldz                    ; Stos FPU: 0 (inicjalizacja sumy odwrotno�ci)
        mov ecx, DWORD PTR [ebp+12] ; Pobierz n do EAX (dla p�tli)
        test ecx, ecx           ; Sprawd�, czy n == 0
        jz _return_zero         ; Je�li n == 0, zwr�� zero

        mov esi, DWORD PTR [ebp+8] ; Pobierz adres tablicy do ESI

    _sum_loop:
        fld DWORD PTR [esi]     ; Za�aduj tablica[i] na stos FPU
        ftst                    ; Por�wnaj tablica[i] z 0.0 (implicit check)
        fnstsw ax               ; Pobierz flagi statusu
        sahf                    ; Za�aduj flagi do procesora
        jbe _return_zero        ; Je�li tablica[i] <= 0, zwr�� zero

        fld1                    ; Za�aduj 1.0 na stos FPU
        fdiv st(0), st(1)    ; Oblicz 1.0 / tablica[i]
        faddp st(2), st(0)      ; Dodaj do sumy odwrotno�ci
        fxch st(1)

        add esi, 4              ; Przejd� do nast�pnego elementu tablicy
        dec ecx                 ; Zmniejsz licznik p�tli
        jnz _sum_loop           ; Powtarzaj, je�li s� jeszcze elementy

        ; Obliczenie wyniku (n / suma)
        mov eax, DWORD PTR [ebp+12] ; Pobierz n do EAX
        push eax                ; Zapisz n na stosie
        fild DWORD PTR [esp]    ; Za�aduj n jako float na stos FPU
        add esp, 4              ; Usu� n ze stosu
        fdivr st(1), st(0)      ; Oblicz n / suma (wynik na st(0))
        fstp st(0)

        jmp _exit

    _return_zero:
        fldz                    ; Zwr�� zero jako wynik

    _exit:
        mov esp, ebp            ; Przywr�� warto�� stosu
        pop ebp                 ; Przywr�� wska�nik bazowy
        ret
    _srednia_harm ENDP
END