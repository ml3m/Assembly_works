data segment

string1 db  "West", 0
string2 db  "University ", 0 

data ends

code segment

ASSUME  CS: code, DS: data

start:
    cld
    mov     ax  , data
    mov     DS  , ax      
    mov     ES  , ax   ; here!

    ; Calculate length of string2
    mov     SI  , offset string2
    mov     CX  , 0
count_length:
    lodsb
    test    al, al
    jz      calculate_length_done
    inc     CX
    jmp     count_length
calculate_length_done:

    ; Set DI to the end of string2
    mov     DI  , offset string2
    add     DI  , CX

    ; Set CX to the length of string1
    mov     SI  , offset string1
    mov     CX  , 4  ; length of "West" excluding null terminator

    ; Concatenate string1 to the end of string2
    rep movsb

    ; Printing the result character by character on the console
    mov     SI  , offset string2
l:  
    lodsb           ; Printing loop
    test    al, al  ; Check for null terminator
    jz      print_done
    mov     dl, al
    mov     ah, 2h
    int     21h
    jmp     l
print_done:

    hlt 

code ends
end start
