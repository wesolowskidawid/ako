; Zadanie 3.3. Napisać program, który wczyta z klawiatury liczbę dziesiętną mniejszą od
; 60000 i wyświetli na ekranie kwadrat tej liczby. W programie wykorzystać podprogramy
; wczytaj_do_EAX i wyswietl_EAX.


; wczytywanie liczby dziesiętnej z klawiatury – po
; wprowadzeniu cyfr należy nacisnąć klawisz Enter
; liczba po konwersji na postać binarną zostaje wpisana
; do rejestru EAX
; deklaracja tablicy do przechowywania wprowadzanych cyfr
; (w obszarze danych)

.686
.model flat
extern __write : PROC ; (dwa znaki podkreślenia)
extern __read : PROC ; (dwa znaki podkreślenia)
extern _ExitProcess@4 : PROC
public _main
.data
	znaki db 12 dup (?)
	obszar db 12 dup (?)
	dziesiec dd 10 ; mnożnik
	tekst db 10, 'Liczba za wysoka', 10

.code
wczytaj_do_EAX PROC
	; max ilość znaków wczytywanej liczby
	push dword PTR 12
	push dword PTR OFFSET obszar ; adres obszaru pamięci
	push dword PTR 0; numer urządzenia (0 dla klawiatury)
	call __read ; odczytywanie znaków z klawiatury
	; (dwa znaki podkreślenia przed read)
	add esp, 12 ; usunięcie parametrów ze stosu
	; bieżąca wartość przekształcanej liczby przechowywana jest
	; w rejestrze EAX; przyjmujemy 0 jako wartość początkową
	mov eax, 0
	mov ebx, OFFSET obszar ; adres obszaru ze znakami
	pobieraj_znaki:
	mov cl, [ebx] ; pobranie kolejnej cyfry w kodzie
	; ASCII
	inc ebx ; zwiększenie indeksu
	cmp cl,10 ; sprawdzenie czy naciśnięto Enter
	je byl_enter ; skok, gdy naciśnięto Enter
	sub cl, 30H ; zamiana kodu ASCII na wartość cyfry
	movzx ecx, cl ; przechowanie wartości cyfry w
	; rejestrze ECX
	; mnożenie wcześniej obliczonej wartości razy 10
	mul dword PTR dziesiec
	add eax, ecx ; dodanie ostatnio odczytanej cyfry
	jmp pobieraj_znaki ; skok na początek pętli
	byl_enter:
	; wartość binarna wprowadzonej liczby znajduje się teraz w
	; rejestrze EAX
	ret
wczytaj_do_EAX ENDP

wyswietl_EAX PROC
	pusha
	mov esi, 10 ; indeks w tablicy 'znaki'
	mov ebx, 10 ; dzielnik równy 10
konwersja:
	mov edx, 0 ; zerowanie starszej części dzielnej
	div ebx ; dzielenie przez 10, reszta w EDX,
	; iloraz w EAX
	add dl, 30H ; zamiana reszty z dzielenia na kod
	; ASCII
	mov znaki [esi], dl; zapisanie cyfry w kodzie ASCII
	dec esi ; zmniejszenie indeksu
	cmp eax, 0 ; sprawdzenie czy iloraz = 0
	jne konwersja ; skok, gdy iloraz niezerowy
	; wypełnienie pozostałych bajtów spacjami i wpisanie
	; znaków nowego wiersza
wypeln:
	or esi, esi
	jz wyswietl ; skok, gdy ESI = 0
	mov byte PTR znaki [esi], 20H ; kod spacji
	dec esi ; zmniejszenie indeksu
	jmp wypeln
wyswietl:
	mov byte PTR znaki [0], 0AH ; kod nowego wiersza
	mov byte PTR znaki [11], 0AH ; kod nowego wiersza
	; wyświetlenie cyfr na ekranie
	push dword PTR 12 ; liczba wyświetlanych znaków
	push dword PTR OFFSET znaki ; adres wyśw. obszaru
	push dword PTR 1; numer urządzenia (ekran ma numer 1)
	call __write ; wyświetlenie liczby na ekranie
	add esp, 12 ; usunięcie parametrów ze stosu
	popa
	ret
wyswietl_EAX ENDP

_main PROC
	; wczytywanie liczby
	call wczytaj_do_EAX

	cmp eax, 60000
	ja lipa

	mul eax

	; wyswietlenie liczby
	call wyswietl_EAX
	jmp koniec

  lipa:
	push 18
	push OFFSET tekst
	push 1
	call __write
	add esp, 12
  koniec:
	push 0
	call _ExitProcess@4
_main ENDP
END
