; used nasm to assembler
; assemble it with
; nasm -f elf64 getprime.asm
; ld -o asmprime getprime.o
; on linux systems
global _start

section .text

prime:
    cmp rax, 2
    jl prime_false
    je prime_true
    mov rbx, rax
    mov rdx, 0
    mov rcx, 2
    div rcx
    cmp rdx, 0
    je prime_false
    mov r8, rax
    inc rcx
  prime_loop:
    cmp rcx, r8
    jge prime_true
    mov rdx, 0
    mov rax, rbx
    div rcx
    cmp rdx, 0
    je prime_false
    add rcx, 2
    jmp prime_loop
  prime_false:
    mov rax, 0
    ret
  prime_true:
    mov rax, 1
    ret

yieldprime:
    mov r9, rax
    mov r10, 1
    mov r11, 2
  yieldprime_loop:
    cmp r9, r10
    je yieldprime_end
    inc r11
    mov rax, r11
    call prime
    cmp rax, 1
    je yieldprime_inc_jmp
    jmp yieldprime_loop
  yieldprime_inc_jmp:
    inc r10
    jmp yieldprime_loop
  yieldprime_end:
    mov rax, r11
    ret

len:
    mov rcx, 0
  len_loop:
    mov bl, [rax+rcx]
    cmp bl, 0
    je len_end
    inc rcx
    jmp len_loop
  len_end:
    mov rax, rcx
    ret

atoi:
    mov r8, rax
    call len
    mov rcx, rax
    mov rsi, 0
    mov rax, 1
    mov rdi, 0
    mov r10, 10
    mov r11, 0
  atoi_loop:
    cmp rcx, 0
    je atoi_end
    dec rcx
    mov dil, [r8+rcx]
    sub dil, 48
    mov r11, rax
    mul rdi
    add rsi, rax
    mov rax, r11
    mul r10
    jmp atoi_loop
  atoi_end:
    mov rax, rsi
    ret

print_num:
    mov rbp, rsp
    push 10
    mov rbx, 10
    mov rcx, 1
  print_num_loop:
    inc rcx
    mov rdx, 0
    div rbx
    add rdx, 48
    push rdx
    cmp rax, 0
    jne print_num_loop
    mov rbx, 0
  print_num_end_loop:
    pop rax
    mov [num_str+rbx], al
    inc rbx
    cmp rbx, rcx
    jne print_num_end_loop
    mov rax, 1
    mov rdi, 1
    mov rsi, num_str
    mov rdx, rbx
    syscall
    mov rsp, rbp
    ret

_start:
    pop rax
    pop rax
    pop rax
    call atoi
    call yieldprime
    call print_num
    mov rax, 60
    mov rdi, 0
    syscall

section .bss
    num_str resb 21
