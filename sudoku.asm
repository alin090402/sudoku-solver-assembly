.data

    n: .long 9
    top: .long 0
    k: .long 0
    x: .long 0
    bun: .long 0
    gasit: .long 0
    val: .long 0
    poz: .long 0
    cifra: .long 0
    nrElemente: .long 81
    
    linii:      .long  0,  0,  0,  0,  0,  0,  0,  0,  0
                .long 10, 10, 10, 10, 10, 10, 10, 10, 10
                .long 20, 20, 20, 20, 20, 20, 20, 20, 20
                .long 30, 30, 30, 30, 30, 30, 30, 30, 30
                .long 40, 40, 40, 40, 40, 40, 40, 40, 40
                .long 50, 50, 50, 50, 50, 50, 50, 50, 50
                .long 60, 60, 60, 60, 60, 60, 60, 60, 60
                .long 70, 70, 70, 70, 70, 70, 70, 70, 70
                .long 80, 80, 80, 80, 80, 80, 80, 80, 80
    
    
    coloane:    .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
                .long 0, 10, 20, 30, 40, 50, 60, 70, 80
    
    
    
    casute: .long  0,  0,  0, 30, 30, 30, 60, 60, 60
            .long  0,  0,  0, 30, 30, 30, 60, 60, 60
            .long  0,  0,  0, 30, 30, 30, 60, 60, 60
            .long 10, 10, 10, 40, 40, 40, 70, 70, 70
            .long 10, 10, 10, 40, 40, 40, 70, 70, 70
            .long 10, 10, 10, 40, 40, 40, 70, 70, 70
            .long 20, 20, 20, 50, 50, 50, 80, 80, 80
            .long 20, 20, 20, 50, 50, 50, 80, 80, 80
            .long 20, 20, 20, 50, 50, 50, 80, 80, 80
            
    vazutLinii: .space 1000
    vazutColoane: .space 1000
    vazutCasute: .space 1000
    
    readSet: .asciz "r"
    writeSet: .asciz "w"
    inputName: .asciz "input.in"
    outputName: .asciz "output.out"
    inputFile: .space 20
    outputFile: .space 20
    
    
    
    v: .space 400
    sol: .space 400
    ramase: .space 400
    formatCitireIntreg: .asciz "%d"
    formatAfisareIntreg: .asciz "%d "    
    formatAfisareString: .asciz "%s"    
    NewLine: .asciz "\n"    


.text



InitFiles:
    pushl %ebp
    mov %esp, %ebp
    
    push %esi
    push %edi
    push %ebx
        
        #    FILE* inputfile = fopen(inputname, "r");

        push $readSet
        push $inputName
        call fopen
        pop %ebx
        pop %ebx
    
        mov %eax, inputFile
        
        
        
        
        
        
        push $writeSet
        push $outputName
        call fopen
        pop %ebx
        pop %ebx
        
        mov %eax, outputFile
        
        
        
        
        
        
    pop %ebx
    pop %edi
    pop %esi
    
    pop %ebp

ret



Verificare:   # ia ca paramentri o pozitie si o valoare.  Returneaza 1 daca valoarea poate fi pusa pe pozitia data, 0 daca nu
    pushl %ebp
    mov %esp, %ebp
    
    push %esi
    push %edi
    push %ebx
    
    
    

    
        movl 8(%ebp), %eax
        mov %eax, k
        movl 12(%ebp), %eax
        mov %eax, x
      

  
        
        lea ramase, %esi
        cmpl $0, (%esi, %eax, 4)
        jne et_MaiSunt
            mov $0, %eax
            
            pop %ebx
            pop %edi
            pop %esi
            
            pop %ebp
            ret
        
        
        et_MaiSunt:
        movl $0 , bun
    
        #if(vazutLinii[linii[k] + x])
        #    Bun = false;
        #if(vazutColoane[coloane[k] + x])
        #    Bun = false;
        #if(vazutCasute[casute[k] + x])
        #    Bun = false;
        
        lea linii, %edi
        mov x, %eax
        mov k, %ecx
        add (%edi, %ecx, 4), %eax
        lea vazutLinii, %edi
        mov (%edi, %eax, 4), %ebx
        cmp $1, %ebx
        je et_NuEBun
        
        lea coloane, %edi
        mov x, %eax
        mov k, %ecx
        add (%edi, %ecx, 4), %eax
        lea vazutColoane, %edi
        mov (%edi, %eax, 4), %ebx
        cmp $1, %ebx
        je et_NuEBun
        
        lea casute, %edi
        mov x, %eax
        mov k, %ecx
        add (%edi, %ecx, 4), %eax
        lea vazutCasute, %edi
        mov (%edi, %eax, 4), %ebx
        cmp $1, %ebx
        je et_NuEBun
        
        movl $1, bun
    
        et_NuEBun:
        mov bun, %eax
        
    pop %ebx
    pop %edi
    pop %esi
    
    pop %ebp

