%macro permutation 2

	mov eax,%1
	mov ebx,%1
	mov ecx,1
	xor edx,edx

%%back:	cmp ecx,%2
	je %%end
	mul ebx
	inc ecx
	jmp %%back

%%end:
	pusha
	push eax
	push msg3
	call printf
	add esp,8
	popa

%endmacro
	
section .data
	msg db "%d",0
	msg1 db "Enetr Number Of Elements (N):",0
	msg2 db "Enter NUmber of Repetition (R):",0
	msg3 db "Permutations with Repetition (n^r) is :%d",10,0
	sp1 db 10,0

section .bss
 	n resd 1
	r resd 1

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

	pusha
	push r
	push msg
	call scanf
	add esp,8
	popa

	mov eax,dword[n]
	mov ebx,dword[r]
	permutation eax,ebx
	
	
