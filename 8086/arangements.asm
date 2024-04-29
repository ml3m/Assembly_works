; arangements n taken k    
; A(k,n) =  n! / (n-k)!  

mov dx, 5  ;n
mov cx, dx
mov bl, 4  ; k 
div bl

; save n-k in a register
; calcualte fact of n! save it in ax
; calculate fact of n-k! and save it in bx
; finally do ax/bx which is the formula for A
start:                                             
    mov     ax, 1       ; fact
    mov     bx, dx      ; n
 
fact: 
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
; in ax is 120 (factorial of n =5)
