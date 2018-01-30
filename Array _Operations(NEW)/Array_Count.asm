section .data
	arr dd 10,20,30,40,50,-1
	msg db "%d",0
	msg1 db "Your Array is:",9,0
	msg2 db "Count of Array :%d",10,0
	sp1 db 10,0
	sp2 db 9

section .text
	global main
	extern printf

main:

	pusha
	push msg1
	call printf
	add esp,4
	popa

	xor eax,eax
	mov ebx,arr

back:	cmp dword[ebx],-1
	je end
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa
	pusha
	push sp2
	call printf
	add esp,4
	popa
	inc eax
	add ebx,4
	jmp back

end:
	
	pusha
	push sp1
	call printf
	add esp,4
	popa


	pusha
	push eax
	push msg2
	call printf
	add esp,8
	popa
