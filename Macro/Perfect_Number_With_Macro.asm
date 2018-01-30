%macro perfect 1

	mov eax,%1
	mov ecx,2
	xor edx,edx
	div ecx
	mov edi,eax
	inc edi

	pusha
	mov ecx,1
	xor ebx,ebx
	
%%back:	cmp ecx,edi
	je %%end
	xor edx,edx
	xor eax,eax
	mov eax,%1
	div ecx
	cmp edx,0
	je %%ok
	inc ecx
	jmp %%back
%%ok:
	add ebx,ecx
	inc ecx
	jmp %%back

%%end:	
	
	cmp ebx,%1
	je %%same
	pusha
	push %1
	push msg2
	call printf
	add esp,8
	popa
	mov eax,1
	int 80h

%%same:
	pusha
	push %1
	push msg1
	call printf
	add esp,8
	popa

	popa
	
%endmacro
	
section .data
	num dd 6
	msg db "%d",0
	msg1 db "%d Number is Perfect Number",10,0
	msg2 db "%d NUmber is Not Perfect Number",10,0


section .bss

section .text
	global main
	extern printf

main:

	mov eax,dword[num]
	perfect eax