ret

ModificareVazut:    #ia ca parametri cifra, poz, val
pushl %ebp
mov %esp, %ebp

push %esi
push %edi
push %ebx


    
    movl 8(%ebp), %eax
    mov %eax, cifra
    movl 12(%ebp), %eax
    mov %eax, poz
    movl 16(%ebp), %eax
    mov %eax, val
    
     #vazutLinii[linii[poz] + cifra] = val;
     #vazutColoane[coloane[poz] + cifra] = val;
     #vazutCasute[casute[poz] + cifra] = val;
     
     lea linii, %edi
     mov cifra, %eax
     mov poz, %ecx
     add (%edi, %ecx, 4), %eax
     lea vazutLinii, %edi
     mov val, %ebx
     mov %ebx, (%edi, %eax, 4)
     
     lea coloane, %edi
     mov cifra, %eax
     mov poz, %ecx
     add (%edi, %ecx, 4), %eax
     lea vazutColoane, %edi
     mov val, %ebx
     mov %ebx, (%edi, %eax, 4)
     
     lea casute, %edi
     mov cifra, %eax
     mov poz, %ecx
     add (%edi, %ecx, 4), %eax
     lea vazutCasute, %edi
     mov val, %ebx
     mov %ebx, (%edi, %eax, 4)
     
     
    


pop %ebx
pop %edi
pop %esi

pop %ebp

ret




CitireInitializare:

pushl %ebp
mov %esp, %ebp
push %ebx
push %edi
push %esi
    
    
     # formare vector ramase    ramase[i] numarul de elemente i ce pot fi adaugate       
    xor %ecx, %ecx
    lea ramase, %edi
    et_StartForRamase:
        cmp n, %ecx
        je et_EndForRamase
            movl $9, 4(%edi, %ecx, 4)
          
        inc %ecx
        jmp et_StartForRamase
    et_EndForRamase:
    
    xor %ecx, %ecx
    et_StartForInitVazut:
        cmp $81, %ecx
        je et_EndForInitVazut
            
            lea vazutLinii, %edi
            movl $0, (%edi, %ecx, 4)
            
            lea vazutColoane, %edi
            movl $0, (%edi, %ecx, 4)
            
            lea vazutCasute, %edi
            movl $0, (%edi, %ecx, 4)
          
        inc %ecx
        jmp et_StartForInitVazut
    et_EndForInitVazut:
    
    
    # for(int i = 0; i < 3 * n; i++)
    
     
    xor %ecx, %ecx
    lea v, %edi
    et_StartForCitire:
        cmp nrElemente, %ecx
        je et_EndForCitire
            #citim elementul vectorului de pe poz %ecx
            
            lea (%edi, %ecx, 4), %edx
            
                push %ecx
                
                
                push %edx
                push $formatCitireIntreg
                push inputFile
                call fscanf
                pop %ebx
                pop %ebx
                pop %ebx
                
                
                pop %ecx
            
            mov (%edi, %ecx, 4), %ebx
            
            lea sol, %esi
            mov %ebx, (%esi, %ecx, 4)
            
            
            
            
        inc %ecx
        jmp et_StartForCitire
    et_EndForCitire:

pop %esi
pop %edi
pop %ebx
pop %ebp


ret








Afisare:
pushl %ebp
mov %esp, %ebp
push %ebx
push %edi
push %esi

    xor %ecx, %ecx
    lea sol, %esi
    et_StartForAfisare:
        cmp nrElemente, %ecx
        je et_EndForAfisare
            
            push %ecx
                
                
                push (%esi, %ecx, 4)
                push $formatAfisareIntreg
                push outputFile
                call fprintf
                pop %ebx
                pop %ebx
                pop %ebx
                
            pop %ecx
            
            
            
        inc %ecx
        jmp et_StartForAfisare
           
    et_EndForAfisare:



push $0
call fflush
pop %ebx

pop %esi
pop %edi
pop %ebx
pop %ebp

ret

VerificareInput:


