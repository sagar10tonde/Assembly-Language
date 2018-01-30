%macro copy 2
	mov edx,%2
	
	
	mov ecx,edx
	mov eax,%1
	mov ebx,arr2

%%abc:	mov esi,dword[eax]
	mov dword[ebx],esi
	add ebx,4
	add eax,4
	loop %%abc

	pusha
	push msg4
	call printf
	add esp,4
	popa

	
	mov ecx,edx
	mov ebx,arr2

%%back2:pusha
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
	loop %%back2

	
	pusha
	push sp2
	call printf
	add esp,4
	popa

%endmacro

section .data
	msg db "%d",0
	msg1 db "Enter Hoe Many Elements You Wants:",0
	msg2 db "Enter Elements:",10,0
	msg3 db "Your Elements is:",0
	msg4 db "Copy Array    is:",0
	sp1 db 9,0
	sp2 db 10,0


section .bss
	arr1 resd 50
	arr2 resd 50
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
	push sp2
	call printf
	add esp,4
	popa

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

	mov eax,arr1
	mov ebx,dword[n]
	copy eax,ebx
