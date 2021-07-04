.data
  mdArray: .word 1,4,5
           .word 6,7,8
           .word 9,10,12
  size: .word 3
  .eqv DATA_SIZE 4
  
.text
main:
  la $a0,mdArray
  lw $a1,size
  jal sumDiagonal
  
  move $a0 ,$v0
  li $v0, 1
  syscall
  
  #End Program 
  li $v0, 10
  syscall
  
 sumDiagonal:
  li $v0 ,0 #sum = 0
  li $t0 ,0 #$t0 as the Index
  
    sumLoop:
    mul $t1, $t0, $a1  #t1 = rowIndex * colSize
    add  $t1, $t1, $t0  
    mul $t1, $t1 ,DATA_SIZE
    add  $t1, $t1, $a0
    
    lw $t2, ($t1)
    add $v0, $v0, $t2
    
    addi $t0, $t0, 1
    blt $t0,$a1,sumLoop
    
  jr $ra
  
 #performance evaluation:
       # N=4 case:
 	#2 + (6 + 1 + 6 + 5) * 4 + 1 = 21 cycles
 #multiplication takes 6 cycles