%macro substring 4

	mov edi,%1
	mov ecx,%3
	dec ecx

%%back:
 	mov al,byte[%2]
	repnz scasb
	cmp ecx,0
	jz %%back3
	dec edi
	inc ecx
	push ecx
	mov esi,%2
	mov ecx,%4
	repz cmpsb
	jz %%back2
	dec edi
	inc ecx
	mov eax,%4
	sub eax,ecx
	pop ecx
	sub ecx,eax
	cmp ecx,%4
	jl %%back3
	jmp %%back  

%%back2:
	pop ecx
	push msg1
	call puts
	add esp,4
	jmp %%end
 
%%back3:
	push msg2
	call puts
	add esp,4

%%end :
	ret
  
%endmacro

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
	mov eax,str1
	mov ebx,str2
	mov ecx,len1
	mov edx,len2
	substring eax,ebx,ecx,edx
