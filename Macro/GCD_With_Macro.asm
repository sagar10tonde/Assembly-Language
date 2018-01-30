%macro gcd 2

	mov esi,%1
	mov edi,%2
	dec esi
	mov ecx,%1

%%back:	cmp ecx,0
	je %%next
	xor edx,edx
	mov eax,%1
	div esi

	cmp edx,0
	je %%pass
	dec ecx
	dec esi
	jmp %%back
	
%%pass:
	mov eax,%2
	xor edx,edx
	div esi

	cmp edx,0
	je %%next
	dec esi
	dec ecx
	jmp %%back
	
%%next:	pusha
	push esi
	push %2
	push %1
	push msg3
	call printf
	add esp,16
	popa

%endmacro	

section .data
	numA dd 20
	numB dd 10
	msg db "%d",0
	msg1 db "Enter Frist Number:",0
	msg2 db "Enter Second Number:",0
	msg3 db "%d and %d GCD is %d",10,0

section .bss


section .text
	global main
	extern printf,scanf

main:

	mov eax,dword[numA]
	mov ebx,dword[numB]
	gcd eax,ebx

	
