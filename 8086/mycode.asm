start:
    mov ax, 123 ; n = 123
    mov bl, 0 ; sum of digits
    mov dx, 1
    mov dl, 1;
    call while

while:
    cmp dl, 0  ;end while condition
    je endwhile
    mov cl, 0 ; reminder = 0
    mov dx, ax ; copy ax
    mov bh, 10 ; %
    div bh     ; dl = / and dh = %
    add bl, ah
    jmp while

endwhile:
    ret