pushl %ebp
mov %esp, %ebp
push %ebx
push %edi
push %esi

    
    # for(int i = 0; i < 3 * n; i++)
    xor %ecx, %ecx
    lea v, %edi
    lea ramase, %esi
    et_StartForVerificareInput:
        cmp nrElemente, %ecx
        je et_EndForVerificareInput
            #if(v[i] != 0 && !Verificare(i, v[i]))   <--->  v[i] = 0 sari  + Verificare(i, v[i]) sari
           
            mov (%edi, %ecx, 4), %edx
            cmp $0, %edx
            je et_ValoareCorecta
            
                push %ecx
                
                push %edx
                push %ecx
                call Verificare
                pop %ebx
                pop %ebx
                
                pop %ecx
                
            
            cmp $1 ,%eax
            je et_ValoareCorecta
            # iesim si mergem la et_Imposibil
            
            pop %esi
            pop %edi
            pop %ebx
            pop %ebp
            pop %ebx
            jmp et_Imposibil
              
    
              
            et_ValoareCorecta:
            #ramase[v[i]]--;
            mov (%edi, %ecx, 4), %edx
            sub $1, (%esi, %edx, 4)
            
            #marcam cu 1 pozitiile corespunzatoare din matrici
            push %ecx
            
            push $1
            push %ecx
            push %edx
            
            call ModificareVazut
            
            pop %ebx
            pop %ebx
            pop %ebx
            
            pop %ecx
         
        
        inc %ecx
        jmp et_StartForVerificareInput
    et_EndForVerificareInput:
    
pop %esi
pop %edi
pop %ebx
pop %ebp

ret








Back:
pushl %ebp
mov %esp, %ebp

push %esi
push %edi
push %ebx


    movl 8(%ebp), %eax
    mov %eax, top
    
    
    cmpl $1, gasit #daca am afisat deja solutia
        je et_ReturnBack
    
    cmpl nrElemente, %eax #daca am ajuns la final afisam solutia
        jne et_CorpBack
        call Afisare
        movl $1, gasit
        jmp et_ReturnBack
        
    et_CorpBack:
    
    lea v, %esi
    mov top, %edx
    cmp $0, (%esi, %edx, 4)
    je et_AdaugareElement
    #trecem la pasul urmator si apoi returnam
        push top
        push %ecx
            
        incl top
        push top
        call Back
        pop %ebx
            
        pop %ecx
        pop top
    
    jmp et_ReturnBack
    
    et_AdaugareElement:
    
    mov $1, %ecx
    
    et_StartForBack:
    cmp n, %ecx
    jg et_EndForBack
        
        push %ecx
        
        push %ecx
        push top
        call Verificare
        pop %ebx
        pop %ebx
        
        pop %ecx
        
        cmp $1, %eax
        jne et_NuSePoateAdauga
            lea sol, %esi
            lea ramase, %edi
            mov top, %edx
            mov %ecx, (%esi, %edx, 4) #       sol[top] = i;
            decl (%edi, %ecx, 4) #       ramase[i]--;
            
                push %eax
                push %ecx
                push %edx
            
                push $1
                push top
                push %ecx            
                
                call ModificareVazut
                
                pop %eax
                pop %eax
                pop %eax
                
                pop %edx
                pop %ecx
                pop %eax
            
            
            
                    pushl top
                    push %ecx
                    push %edx
                    
                    incl top
                    push top
                    call Back
                    pop %ebx
                    
                    pop %edx
                    pop %ecx
                    popl top

                push %eax
                push %ecx
                push %edx

                push $0
                push top
                push %ecx            
                
                call ModificareVazut
                
                pop %eax
                pop %eax
                pop %eax
                
                pop %edx
                pop %ecx
                pop %eax
            
            incl (%edi, %ecx, 4) #       ramase[i]++;
            movl $0, (%esi, %edx, 4) #       sol[top] = 0;
            
        
        et_NuSePoateAdauga:
    inc %ecx
    jmp et_StartForBack
    et_EndForBack:
    
    
    
et_ReturnBack:
pop %ebx
pop %edi
pop %esi

pop %ebp
   
ret


.global main

main:
    movl %esp, %ebp #for correct debugging
    call InitFiles
    call CitireInitializare
    call VerificareInput
    
    
    push $0
    call Back
    pop %ebx
    
    
    cmp $0, gasit
    je et_Imposibil
    jmp et_exit
et_Imposibil:

push $-1
push $formatAfisareIntreg
call printf
pop %ebx
pop %ebx
jmp et_exit


et_exit:
    
    push $NewLine
    push $formatAfisareString
    call printf
    pop %ebx
    pop %ebx
    
    push outputFile
    call fflush
    pop %ebx
    
    push inputFile
    call fclose
    pop %ebx
    
    push outputFile
    call fclose
    pop %ebx
    
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
     
    