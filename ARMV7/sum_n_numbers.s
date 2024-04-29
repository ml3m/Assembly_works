       ;sum    of n numbers
start  mov     r0, #3 ; n
       mov     r1, #1 ; counter of the sum n
       mov     r2, #0 ; sum of the r0 which is n
       cmp     r0, #0
       beq     less
repeat add     r2, r2, r1
       add     r1, r1, #1 ; counter++
       cmp     r1, r0 ; counter cmp n
       ble     repeat ; if counter <= n jump to repeat
less   end