start:
mov     ax, 10      ; n
mov     bx, 1      ; counter of the sum n
mov     cx, 0      ; sum of the r0 which is n
cmp     ax, 0
je      finish

repeat:
add     cx, bx
inc     bx         ; counter++
cmp     bx, ax     ; counter cmp n
jle     repeat     ; if counter <= n jump to repeat
finish:
ret
