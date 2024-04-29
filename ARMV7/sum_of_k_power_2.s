         ;       sum of k powers of 2
start    mov     r0, #6 ;k
         mov     r1, #0 ;sum
         mov     r2, #2 ;power of 2
         mov     r3, #1 ; i = 1
startfor cmp     r3, r0
         bge     endfor
         add     r1, r1, r2
         lsl     r2, r2, #1
         add     r3, r3, #1
         b       startfor

endfor   sub     r1, r1, #2
         end

