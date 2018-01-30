section .data
	str1 db 'sagar ',0
	str2 db 'dahatonde',0
	msg1 db 'Your New Concat string :%s',10,0

section .bss
	str3 resb 20

section .text
	global main
	extern printf

main:
	mov esi,str1
	mov edi,str3
back1:   
	cmp byte[esi],0
	jz next
	mov al,byte[esi]
	mov byte[edi],al
	inc edi
	inc esi
	jmp back1
next:  
	mov esi,str2
back2: 
	cmp byte[esi],0
	jz end
	mov al,byte[esi]
	mov byte[edi],al
	inc edi
	inc esi
	jmp back2
end:
	mov byte[edi],0   
	push str3
	push msg1
	call printf
	add esp,8
	ret
