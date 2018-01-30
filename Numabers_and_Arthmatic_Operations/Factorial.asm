section .data
	num dd 20
	b   db 'abc'	
	msg db "%d",0
	msg1 db "%d Factorial is :%d",10,0


section .bss
	fact resd 1
	
section .text
	global main
	extern printf

main:
	mov esi,dword[num]
	inc esi
	mov edi,dword[fact]
	mov eax,1

	mov ecx,1
back:	cmp ecx,esi
	je end
	mul ecx


	inc ecx
	jmp back

end:
	pusha
	push eax
	push dword[num]
	push msg1
	call printf
	add esp,12
	popa
