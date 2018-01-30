%macro combination 2
	
	mov esi,%1
	inc esi
	mov edi,%2
	mov eax,1
	mov ecx,1
	
%%back:	cmp ecx,esi
	je %%next
	mul ecx
	inc ecx
	jmp %%back

%%next:
	mov dword[nfact],eax
	mov edi,dword[r]
	inc edi
	mov eax,1
	mov ecx,1
	
%%back1:cmp ecx,edi
	je %%next1
	mul ecx
	inc ecx
	jmp %%back1
	
%%next1:
	mov dword[rfact],eax
	xor edx,edx
	dec esi
	dec edi
	sub esi,edi
	inc esi
	mov eax,1
	mov ecx,1

%%back2:cmp ecx,esi
	je %%end
	mul ecx
	inc ecx
	jmp %%back2
%%end:	
	mov ebx,dword[rfact]
	xor edx,edx
	mul ebx

	mov ebx,eax
	mov eax,dword[nfact]
	xor edx,edx
	div ebx
	
	pusha
	push eax
	push msg3
	call printf
	add esp,8
	popa

%endmacro

section .data
	msg db "%d",0
	msg1 db "Enetr Number Of Elements Set (N):",0
	msg2 db "Enter Number of Elements Object (R):",0
	msg3 db "Permutations with Repetition (nCr=n!/r!(n-r)!) is :%d",10,0
	sp1 db 10,0

section .bss
 	n resd 1
	r resd 1
	nfact resd 1
	rfact resd 1
	
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
	combination eax,ebx












