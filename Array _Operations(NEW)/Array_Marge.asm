section .data
	msg db "%d",0
	msg1 db "Enter How many Element YTou Want:",0
	msg2 db "Enetr ELement:",10,0
	msg3 db "Your Array is:",0
	msg4 db "Marge Array is:",9,0
	msg5 db "Enter How many Element YTou Want second Array:",0
	msg6 db "Your First Array is:",0
	msg7 db "Your Second Array is:",0
	sp1 db 9,0
	sp2 db 10,0

section .bss
	arr1 resd 50
	arr2 resd 50
	arr3 resd 100
	n resd 1
	m resd 1

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
	mov ebx,arr1

back:	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa

	add ebx,4
	loop back
	

	pusha
	push msg5
	call printf
	add esp,4
	popa

	pusha
	push m
	push msg
	call scanf
	add esp,8
	popa

	pusha
	push msg2
	call printf
	add esp,4
	popa

	mov ecx,dword[m]
	mov edx,arr2

back1:	pusha
	push edx
	push msg
	call scanf
	add esp,8
	popa

	add edx,4
	loop back1


	pusha
	push msg6
	call printf	
	add esp,4
	popa

	mov ecx,dword[n]
	mov ebx,arr1

back2:	pusha
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
	loop back2
	
	pusha
	push sp2
	call printf
	add esp,4
	popa

	pusha
	push msg7
	call printf	
	add esp,4
	popa

	mov ecx,dword[m]
	mov edx,arr2

back3:	pusha
	push dword[edx]
	push msg
	call printf
	add esp,8
	popa
	
	pusha
	push sp1
	call printf
	add esp,4
	popa

	add edx,4
	loop back3


	mov eax,dword[n]
	mov ebx,dword[m]
	mov edx,arr1
	mov ecx,arr2

back4:	cmp eax,0
	je next
	add edx,4
	dec eax
	jmp back4

next:	
back5:	cmp ebx,0
	je end
	mov edi,dword[ecx]
	mov dword[edx],edi
	add edx,4
	add ecx,4
	dec ebx
	jmp back5

end:	


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
	mov eax,dword[n]
	mov ebx,dword[m]
	add eax,ebx
	mov ecx,eax
	mov ebx,arr1

print:	pusha
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
	loop print
	popa

	pusha
	push sp1
	call printf
	add esp,4
	popa
