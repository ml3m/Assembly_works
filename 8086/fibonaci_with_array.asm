; fib gen until carry is reached 
.model tiny
.data
nums db 0
count equ 20



.code
.startup
    mov al, 20
    lea si, nums ; arr counter          
    mov dh, 1; for i = 1
    mov bl, 1; current
    mov cl, 0; next
    mov dl, 0; prev
for:       
    cmp dh, al
    jg endfor
    mov [si], bl
    inc si;
    mov cl, dl
    add cl, bl
    jc endfor   
    mov dl, bl
    mov bl, cl
    inc dh
    call for

endfor:
    ret