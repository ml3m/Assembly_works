         ;       the sum S = 3 + 5 + 9 + ... for k terms
start    mov     r0, #3 ;k
         mov     r1, #0 ;sum
         mov     r2, #3 ;term
         mov     r3, #0 ; i = 0
startfor cmp     r3, r0
         bge     endfor
         add     r1, r1, r2
         add     r2, r2, r2
         sub     r2, r2, #1
         add     r3, r3, #1 ; i++
         b       startfor
endfor   end