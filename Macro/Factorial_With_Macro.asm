%macro factorial 1

	mov esi,%1
	inc esi
	mov edi,dword[fact]
	mov eax,1

	mov ecx,1
%%back:	cmp ecx,esi
	je %%end
	mul ecx


	inc ecx
	jmp %%back

%%end:
	pusha
	push eax
	push dword[num]
	push msg1
	call printf
	add esp,12
	popa

%endmacro

section .data
	num dd 5	
	msg db "%d",0
	msg1 db "%d Factorial is :%d",10,0


section .bss
	fact resd 1
	
section .text
	global main
	extern printf

main:

	mov eax,dword[num]
	factorial eax



	
