%macro avr 2
	mov edi,%2
	
	pusha
	push msg3
	call printf
	add esp,4
	popa

	mov ecx,edi
	mov ebx,%1
	mov eax,dword[ebx]

%%back:	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa
	
	pusha
	push msg4
	call printf
	add esp,4
	popa

	add ebx,4
	add eax,dword[ebx]

	loop %%back

	pusha
	mov ecx,edi
	xor edx,edx
	div ecx
	
	pusha	
	push eax
	push msg5
	call printf
	add esp,8
	popa

	popa
	
%endmacro


section .data
	msg db "%d",0
	msg1 db "Enter How many Element You Want:",0
	msg2 db "Enter Element:",10,0
	msg3 db "Your are Enter Element:",10,0
	msg4 db 10,0
	msg5 db "Your Avrege is:%d",10,0
	

	
section .bss
	arr resd 50
	n resd 1
	sum resd 1

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

abc:
	xor eax,eax
	
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	add ebx,4
	loop abc
	

	mov eax,arr
	mov ebx,dword[n]
	avr eax,ebx
