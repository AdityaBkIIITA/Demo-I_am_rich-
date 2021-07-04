.data
mdArray: .word 1,1
         .word 1,1
.eqv DATA_SIZE 4

.text
main:
   la $a0,mdArray
   jal determinant
   
   move $a0,$v0
   li $v0 , 1
   syscall
   
   li $v0, 10
   syscall
   
   determinant:
   lw $t1, ($a0)
   
   li $t7 , 1
   mul $t2, $t7, 2
   add $t2, $t2, 1
   mul $t2, $t2, DATA_SIZE
   add $t2, $t2, $a0
   lw $t3, ($t2)
   
   li $t7 , 0
   mul $t2, $t7, 2
   add $t2, $t2, 1
   mul $t2, $t2, DATA_SIZE
   add $t2, $t2, $a0
   lw $t4, ($t2)
   
   li $t7 ,1
   mul $t2, $t7, 2
   add $t2, $t2, 0
   mul $t2, $t2, DATA_SIZE
   add $t2, $t2, $a0
   lw $t5 ,($t2)
   
   mul $s1, $t1, $t3
   mul $s2, $t4, $t5
   
   sub $v0,$s1,$s2
   
   jr $ra
   
#performance evaluation:
       # N=2 case:
 	#1 + (1 + 6 + 1 + 6 + 1 + 1) * 3  + 12 + 2 = 63 cycles
 #multiplication takes 6 cycles
   