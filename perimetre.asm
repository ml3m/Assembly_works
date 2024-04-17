; compute perimetre of triangle
mov al, 10
mov bl, 7
mov cl, 3
mov dl, 0; perimetre

cmp al, 0 
jg add1
add dl, al
add dl, bl
add dl, cl
            
add1:
      add dl, al
add2: 
      add dl, bl
add3:
      add dl, cl  
