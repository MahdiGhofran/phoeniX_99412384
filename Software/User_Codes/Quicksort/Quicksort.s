# quicksort(int arr[], int start, int end)
# Requires: 'start' >= 0
#           'end' < length(arr)

# MAIN
addi sp, sp, 1000
# Store array values in contiguous memory at mem address 0x0:
# {10, 80, 30, 90, 40, 50, 70}
 addi a0, x0, 0

 addi t0, x0, 10
 sw t0, 0(a0) 
 addi t0, x0, 80
 sw t0, 4(a0)
 addi t0, x0, 30
 sw t0, 8(a0)
 addi t0, x0, 90
 sw t0, 12(a0)
 addi t0, x0, 40
 sw t0, 16(a0)
 addi t0, x0, 50
 sw t0, 20(a0)
 addi t0, x0, 70
 sw t0, 24(a0)

addi a1, x0, 0 # start
addi a2, x0, 6 # end

jal ra, QUICKSORT
jal ra, EXIT

QUICKSORT:
addi sp, sp, -20
sw ra, 16(sp)
sw s3, 12(sp)
sw s2, 8(sp)
sw s1, 4(sp)
sw s0, 0(sp)

addi s0, a0, 0
addi s1, a1, 0
addi s2, a2, 0
BLT a2, a1, START_GT_END

jal ra, PARTITION

addi s3, a0, 0   # pi

addi a0, s0, 0
addi a1, s1, 0
addi a2, s3, -1
jal ra, QUICKSORT  # quicksort(arr, start, pi - 1);

addi a0, s0, 0
addi a1, s3, 1
addi a2, s2, 0
jal ra, QUICKSORT  # quicksort(arr, pi + 1, end);

START_GT_END:

lw s0, 0(sp)
lw s1, 4(sp)
lw s2, 8(sp)
lw s3, 12(sp)
lw ra, 16(sp)
addi sp, sp, 20
jalr x0, ra, 0

PARTITION:
addi sp, sp, -4
sw ra, 0(sp)

slli t0, a2, 2   # end * sizeof(int)
add t0, t0, a0  
lw t0, 0(t0)     # pivot = arr[end]
addi t1, a1, -1  # i = (start - 1)