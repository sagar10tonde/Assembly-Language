section .data
	msg db "%d",0
	msg1 db "Enter How Element You Want:",0
	msg2 db "Enter Elements:",10,0
	msg3 db "Your Elements   is:",0
	msg4 db "Sorted Elements is:",0
	sp1 db 9,0
	sp2 db 10,0

section .bss
	arr resd 50
	n resd 1

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

	mov ecx,dword[n]
	mov ebx,arr

abc:	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa

	add ebx,4
	loop abc

	pusha
	push msg3
	call printf
	add esp,4
	popa

	mov ecx,dword[n]
	mov ebx,arr

pqr:	pusha
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
	loop pqr

	pusha
	push sp2
	call printf
	add esp,4
	popa


back1:	mov ebx,arr
	xor ecx,ecx
	mov edx,dword[n]
	dec edx

back:	cmp ecx,edx
	je end

	mov esi,dword[ebx]
	add ebx,4
	mov edi,dword[ebx]

	cmp esi,edi
	jle ok
	sub ebx,4
	mov dword[ebx],edi
	add ebx,4
	mov dword[ebx],esi
	jmp back1


ok:	
	inc ecx
	jmp back


end:
	pusha
	push msg4
	call printf
	add esp,4
	popa

	
	mov ecx,dword[n]
	mov ebx,arr

pqr1:	pusha
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
	loop pqr1
	
	pusha
	push sp2
	call printf
	add esp,4
	popa
