section .data
	n1 dd 3
	m1 dd 3
	n2 dd 3
	m2 dd 3
	msg db "%d",0
	msg1 db "how many Row You Want (n):%d",10,0
	msg2 db "how many col You Want (m):%d",10,0
	msg3 db "Enter Frist Matrix  Elements:",10,0
	msg4 db "ENter Second Matrix Elements:",10,0
	msg5 db "Your first Matrix  is:",10,0
	msg6 db "Your Second Matrix is:",10,0
	msg7 db "Your Multiplication Matrix is:",10,0
	sp1 db 9,0
	sp2 db 10,0


section .bss
	mat1 resd 50
	mat2 resd 50
	mat3 resd 50
	c1 resd 1
	c2 resd 1
	a  resd 1
	b  resd 1
	c  resd 1
	t  resd 1
	f  resd 1
	p1 resd 1
	p2 resd 1
 	
section .text
	global main
	extern printf,scanf

main:

	pusha
	push dword[n1]
	push msg1
	call printf
	add esp,8
	popa

	pusha
	push dword[m1]
	push msg2
	call printf
	add esp,8
	popa

	mov eax,dword[n1]
	mul dword[m1]
	mov dword[c1],eax


	pusha
	push msg3
	call printf
	add esp,4
	popa
	
	mov ecx,dword[c1]
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
	push sp2
	call printf
	add esp,4
	popa

	
	pusha
	push dword[n2]
	push msg1
	call printf
	add esp,8
	popa

	pusha
	push dword[m2]
	push msg2
	call printf
	add esp,8
	popa


	mov eax,dword[n2]
	mul dword[m2]
	mov dword[c2],eax

	pusha
	push msg4
	call printf
	add esp,4
	popa
	
	mov ecx,dword[c2]
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
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push msg5
	call printf
	add esp,4
	popa

	mov ecx,dword[c1]
	mov ebx,mat1

pk1:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa

pqr:	cmp edx,dword[m1]
	je pk1

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

	mov ecx,dword[c2]
	mov ebx,mat2

pk2:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa

pqx:	cmp edx,dword[m2]
	je pk2

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
	loop pqx

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

	
	
	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0

	xor eax,eax
	xor edx,edx
 	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	mov dword[ebx],eax

	


	
	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0


	xor eax,eax
	xor edx,edx
 	mov eax,dword[esi]
	add edi,4
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,4
	mov dword[ebx],eax
	


	
	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0


	xor eax,eax
	xor edx,edx
 	mov eax,dword[esi]
	add edi,8
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,8
	mov dword[ebx],eax



	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0


	xor eax,eax
	xor edx,edx
	add esi,12
 	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax


	mov eax,dword[a]
	add ebx,12
	mov dword[ebx],eax



		
	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0

	

	xor eax,eax
	xor edx,edx
	add esi,12
 	mov eax,dword[esi]
	add edi,4
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,16
	mov dword[ebx],eax

	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0

	xor eax,eax
	xor edx,edx
	add esi,12
 	mov eax,dword[esi]
	add edi,8
	mul dword[edi]
	add dword[a],eax

	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,20
	mov dword[ebx],eax
	
	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0

	xor eax,eax
	xor edx,edx
	add esi,24
 	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,24
	mov dword[ebx],eax
	

	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0

	xor eax,eax
	xor edx,edx
	add esi,24
 	mov eax,dword[esi]
	add edi,4
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,28
	mov dword[ebx],eax


	
	mov esi,mat1
	mov edi,mat2
	mov ebx,mat3
	mov dword[a],0

	xor eax,eax
	xor edx,edx
	add esi,24
 	mov eax,dword[esi]
	add edi,8
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax
	
	add esi,4
	add edi,12
	xor eax,eax
	xor edx,edx
	mov eax,dword[esi]
	mul dword[edi]
	add dword[a],eax

	mov eax,dword[a]
	add ebx,32
	mov dword[ebx],eax





	pusha
	push msg7
	call printf
	add esp,4
	popa

	mov ecx,dword[c2]
	mov ebx,mat3

pk3:	xor edx,edx
	pusha
	push sp2
	call printf
	add esp,4
	popa

pqxx:	cmp edx,dword[m2]
	je pk3

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
	loop pqxx

	pusha
	push sp2
	call printf
	add esp,4
	popa
