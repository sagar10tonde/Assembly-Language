%macro max 2
	mov edi,%2
	
	mov ecx,edi
	mov ebx,%1

%%back1:	pusha
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
	loop %%back1

	
	pusha
	push sp2
	call printf
	add esp,4
	popa

	mov ecx,edi
	mov ebx,arr
	mov eax,dword[min]
	mov eax,dword[ebx]
	xor edx,edx

%%back3:
	cmp edx,edi
	je %%end
	cmp eax,dword[ebx]
	jle %%lesss
	add ebx,4
	inc edx
	jmp %%back3
	
%%lesss:
	mov eax,dword[ebx]
	add ebx,4
	inc edx
	jmp %%back3
	
%%end:
	pusha
	push eax
	push msg4
	call printf
	add esp,4
	popa
	
	
	pusha
	push sp2
	call printf
	add esp,8
	popa
	
%endmacro

section .data
	msg db "%d",0
	msg1 db "Enter Hoe Many Elements You Wants:",0
	msg2 db "Enter Elements:",10,0
	msg3 db "YOur Elements is:",9,0
	msg4 db "Max of the Array :%d",0
	sp1 db 9,0
	sp2 db 10,0


section .bss
	min resd 1
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


	mov eax,arr
	mov ebx,dword[n]
	max eax,ebx
