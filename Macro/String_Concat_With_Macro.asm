%macro concat 4

	mov ecx,%3
	dec ecx

	mov esi,%1
	mov edi,str3
	rep movsb
     
	mov esi,%2
	mov ecx,%4
	dec ecx
	rep movsb
     
	mov byte[edi],0   
	push str3
	push msg1
	call printf
	add esp,8
	ret
	
%endmacro
	
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

	mov eax,str1
	mov ebx,str2
	mov ecx,len1
	mov edx,len2
	concat eax,ebx,ecx,edx
