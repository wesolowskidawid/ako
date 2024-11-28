.686
.model flat

public _szukaj4_max

.code
	_szukaj4_max PROC
		push ebp ; zapisanie zawartoœci EBP na stosie
		mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
		mov eax, [ebp+8] ; liczba a
		cmp eax, [ebp+12] ; liczba b
		jge x1
		mov eax, [ebp+12] ; liczba b do EAX

		x1:
		cmp eax, [ebp+16] ; liczba c
		jge x2
		mov eax, [ebp+16] ; liczba c do EAX

		x2:
		cmp eax, [ebp+20] ; liczba d
		jge zakoncz
		mov eax, [ebp+20] ; liczba d do EAX

		zakoncz:
		pop ebp
		ret
	_szukaj4_max ENDP
END