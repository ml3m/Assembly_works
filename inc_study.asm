;               incrementing and decrementing study
;0xFFFF + 1 = 0x10000 

;stored in 16 bit register
;so it gets truncated to 0x0000 

;using inc | no carry flag| 
; but using add 1 | carry flag |

; using dec | no carry flag, overflow |
; using add bl, -1 | carry flag, overflow|