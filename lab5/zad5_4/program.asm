.686
.XMM ; zezwolenie na asemblacj� rozkaz�w grupy SSE
.model flat
public _int2float
.code

_int2float PROC
 push ebp
 mov ebp, esp
 push ebx
 push esi
 push edi
 mov esi, [ebp+8] ; adres pierwszej tablicy
 mov ebx, [ebp+12] ; adres tablicy wynikowej

 movups xmm5, [esi]

 cvtpi2ps xmm5, qword PTR [esi]

 movups [ebx], xmm5
 pop edi
 pop esi
 pop ebx
 pop ebp
 ret
_int2float ENDP

END
