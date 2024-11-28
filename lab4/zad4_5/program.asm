public suma_siedmiu_liczb

.code
	suma_siedmiu_liczb PROC
		push rbp
		mov rbp, rsp

		mov rax, rcx
		add rax, rdx
		add rax, r8
		add rax, r9
		
		mov r10, [rbp+48]
		add rax, r10
		mov r10, [rbp+56]
		add rax, r10
		mov r10, [rbp+64]
		add rax, r10

		pop rbp
		ret
	suma_siedmiu_liczb ENDP
END