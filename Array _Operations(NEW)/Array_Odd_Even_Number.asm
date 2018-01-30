section .data
	msg db "%d",0
	msg1 db "Enter Hoe Many Elements You Wants:",0
	msg2 db "Enter Elements:",10,0
	msg3 db "Your Elements  is:",0
	msg4 db "Array Even Number:",0
	msg5 db "Array Odd   Numbe:",0
	sp1 db 9,0
	sp2 db 10,0


section .bss
	arr1 resd 50
	arr2 resd 50
	arr3 resd 50
	n resd 1
	c1 resd 1
	c2 resd 1

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
	mov ebx,arr1

back:	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa

	add ebx,4
	loop back


	pusha
	push msg3
	call printf
	add esp,4
	popa


	mov ecx,dword[n]
	mov ebx,arr1

back1:	pusha
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
	loop back1

	pusha
	push sp2
	call printf
	add esp,4
	popa


	mov ebx,arr1
	mov esi,arr2
	mov edi,arr3
	xor edx,edx
	mov ecx,2

abc:	cmp dword[n],0
	je end
	xor eax,eax
	mov eax,dword[ebx]
	div ecx
	cmp edx,0
	je even

	pusha
	mov eax,dword[ebx]
	mov dword[edi],eax
	inc dword[c2]
	popa

	add edi,4
	add ebx,4
	dec dword[n]
	jmp abc
	
even:
	pusha
	mov eax,dword[ebx]
	mov dword[esi],eax
	inc dword[c1]
	popa

	
	add esi,4
	add ebx,4
	dec dword[n]
	jmp abc

end:
	pusha
	push msg4
	call printf
	add esp,4
	popa
	
	mov ecx,dword[c1]
	mov ebx,arr2
	
print1:	pusha
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
	loop print1

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
	
	mov ecx,dword[c2]
	mov ebx,arr3
	
print2:	pusha
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
	loop print2

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
