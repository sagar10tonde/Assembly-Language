section .data
	msg db "%d",0
	msg1 db "Enter Hoe Many Elements You Wants:",0
	msg2 db "Enter Elements:",10,0
	msg3 db "YOur Elements is:",9,0
	msg4 db "Enert Search Key:",0
	msg5 db "%d Number is NOT Found",0
	msg6 db "%d Number is Found",0
	sp1 db 9,0
	sp2 db 10,0


section .bss
	key resd 1
	arr resd 50
	n resd 1

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

	mov ecx,dword[n]
	mov ebx,arr

back:	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa

	add ebx,4
	loop back

	pusha
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push msg3
	call printf
	add esp,4
	popa


	mov ecx,dword[n]
	mov ebx,arr

back1:	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa
	pusha
	push sp1
	call printf
	add esp,4
	popa
	add ebx,4
	loop back1

	
	pusha
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push msg4
	call printf
	add esp,4
	popa

	pusha
	push key
	push msg
	call scanf
	add esp,8
	popa

	mov ebx,arr
	mov ecx,dword[n]
	mov eax,dword[key]

abc:	cmp ecx,0
	je end
	
	cmp eax,dword[ebx]
	je print

	add ebx,4
	dec ecx
	jmp abc

print:
	pusha
	push eax
	push msg6
	call printf
	add esp,8
	popa
	jmp last


end:
	pusha
	push eax
	push msg5
	call printf
	add esp,8
	popa
	jmp last

last:
	pusha
	push sp2
	call printf
	add esp,4
	popa

	
