.686
.model flat

public _nowy_exp

.code
	_nowy_exp PROC
        push ebp            
        mov ebp, esp   
        sub esp, 8

        finit

        mov ebx, [ebp + 8] ; x do ebx
        mov [esp], ebx 
        mov ecx, 19 ; 20 obiegow petli
        fld1 ; st(0) = 1
        mov esi, 1
        mov [esp+4], esi
        mov edi, 1

    _ptl:
        fld1
        _mini_ptl:
            fild dword ptr [esp+4] ; st(0) = esi
            fmulp st(1), st(0) ; st(1) = st(1) * st(0), kasujemy st(0) wiec wynik w st(0)
            dec esi
            mov [esp+4], esi
            jnz _mini_ptl
        ; st(0) = 1*2*3*...*esi
        fld dword ptr [esp] ; st(0) = x, st(1) = 1*2*3*...*esi
        mov esi, edi ; w esi potega
        dec esi
        cmp esi, 0
        je _dalej
        _pot_ptl:
           fld dword ptr [esp]
           fmulp st(1), st(0)
           dec esi
           jnz _pot_ptl

        _dalej:

        fdivr st(1), st(0) ; st(1) = st(0) / st(1)
        fstp st(0) ; st(0) = st(1), kasujemy st(1)
        faddp st(1), st(0) ; st(1) = st(0) + st(1)

        dec ecx
        inc edi
        mov esi, edi
        mov [esp+4], esi
        cmp ecx, 0
        jne _ptl

    _exit:
        add esp, 8
        mov esp, ebp  
        pop ebp          
        ret
    _nowy_exp ENDP
END