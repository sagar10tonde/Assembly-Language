%macro copy 2

	mov esi,%1
	mov edi,str2
	mov ecx,%2

%%lp:	movsb
	loop %%lp

	mov eax,4
	mov ebx,1
	mov ecx,str2
	mov edx,len
	int 80h
	


%endmacro	

section .data
	str1 db "sagar dahatonde",10,0
	len equ $-str1

section .bss
	str2 resb len

section .text
	global main

main:

	mov eax,str1
	mov ecx,len
	copy eax,ecx
