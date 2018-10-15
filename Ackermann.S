    .data
m: .word 0
n: .word 0
grabArgs: .asciz "%d %d"
outPut: .asciz "%d\n"


    .text
   .global main
main: 
    stmfd sp!, {lr}
    ldr r0, =grabArgs
    ldr r1, =m
    ldr r2, =n
    bl scanf
    ldr r0, =m
    ldr r0, [r0]
    ldr r1, =n
    ldr r1, [r1]
    bl ackermann
    mov r1, r0
    ldr r0, =outPut
    bl printf
    
    ldmfd sp!, {lr}
    mov pc, lr


ackermann:
    stmfd sp!, {r0, r1, lr}
    cmp r0, #0
    moveq r0, r1
    addeq r0, r0, #1
    moveq r1, #0
    beq return
    cmp r1, #0
    bne else
    sub r0, r0, #1
    mov r1, #1
    bl ackermann
    b return
else:
    sub r1, r1, #1
    bl ackermann
    ldmfd sp, {r2, r3}
    mov r1, r0
    sub r2, r2, #1
    mov r0, r2
    bl ackermann
return: 

    ldmfd sp!, {r4, r5, lr}
    mov pc, lr
