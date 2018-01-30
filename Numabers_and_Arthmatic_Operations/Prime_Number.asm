section .data
	num dd 5
	msg db "%d",10,0
	msg1 db "%d Number is Prime",10,0
	msg2 db "%d Number Is NOT Prime",10,0
	msg3 db "%d NOT",10,0


section .bss


section .text
	global main
	extern printf,scanf

main:
	cmp dword[num],0
	je case1
	cmp dword[num],1
	je case1
	cmp dword[num],2
	je case2
	cmp dword[num],3
	je case2
	cmp dword[num],4
	je case1
	jmp case3
case1:	jmp ok
case2:	jmp end
	
case3:	mov eax,dword[num]
	mov ebx,2
	xor edx,edx
	div ebx
	mov edi,eax
	
	mov ecx,2

	pusha
back:	cmp ecx,edi
	je end
	xor edx,edx
	xor eax,eax
	mov eax,dword[num]
	div ecx

	cmp edx,0
	je ok

	inc ecx
	jmp back

ok:
	pusha
	push dword[num]
	push msg2
	call printf
	add esp,8
	popa
	mov eax,1
	int 80h


end:
	pusha
	push dword[num]
	push msg1
	call printf
	add esp,8
	popa
	mov eax,1
	int 80h
	popa
