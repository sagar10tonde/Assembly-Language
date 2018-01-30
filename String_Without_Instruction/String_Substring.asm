section .data
	str1 db 'sagar dahatonde',0
	str2 db 'daha',0
	msg1 db 'It Is SubString',0
	msg2 db 'It Is Not SubString',0

section .text
	global main
	extern puts

main:
	mov edi,str1
	mov al,byte[str2]
    
back:
	cmp byte[edi],al
	jz back2
	inc edi
	cmp byte[edi],0
	jz end
	jmp back
back2:
	mov esi,str2
back3: 	inc esi
	inc edi
	cmp byte[esi],0
	jz print
	mov al,byte[esi]
	cmp byte[edi],al
	jz back3
	mov al,byte[str2]
	jmp back

print :
	push msg1
	call puts
	add esp,4
	ret
end: 
	push msg2
	call puts
	add esp,4
	ret 
