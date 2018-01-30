section .data
	str1 db "Sagar Dahatonde",10,0
	len equ $-str1

section .bss
	str2 resb 50

section .tetx
	global main
	extern puts
main:
	mov ebx,str1
	mov edx,str2
	mov ecx,len

abc:	mov al,byte[ebx]
	mov byte[edx],al
	inc ebx
	inc edx
	dec ecx
	cmp ecx,0
	jnz abc

	push str2
	call puts
	add esp,4
	ret
