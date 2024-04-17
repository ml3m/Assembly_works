start:
    mov     ax, 1       ; fact
    mov     bx, 5      ; n

startwhile:
    cmp     bx, 1
    jle     endwhile

    mov     cx, ax      ; temp
    mov     dx, 1       ; i

startfor:
    cmp     dx, bx
    jge     endfor

    add     ax, cx
    inc     dx          ; i++
    jmp     startfor

endfor:
    sub     bx, 1
    jmp     startwhile

endwhile:
    ret