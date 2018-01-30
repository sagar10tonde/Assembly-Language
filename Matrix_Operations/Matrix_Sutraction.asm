section .data
	msg db "%d",0
	msg1 db "how many Row You Want (n):",0
	msg2 db "how many col You Want (m):",0
	msg3 db "Enter Frist Matrix  Elements:",10,0
	msg4 db "ENter Second Matrix Elements:",10,0
	msg5 db "Your first Matrix  is:",10,0
	msg6 db "Your Second Matrix is:",10,0
	msg7 db "Your Subtraction Matrix is:",10,0
	sp1 db 9,0
	sp2 db 10,0


section .bss
	mat1 resd 50
	mat2 resd 50
	mat3 resd 50
	n resd 1
	m resd 1
	c resd 1

section .text
	global main
	extern printf,scanf

main:

	pusha
	push msg1
	call printf
	add esp,4
	popa

	pusha
	push n
	push msg
	call scanf
	add esp,8
	popa

	pusha
	push msg2
	call printf
	add esp,4
	popa

	pusha
	push m
	push msg
	call scanf
	add esp,8
	popa

	mov eax,dword[n]
	mul dword[m]
	mov dword[c],eax


	pusha
	push msg3
	call printf
	add esp,4
	popa
	
	mov ecx,dword[c]
	mov ebx,mat1

abc:	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	add ebx,4
	loop abc

	pusha
	push msg4
	call printf
	add esp,4
	popa
	
	mov ecx,dword[c]
	mov ebx,mat2

abx:	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	add ebx,4
	loop abx


	pusha
	push msg5
	call printf
	add esp,4
	popa

	mov ecx,dword[c]
	mov ebx,mat1

back:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa
	
pqr:	cmp edx,3
	je back
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa

	pusha
	push sp1
	call printf
	add esp,4
	popa

	add ebx,4
	inc edx
	loop pqr


	pusha
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push msg6
	call printf
	add esp,4
	popa

	mov ecx,dword[c]
	mov ebx,mat2

back1:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa
	
pqr1:	cmp edx,3
	je back1
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa

	pusha
	push sp1
	call printf
	add esp,4
	popa

	add ebx,4
	inc edx
	loop pqr1


	pusha
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push sp2
	call printf
	add esp,4
	popa

	mov eax,mat3
	mov ebx,mat1
	mov edx,mat2
	xor ecx,ecx

back2:	cmp ecx,dword[c]
	je end
	mov esi,dword[ebx]
	mov edi,dword[edx]
	sub esi,edi
	mov dword[eax],esi
	add ebx,4
	add edx,4
	add eax,4
	inc ecx
	jmp back2

end:	
	pusha
	push msg7
	call printf
	add esp,4
	popa

	mov ecx,dword[c]
	mov ebx,mat3

back11:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa
	
pqr11:	cmp edx,3
	je back11
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa

	pusha
	push sp1
	call printf
	add esp,4
	popa

	add ebx,4
	inc edx
	loop pqr11


	pusha
	push sp2
	call printf
	add esp,4
	popa


	pusha
	push sp2
	call printf
	add esp,4
	popa
