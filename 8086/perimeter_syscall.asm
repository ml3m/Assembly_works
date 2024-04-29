; calculates the perimetre of a triangle that doesn't exceed 2 digits
.model small
.data
str1 db "a= $"
str2 db 13,10,"b= $"
str3 db 13,10,"c= $"
str4 db 13,10,"The perimetre is: $"
string db 'the perimetre exceeds 2 digits', 13, 10, '$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,str1  ; take the first string
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al   
    
    lea dx,str2  ; take the second string
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bh,al
             
    lea dx,str3  ; take the third string
    mov ah, 9
    int 21h
    mov ah,1
    int 21h
    mov cl,al    ; the input char is allways saved in al somehow
    
    sub bh,48    ; then substract for each -48 for ascii conversion
    sub bl,48
    sub cl,48
    
    ; adding
    add bh,bl    ; add each of the numbers and then add 48 to turn it back to ascii
    add bh,cl
    
    cmp bh, 9    ; if it exceeds 2 digits the permeter is canceled
    jg twodigits
    
    add bh,48  
    
    lea dx,str4  ; prepare str4 which will hold the perimetre
    mov ah,9
    int 21h 
    
    mov dl,bh
    mov ah,2
    int 21h
    mov ah,4Ch
    int 21h 

twodigits:
    lea dx, string
    mov ah, 9 ; string output
    int 21h ; display string
    mov ah, 4Ch
    int 21h   
main endp
end
