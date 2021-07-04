.data
    first: .word 10
    second: .word 15
.text
     lw $t0, first($zero)
     lw $t1, second($zero)
     
     add $t2, $t0, $t1
     
     li $v0, 1
     add $a0, $zero, $t2
     syscall
     
    
