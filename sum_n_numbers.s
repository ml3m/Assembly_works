       ;       sum of n numbers
start  mov     r0, #10 ; n
       mov     r1, #1 ; counter
       mov     r2, #0 ; sum
       cmp     r0, #0
       beq     exit
repeat add     r2, r2, r1
       add     r1, r1, #1
       cmp     r1, r0
       ble     repeat
exit   end
