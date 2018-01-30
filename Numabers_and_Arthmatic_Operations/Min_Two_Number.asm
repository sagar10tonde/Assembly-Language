section .data
	numA dd 150
	numB dd 125
	msg1 db "%d Number is Minimum",10,0

section .text
	global main
	extern printf

main:
	mov eax,dword[numA]
	mov ebx,dword[numB]
	cmp eax,ebx
	jle less
	pusha
	push ebx
	push msg1
	call printf
	add esp,8
	popa
	mov eax,1
	int 80h


less:

	pusha
	push eax
	push msg1
	call printf
	add esp,8
	popa
