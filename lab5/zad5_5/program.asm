.686
.XMM ; zezwolenie na asemblacjê rozkazów grupy SSE
.model flat
public _pm_jeden

.data
tab dd 1.0, 1.0, 1.0, 1.0

.code

_pm_jeden PROC
 push ebp
 mov ebp, esp
 push ebx
 push esi
 push edi
 mov esi, [ebp+8] ; adres tablicy

 movups xmm5, [esi]
 movups xmm4, [tab]

 addsubps xmm5, xmm4

 movups [esi], xmm5

 pop edi
 pop esi
 pop ebx
 pop ebp
 ret
_pm_jeden ENDP

END
