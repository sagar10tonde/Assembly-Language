%macro revers 2
	
	mov esi,%1
	mov edi,str2
	mov ecx,%2
	dec ecx
	add esi,ecx
	mov ecx,%2

%%lp:	std
	lodsb
	cld
	stosb
	loop %%lp

	mov eax,4
	mov ebx,1
	mov ecx,str2
	mov edx,%2
	int 80h

%endmacro


section .data
	str1 db "sagar dahatonde",10,0
	len equ $-str1

section .bss
	str2 resb 100

section .text
	global main

main:
	mov eax,str1
	mov ebx,len
	revers eax,ebx
