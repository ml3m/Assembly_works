;Bubble sort 10 numbers in place

.model tiny
.data
nums  db 3,7,9,1,8,2,4,5,3,6,10
count equ 9                       

.code
.startup
    mov dx, count
oloop:
    mov cx, count
    lea si, nums  ; adauga adresa efectiva inceput de nums
iloop:
    mov al, [si]                
    cmp al, [si+1]
    jl common                     
    xchg al, [si+1]         ; xchg e swap
    mov [si], al 
common:
    inc si
    loop iloop
        dec dx
        jnz oloop
.exit
end
