       ;       Factorial of n
start   mov     r0, #5 ; n
        mov     r1, #1 ; fact
        mov     r2, #0 ; counter
        cmp     r0, #0 
        beq     final

fact    cmp r0, #0
        bgt calc
calc    add r0


final end