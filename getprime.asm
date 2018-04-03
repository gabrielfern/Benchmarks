%macro printVal 1
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    mov rax, %1
  %%printRAX:
    mov rcx, digitSpace
  ; mov rbx, 10
  ; mov [rcx], rbx
  ; inc rcx
    mov [digitSpacePos], rcx

  %%printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

    mov rcx, [digitSpacePos]
    mov [rcx], dl
    inc rcx
    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0
    jne %%printRAXLoop

  %%printRAXLoop2:
    mov rcx, [digitSpacePos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx

    cmp rcx, digitSpace
    jge %%printRAXLoop2

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax
%endmacro


section .text
global _start

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
    inc rcx
    jmp prime_loop
  prime_false:
    mov rax, 0
    ret
  prime_true:
    mov rax, 1
    ret

print:
    mov r8, rax
    call len
    mov rcx, rax
    mov rax, 1 ; sys_write
    mov rdi, 1
    mov rsi, r8
    mov rdx, rcx
    syscall
    mov rax, 1
    mov rsi, newline
    mov rdx, 1
    syscall
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

_start:
    ; mov rax, 23
    ; call prime
    ; printVal rax

    pop rax
    pop rax
    pop rax
    call atoi
    call prime
    printVal rax

    mov rax, 60 ; sys_exit
    mov rdi, 0
    syscall


section .data
    hello db "hello", 0
    newline db 10

section .bss
    buf resb 2
    line resb 80
    digitSpace resb 40
    digitSpacePos resb 1
