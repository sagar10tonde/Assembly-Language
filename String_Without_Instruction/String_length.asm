section .data
	string db "This is a String",10,0
	len equ $-string
	msg db "String Length=%d",10,0
		
section .text
	global main
	extern printf

main:
	xor ecx,ecx
	mov eax,string
abc:
	cmp byte[eax],0
	jz end
	inc ecx
	inc eax
	jmp abc

end:
	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa
	ret
