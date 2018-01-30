%macro printchar 2
       mov ecx,%2
%%abc:   
       push ecx
       mov eax,4
       mov ebx,1
       mov ecx,%1
       mov edx,1
       int 80h
       pop ecx
       loop %%abc

%endmacro


section .data
	one dd 1
	two dd 2
	stp0 db "@",0
	stp1 db "#",0
	stp2 db "$",0
	stp3 db "*",0
	stp4 db "^",0
	sp1 db "|",0
	sp2 db "-",0
	spe db " ",0
	nline db 10,0
	clr db "clear",0

section .text
	global main
	extern printf,system,sleep

main:
	pusha
	mov ecx,10
	mov eax,10
back:	

	pusha
	push clr
	call system
	add esp,4
	popa

	pusha
	printchar nline,4
	popa

	pusha
	printchar spe,5
	popa

	
	pusha
	printchar sp1,eax
	popa
	pusha
	printchar nline,1
	popa
	pusha
	printchar spe,5
	popa
	pusha
	printchar sp2,eax
	popa
	pusha
	printchar nline,1
	popa
	pusha
	printchar spe,5
	popa
	pusha
	printchar sp1,eax
	popa
	
	pusha
	push dword[one]
	call sleep
	add esp,4
	popa
	
	dec ecx
	dec eax
	cmp ecx,0
	je end
	jmp back
end:	

	pusha
	push clr
	call system
	add esp,4
	popa

	pusha
	printchar nline,4
	popa

	
	pusha
	printchar spe,4
	popa
	pusha
	printchar stp1,1
	popa

	pusha
	printchar spe,2
	popa
	pusha
	printchar stp0,1
	popa

	pusha
	printchar spe,1
	popa
	pusha
	printchar stp1,1
	popa
	
	pusha		
	printchar nline,2
	popa
	
	pusha
	printchar spe,2
	popa
	pusha
	printchar stp2,1
	popa

	pusha
	printchar spe,4
	popa
	pusha
	printchar stp3,1
	popa

	pusha
	printchar spe,4
	popa
	pusha
	printchar stp4,1
	popa

	pusha		
	printchar nline,2
	popa
	
	pusha
	printchar spe,3
	popa
	pusha
	printchar stp0,1
	popa

	pusha
	printchar spe,3
	popa
	pusha
	printchar stp4,1
	popa

	pusha
	printchar spe,2
	popa
	pusha
	printchar stp2,1
	popa

	
	pusha
	push dword[two]
	call sleep
	add esp,4
	popa

	pusha		
	printchar nline,4
	popa
	
	
	popa
