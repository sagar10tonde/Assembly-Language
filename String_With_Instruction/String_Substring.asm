section .data
	msg1 db 'It Is Substring',0
	msg2 db 'It Is Not Substring',0
	str1 db 'sagar dahatonde',0
	len1 equ $-str1
	str2 db 'sagar'
	len2 equ $-str2
	
	

section .text
	global main
	extern puts,printf

main: 
	mov edi,str1
	mov ecx,len1
	dec ecx

back: 	mov al,byte[str2]
	repnz scasb
	cmp ecx,0
	jz back3
	dec edi
	inc ecx
	push ecx
	mov esi,str2
	mov ecx,len2
	repz cmpsb
	jz back2
	dec edi
	inc ecx
	mov eax,len2
	sub eax,ecx
	pop ecx
	sub ecx,eax
	cmp ecx,len2
	jl back3
	jmp back  

back2:
	pop ecx
	push msg1
	call puts
	add esp,4
	jmp end
 
back3:	push msg2
	call puts
	add esp,4

end : ret
  
