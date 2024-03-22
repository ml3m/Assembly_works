         ;       sum S= 1 + 3 + 7 +... for k terms
start    mov     r0, #5 ;k
         mov     r1, #0 ;sum
         mov     r2, #1 ;term
         mov     r3, #0 ; i = 0
startfor cmp     r3, r0
         bge     endfor
         add     r1, r1, r2
         add     r2, r2, r2
         add     r2, r2, #1
         add     r3, r3, #1 ; i++
         b       startfor
endfor   end