           ;n!
start      mov     r0, #1 ;fact
           mov     r1, #10 ;n
startwhile 
           cmp     r1, #1
           ble     endwhile
           mov     r2, r0 ;temp
           mov     r3, #1 ;i
startfor   
           cmp     r3, r1
           bge     endfor
           add     r0, r0, r2
           add     r3, r3, #1 ; i++
           b       startfor
endfor     
           sub     r1, r1, #1
           b       startwhile
endwhile   end
