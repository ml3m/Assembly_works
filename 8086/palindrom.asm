; mirror n and then check if n and mirror are equal -> palindrome
    mov ax,122  ; n      
    mov bp, ax   ; copie n
    mov cx,0  ;reversed number  
    mov bx,10  ; div and mul  
mainLoop:
    mov dx, ax
    mov ax, cx
    mov cx, dx
    mul bx        ; ax = 10*n ; cx= 10*n
    mov dx, ax
    mov ax, cx
    mov cx, dx
    mov dx,0      ; 
    div bx        ; Perform division and modulo ;  ax = n/10 ;dx = n MOD 10 last digit
    add cx,dx     ; "cx = 10*cx+digit
    cmp ax,0     ; if ax is 0 then the whole number was reversed
    ja mainLoop  

mov ax, bp
cmp ax, cx  ; comparam inv copie  
je palindrom 
xor ax, ax     ; is not palindrom ax = 0
ret

palindrom:
    mov ax, 1  ; it is palindrome ax = 1
    ret
    
                  