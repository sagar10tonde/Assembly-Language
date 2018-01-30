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
	mov esi,dword[numA]
	mov edi,dword[numB]
	dec esi
	mov ecx,dword[numA]

back:	cmp ecx,0
	je next
	xor edx,edx
	mov eax,dword[numA]
	div esi

	cmp edx,0
	je pass
	dec ecx
	dec esi
	jmp back
	
pass:
	mov eax,dword[numB]
	xor edx,edx
	div esi

	cmp edx,0
	je next
	dec esi
	dec ecx
	jmp back
	
next:	pusha
	push esi
	push dword[numB]
	push dword[numA]
	push msg3
	call printf
	add esp,16
	popa
