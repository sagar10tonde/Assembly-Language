section .data
	msg db "%d",0
	msg1 db "Enter How Many Row You Want (n):",0
	msg2 db "Enter How Many Col You Want (m):",0
	msg3 db "Enter Eelemnets of matrix:",10,0
	msg4 db "Your Enter Matrix is:",10,0
	msg5 db "Trasnspose Matrix is:",10,0
	sp1  db 9,0
	sp2  db 10,0

section .bss
	mat resd 50
	n   resd 1
	m   resd 1
	c   resd 1
	p   resd 1
	f   resd 1

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

	pusha
	push msg3
	call printf
	add esp,4
	popa

	mov eax,dword[n]
	mul dword[m]
	mov dword[c],eax

	mov ecx,dword[c]
	mov ebx,mat

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
	mov ebx,mat


back:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa

pqr:	cmp edx,dword[m]
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

	inc edx
	add ebx,4
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
	push msg5	
	call printf
	add esp,4
	popa


	
	mov ebx,mat
	

	xor edi,edi
pqr1:	cmp edi,dword[m]
	je next
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
	inc edi
	add ebx,12
	jmp pqr1
	
next:

	pusha
	push sp2
	call printf
	add esp,4
	popa

	mov ebx,mat
	add ebx,4

	
	xor edi,edi
pqr11:	cmp edi,dword[m]
	je next1
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
	inc edi
	add ebx,12
	jmp pqr11

	
next1:	



	pusha
	push sp2
	call printf
	add esp,4
	popa

	mov ebx,mat
	add ebx,8

	
	xor edi,edi
pqr111:	cmp edi,dword[m]
	je next11
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
	inc edi
	add ebx,12
	jmp pqr111

	
next11:	

	pusha
	push sp2
	call printf
	add esp,4
	popa
