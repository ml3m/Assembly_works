       ;       fib
start  mov     r0, #5; n = 5
       mov     r1, #1; product fib
       cmp     r0, #0;
       bgt     loop
       end
loop   mov     r2, r0; copy
       cmp     r2, #0
       bgt     mul
       sub     r0, r0, #1
       cmp     r0, #0
       bgt     loop
       end
mul    add     r5, r1, r1
       sub     r2, r2, #1
       cmp     r2, #0
       bgt     mul
       add     r1, r1, r5

