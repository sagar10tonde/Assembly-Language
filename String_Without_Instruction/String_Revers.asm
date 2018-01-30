section .data
	str1 db 'sagar dahtonde',0

section .bss
	str2 resb 100

section .text
	global main	
	extern puts

main :
	xor ecx,ecx
	mov edi,str2
	mov esi,str1
back: 
	cmp byte[esi],0
	jz next
	inc ecx
	inc esi
	jmp back
next:
	cmp ecx,0
	jz next1
	dec esi
	mov al,byte[esi]
	mov byte[edi],al
	inc edi
	dec ecx    
	jmp next 
next1:     
	push str2
	call puts
	add esp,4
