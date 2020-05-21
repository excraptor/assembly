.intel_syntax noprefix
.text
.global vigenere_encrypt
vigenere_encrypt:
    push ebp						//fuggveny prologus
    mov ebp, esp
    push esi						//cdecl
    push ebx						//cdecl
    xor ecx, ecx					//ecx nullazasa
    mov esi, [ebp+16] 				//output
    mov ebx, [ebp+12] 				//key
    mov edx, [ebp+8] 				//input


    iterate:
        
    	cmp byte ptr [edx+ecx], 0 	//input[i] == 0
        je kilep					//jump if equal
        mov al, 0					//hely az eltolt karakternek
        add al, byte ptr [ebx+ecx] 	//al += key[ecx]
        add al, byte ptr [edx+ecx] 	//al += input[ecx]
        sub al, 162					//mert 97 (a) + 65 (A), igy megkapjuk hanyadik betu 
        cmp al, 25					//ha tulmegy z-n, kivonunk 26-ot belole, a modulo tul bonyi volt
        jle nemkellkivonni
            sub al, 26
        nemkellkivonni:
        add al, 97					//kisbetus ascii karaktert csinalunk belole
      	mov byte ptr [esi+ecx], al  //output[ecx] = al
        inc ecx						
        jmp iterate		

    kilep:
    mov eax, 0						
    mov byte ptr [esi+ecx], 0		//terminalo karakter a vegere
    pop ebx							//cdecl
    pop esi							//cdecl
    mov esp, ebp					//fuggveny epilogus
    pop ebp
    ret 
