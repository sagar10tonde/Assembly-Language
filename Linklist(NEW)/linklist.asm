%macro printlist 2
	;; Print the Link list
	pusha
	
	pusha
	push msg8
	call printf
	add esp,4
	popa
	
	mov eax,%1
	xor ecx,ecx
%%abc:	cmp ecx,dword[count]
	jz %%end
	
	pusha
	
	pusha
	push sd1
	call printf
	add esp,4
	popa
	
	push dword[eax]
	push msg
	call printf
	add esp,8
	
	pusha
	push sd2
	call printf
	add esp,4
	popa
	
	pusha
	push spe
	call printf
	add esp,4
	popa
	
	popa
	
	add eax,4
	inc ecx
	jmp %%abc
	
%%end:	pusha
	push nline
	call printf
	add esp,4
	popa

	pusha
	push nline
	call printf
	add esp,4
	popa
	
	popa
	
%endmacro
	
	
section .data
	msg0 db "Link List Operations List",10
	msg1 db "1-Create Link List",10
	msg2 db "2-Add Start Node Link List",10
	msg3 db "3-Add End Node Link list",10
	msg4 db "4-Delete Start Node Link List",10
	msg5 db "5-Delete End Node link list",10
	msg6 db "6-Display Link List",10
	msg7 db "7-Exit",10,0
	msg8 db "Your Link List is=",10,0
	msg9 db "How many Node You Want=",0
	msg10 db "Enter nodes:",10,0
	msg11 db "Link list is EMPTY",10,0
	msg12 db "Enter Valid Number 1 to 7 Only",10,0
	msgn db "Enetr Choice =",0
	msgs db "1-Create, 2-Add Start, 3-Add last, 4-Delete Start, 5-Delete last, 6-Display, 7-Exit",10,0
	msg db "%d",0
	sd1 db "[",0
	sd2 db "]",0
	spe db 9,0
	nline db 10,0

section .bss
	list resd 50
	list2 resd 50
	list3 resd 50
	count resd 1
	cho resd 1
	n resd 1
	m resd 1

section .text
	global main
	extern printf,scanf

main:

backm:	;; Display Opretion 
	pusha
	push nline
	call printf
	add esp,4
	popa

	pusha
	push msg0
	call printf
	add esp,4
	popa

	pusha
	push nline
	call printf
	add esp,4
	popa

	;; Enter Choice
	pusha
	push msgn
	call printf
	add esp,4
	popa
	
	pusha
	push cho
	push msg
	call scanf
	add esp,8
	popa

	jmp next1


backs:	;; Display Operstions
	pusha
	push nline
	call printf
	add esp,4
	popa

	pusha
	push msgs
	call printf
	add esp,4
	popa

	pusha
	push nline
	call printf
	add esp,4
	popa

	;; Enter Choice
	pusha
	push msgn
	call printf
	add esp,4
	popa

	pusha
	push cho
	push msg
	call scanf
	add esp,8
	popa

	jmp next1


back:	;; manege list
	pusha
	xor ecx,ecx
	mov eax,list
	mov ebx,list2
	mov edx,list3

backsp:	cmp ecx,dword[count]
	je endsp
	mov edi,dword[ebx]
	mov dword[eax],edi
	mov dword[edx],edi
	add eax,4
	add ebx,4
	add edx,4
	inc ecx
	jmp backsp
endsp:
	jmp backs


	

next1:	;; check case
	pusha
	mov eax,dword[cho]
	
	cmp eax,1
	je case1

	cmp eax,2
	je case2

	cmp eax,3
	je case3

	cmp eax,4
	je case4

	cmp eax,5
	je case5

	cmp eax,6
	je case6

	cmp eax,7
	je case7
	jmp def

	popa


case1:	;; Enter Number of node 
	pusha
	push msg9
	call printf
	add esp,4
	popa

	;; Acept Number of node
	pusha
	push count
	push msg
	call scanf
	add esp,8
	popa

	;; Acept Node Values
	pusha
	
	xor ebx,ebx
	xor ecx,ecx

	mov ecx,dword[count]
	mov ebx,list

	pusha
	push msg10
	call printf
	add esp,4
	popa

back1	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	add ebx,4
	loop back1

	pusha
	push nline
	call printf
	add esp,4
	popa

	;; Display link list
	pusha
	printlist list,count
	popa

	popa
	jmp backs

	
case2:
	pusha

	;; if check head NULL or NOT
	;; if it NULL then create link list therwise add start node
	cmp dword[count],0
	je case1

	;; Acept new node value
	pusha
	push msg10
	call printf
	add esp,4
	popa

	pusha
	push n
	push msg
	call scanf
	add esp,8
	popa

	;; Add number start link list
	pusha
	xor ecx,ecx
	mov ebx,list2
	mov edx,list
	mov eax,dword[n]
	mov dword[ebx],eax
	add ebx,4

	pusha
back2:	cmp ecx,dword[count]
	je end2
	mov edi,dword[edx]
	mov dword[ebx],edi
	add ebx,4
	add edx,4
	inc ecx
	jmp back2
end2:
	popa
	inc dword[count]

	;; Display link list
	popa
	printlist list2,count
	popa
	jmp back

case3:
	pusha

	;; if check head NULL or NOT
	;; if it NULL then create link list therwise add end node
	cmp dword[count],0
	je case1

	;; Acept new node value
	pusha
	push msg10
	call printf
	add esp,4
	popa

	pusha
	push m
	push msg
	call scanf
	add esp,8
	popa


	;; Add number last link list
	pusha
	mov ebx,list2
	xor ecx,ecx
back3:	cmp ecx,dword[count]
	je end3
	add ebx,4
	inc ecx
	jmp back3

end3:
	mov eax,dword[m]
	mov dword[ebx],eax
	add ebx,4
	popa
	inc dword[count]
	
	;; Display link list
	pusha
	printlist list2,count
	popa
	
	popa

	jmp back

case4:

	;;check link list is EMPTY or Not
	;;if empty the back othrwise delete start element
	pusha
	xor ecx,ecx
	cmp dword[count],0
	je end4
	mov ebx,list
	mov edx,list2
	mov edi,dword[ebx]
	add ebx,4
	dec dword[count]
back4:	cmp ecx,dword[count]
	je end5
	mov esi,dword[ebx]
	mov dword[edx],esi
	inc ecx
	add ebx,4
	add edx,4
	jmp back4
	
end4:
	pusha
	push msg11
	call printf
	add esp,4
	popa
	
	jmp back

end5:
	;; Display link list
	pusha
	printlist list2,count
	popa
	popa
	jmp back
	

case5:
	;;check link list is EMPTY or Not
	;;if empty the back othrwise delete end element
	pusha
	xor ecx,ecx
	cmp dword[count],0
	je end4
	dec dword[count]
	mov edx,list
	mov ebx,list2
back6:	cmp ecx,dword[count]
	je end6
	mov edi,dword[ebx]
	mov dword[edx],edi
	add edx,4
	add ebx,4
	inc ecx
	jmp back6
	
end6:
	;; Display link list
	pusha
	printlist list2,count
	popa

	popa
	jmp back

case6:
	;; check link list empt or not
	;; if is empty then msg is empty otherwise print link list
	pusha
	cmp dword[count],0
	je end4
	pusha
	printlist list,count
	popa
	jmp back
	
case7:
	;; Exit the program
	pusha
	mov eax,1
	int 80h
	popa

def:
	;; valis entries msg
	pusha
	push msg12
	call printf
	add esp,4
	popa
	jmp back
