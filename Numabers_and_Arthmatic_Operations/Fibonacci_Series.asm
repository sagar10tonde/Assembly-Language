section .data
	num dd 100
	msg db "%d",0
	msg1 db "Fibonacci series:",0
	sp1 db 9,0
	sp2 db 10,0

section .bss

section .text
	global main
	extern printf

main:
	xor eax,eax
	xor ecx,ecx
	mov ebx,1

	pusha
	push msg1
	call printf
	add esp,4
	popa
	
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	
	pusha
	push sp1
	call printf
	add esp,4
	popa

	pusha
	push ebx
	push msg
	call printf
	add esp,8
	popa
	
	pusha
	push sp1
	call printf
	add esp,4
	popa
	
	
back:	cmp ecx,dword[num]
	jge end
	mov esi,ebx
	add eax,ebx
	mov ecx,eax
	mov ebx,eax
	mov eax,esi

	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa
	
	pusha
	push sp1
	call printf
	add esp,4
	popa

	jmp back


end:	
	pusha
	push sp2
	call printf
	add esp,4
	popa
