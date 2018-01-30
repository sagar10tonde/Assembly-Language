section .data
	msg1 db 'It is a Palimdrom',0
	msg2 db 'It Is not Palimdrom String',0
	str2 db 'nitin',0


section .text
	global main
	extern puts

main :
	xor ecx,ecx
	mov edi,str2
back1:    
	cmp byte[edi],0
	jz back2
	inc ecx
	inc edi
	jmp back1
back2:
	dec edi
	mov esi,str2
back3:   
	mov al,byte[esi]
	cmp al,byte[edi]
	jnz next
	inc esi
	dec edi
	dec ecx
	cmp ecx,0
	jz print
	jmp back3
print:
	push msg1
	call puts
	add esp,4
	jmp end

next:
	push msg2
	call puts
	add esp,4
end:  	ret
