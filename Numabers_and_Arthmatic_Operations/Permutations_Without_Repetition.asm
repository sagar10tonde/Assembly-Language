section .data
	msg db "%d",0
	msg1 db "Enetr Number Of Elements Set (N):",0
	msg2 db "Enter Number of Elements Object (R):",0
	msg3 db "Permutations with Repetition (nPr=n!/(n-r)!) is :%d",10,0
	sp1 db 10,0

section .bss
 	n resd 1
	r resd 1
	nfact resd 1
	
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


	mov esi,dword[n]
	inc esi
	mov edi,dword[r]
	mov eax,1
	mov ecx,1
	
back:	cmp ecx,esi
	je next
	mul ecx
	inc ecx
	jmp back

next:
	mov dword[nfact],eax
	dec esi
	sub esi,edi
	inc esi
	mov eax,1
	mov ecx,1
	
back1:	cmp ecx,esi
	je end
	mul ecx
	inc ecx
	jmp back1
end:
	xor edx,edx
	mov ecx,eax
	mov eax,dword[nfact]
	div ecx
	
	pusha
	push eax
	push msg3
	call printf
	add esp,8
	popa
