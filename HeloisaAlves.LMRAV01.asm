;nasm -f elf64 HeloisaAlves.LMRAV01.asm
;ld HeloisaAlves.LMRAV01.o -o HeloisaAlves.LMRAV01.x
;gdb -q HeloisaAlves.LMRAV01.x

section .data
    entrada : db "-1000000", 0

section .bss
    resultado : resq 1
    isCastValid : resb 1

section .text
    global _start:

_start:
    ;coloca -1 para indicar número negativo
    mov rcx, -1
    lea esi, [entrada]
    cmp byte [rsi], '-' ;vê se tem o sinal
    jne positivo
    inc rsi

negativo:
    cmp byte [rsi], 0 ;vê se é o final da string
    je cast
    movzx ebx, byte [rsi] ;converte para int
    sub ebx, '0'
    imul rax, 10 
    sub rax, rbx ;subtrai o valor do caractere atual
    inc rsi
    jmp negativo

positivo:
    cmp byte [rsi], 0 ;vê se é o final da string
    je cast
    movzx ebx, byte [rsi] 
    sub ebx, '0' ;converte para int
    imul rax, 10 
    add rax, rbx
    inc rsi
    jmp positivo

cast:
    ;salvando a conversao
    mov qword [resultado], rax
    xor rax, rax

    ; verifica se há estouro no registrador
    mov rax, 9223372036854775807
    cmp rax, rbx
    jg invalido

    mov rax, -9223372036854775808
    cmp rax, rbx
    jl invalido

valido:
    mov byte [isCastValid], 1
    jmp fim

invalido:
    mov byte [isCastValid], 0

fim:
    mov rax, 60
    mov rdi, 0
    syscall