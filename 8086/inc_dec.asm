;incrementation and decrementation
             
; when we increment 255 we go to 0              
mov al, 255
mov bl, -128
xor al, al
;inc al    ; the carry flag will be 0 
; since 255 is max, incrementing it
; will take the signed value -1 + 1 which is = 0

;add al, 1  ; the carry flag will be 1           



; since -128 is the max value the overflow flag is 1
; -128 - 1 = 127 ; because it takes the unsigned one

;dec bl
           
;add bl, -1    ; only this one gives us the carry flag