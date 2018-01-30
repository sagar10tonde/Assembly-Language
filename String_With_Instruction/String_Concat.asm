section .data
	str1 db 'sagar ',0
	len1 equ $-str1
	str2 db 'dahatonde',0
	len2 equ $-str2
	msg1 db 'New Concat string is:%s',10,0

section .bss
	str3 resb 20

section .text
	global main
	extern printf

main:
	mov ecx,len1
	dec ecx

	mov esi,str1
	mov edi,str3
	rep movsb
     
	mov esi,str2
	mov ecx,len2
	dec ecx
	rep movsb
     
	mov byte[edi],0   
	push str3
	push msg1
	call printf
	add esp,8
	ret
