section .data
    format db "num: %d: %d.%d", 10, 0   ; Format string for printf
    start_num dd 85                      ; Initial value for start_num
    n dd 10                              ; Number of iterations
    zero dd 0                            ; Zero for comparison
    hundred dd 100                       ; Constant 100
    ten dd 10                            ; Constant 10

section .text
    extern printf
    global main
    
main:
    mov eax, [start_num]       ; Load start_num into eax
    mov ebx, [n]                ; Load n into ebx
    mov ecx, 1                  ; Initialize ecx for loop counter
    
for_loop:
    cmp ecx, ebx                ; Compare loop counter with n
    jnle end_loop               ; Jump to end_loop if ecx is not less than or equal to n
    
    ; Calculate w
    mov edx, eax               ; Move start_num into edx
    imul edx, ecx              ; Multiply by loop counter
    shl ecx, 1                 ; Shift loop counter left by 1
    mov esi, ecx               ; Move the result to esi
    imul esi, eax              ; Multiply by start_num
    xor ecx, ecx               ; Clear ecx
    mov ecx, edx               ; Move the result to ecx
    imul edx, ecx              ; Multiply by start_num
    xor eax, eax               ; Clear eax
    mov eax, edx               ; Move the result to eax
    imul eax, esi              ; Multiply by start_num
    add eax, esi               ; Add (w * (i << 1))
    add eax, edx               ; Add (w << start_num)
    
    ; Handle overflow
    cmp eax, [hundred]
    jl no_overflow
    sub eax, [hundred]
no_overflow:

    ; Handle underflow
    cmp eax, [zero]
    jge no_underflow
    add eax, [hundred]
no_underflow:

    ; Store w back to memory
    mov [w], eax
    
    ; Calculate decimal
    mov edx, [start_num]      ; Move start_num into edx
    imul edx, ecx             ; Multiply by loop counter
    shl ecx, 1                ; Shift loop counter left by 1
    mov esi, ecx              ; Move the result to esi
    imul esi, [start_num]     ; Multiply by start_num
    xor ecx, ecx              ; Clear ecx
    mov ecx, edx              ; Move the result to ecx
    imul edx, ecx             ; Multiply by start_num
    xor eax, eax              ; Clear eax
    mov eax, edx              ; Move the result to eax
    imul eax, esi             ; Multiply by start_num
    add eax, esi              ; Add (w * (i << 1))
    add eax, edx              ; Add (w << start_num)
    add eax, ecx              ; Add (i + w)

    ; Handle overflow for decimal
    cmp eax, [hundred]
    jl no_decimal_overflow
    sub eax, [ten]
no_decimal_overflow:

    ; Handle underflow for decimal
    cmp eax, [zero]
    jge no_decimal_underflow
    add eax, [ten]
no_decimal_underflow:

    ; Store decimal back to memory
    mov [decimal], eax
    
    ; Print result
    mov rdi, format           ; Load format string address into rdi
    mov rsi, ecx              ; Load loop counter into rsi (i)
    mov rdx, [w]              ; Load w into rdx
    mov rcx, [decimal]        ; Load decimal into rcx
    call printf               ; Call printf function
    
    ; Increment loop counter and repeat
    inc ecx
    jmp for_loop
    
end_loop:
    mov eax, 0                ; Return 0
    ret
