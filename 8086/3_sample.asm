section .text
    global _start

_start:
    xor rax, rax            ; Clear accumulator (sum)
    xor rbx, rbx            ; Clear index (counter)

loop_start:
    cmp rbx, rcx            ; Check if index < n
    je loop_end             ; If index == n, exit loop

    mov rdx, [rsi + rbx*8] ; Load next number into rdx (assuming 64-bit integers)
    add rax, rdx            ; Add to accumulator
    inc rbx                 ; Increment index
    jmp loop_start

loop_end:
    ; At this point, the sum is stored in rax

    ; Your further processing or output logic can go here

    ; Exit the program
    mov rax, 60             ; Syscall number for exit
    xor rdi, rdi            ; Exit code 0
    syscall
