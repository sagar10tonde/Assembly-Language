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
	sp1 db "#",0
	sp2 db "/",0
	sp3 db "^",0
	sp4 db "*",0
	sp5 db "@",0
	sp6 db "$",0
	nl  db 10,0
	spe db " ",0
	clr db "clear",0

section .text
	global main
	extern printf,system,sleep

main:
	pusha

	pusha
	push clr
	call system
	add esp,4
	popa
	
	
	pusha
	printchar nl,3
	popa

	pusha
	printchar spe,5
	popa

	pusha
	printchar sp2,1
	popa

	pusha
	printchar nl,1
	popa

	pusha
	printchar spe,4
	popa

	pusha
	printchar sp2,1
	popa

	pusha
	printchar nl,1
	popa

	pusha
	printchar spe,3
	popa

	pusha
	printchar sp5,2
	popa

	pusha
	printchar nl,1
	popa

	pusha
	printchar spe,2
	popa

	pusha
	printchar sp5,4
	popa


	pusha
	printchar nl,1
	popa

	pusha
	printchar spe,2
	popa

	pusha
	printchar sp5,4
	popa
	
	pusha
	printchar nl,1
	popa

	pusha
	push dword[two]
	call sleep
	add esp,4
	popa


	pusha
	push clr
	call system
	add esp,4
	popa

	pusha
	printchar nl,4
	popa


	
	pusha
	printchar spe,4
	popa
	pusha
	printchar sp4,1
	popa

	pusha
	printchar spe,2
	popa
	pusha
	printchar sp5,1
	popa

	pusha
	printchar spe,1
	popa
	pusha
	printchar sp3,1
	popa
	
	pusha		
	printchar nl,2
	popa
	
	pusha
	printchar spe,2
	popa
	pusha
	printchar sp5,1
	popa

	pusha
	printchar spe,4
	popa
	pusha
	printchar sp1,1
	popa

	pusha
	printchar spe,4
	popa
	pusha
	printchar sp6,1
	popa

	pusha		
	printchar nl,2
	popa
	
	pusha
	printchar spe,3
	popa
	pusha
	printchar sp3,1
	popa

	pusha
	printchar spe,3
	popa
	
	pusha
	printchar sp5,1
	popa

	pusha
	printchar spe,2
	popa
	pusha
	printchar sp6,1
	popa

	
	pusha
	push dword[two]
	call sleep
	add esp,4
	popa

	pusha		
	printchar nl,4
	popa
	

	popa
