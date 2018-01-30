%macro length 1

	mov ecx,1000
	push ecx
	mov al,0
	mov edi,%1
	repnz scasb
	inc ecx
	mov edx,ecx
	pop ecx
	sub ecx,edx

	pusha
	push ecx
	push msg1
	call printf
	add esp,8
	popa
	ret

%endmacro	


section .data
	str1 db 'sagar dahatonde',0
	msg1 db 'String Length=%d',10,0

section .text
	global main
	extern printf

main :
	mov eax,str1
	length eax
