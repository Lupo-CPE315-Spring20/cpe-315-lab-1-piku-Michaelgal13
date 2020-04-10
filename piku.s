    .syntax unified

    @ --------------------------------
    .global main
main:
    @ Stack the return address (lr) in addition to a dummy register (ip) to
    @ keep the stack 8-byte aligned.
    push    {ip, lr}

    @ Load the argument and perform the call. This is like 'printf("...")' in C.
    ldr     r0, =message
    bl      printf
    ldr     r0, =message2
    bl      printf
    ldr     r0, =message3
    bl      printf

    @ Exit from 'main'. This is like 'return 0' in C.
    mov     r0, #0      @ Return 0.
    @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
    @ value directly into pc — the Program Counter — to return.
    pop     {ip, pc}

    @ --------------------------------
    @ Data for the printf call. The GNU assembler's ".asciz" directive
    @ automatically adds a NULL character termination.


message:
    @.asciz  "Cal Poly's Servers.\n"
    @.asciz "Cannot handle al students. \n"
    @.asciz "This VPN sucks. \n"
.asciz "Raspberry Pi 4. \n"
message2:
.asciz "How the heck do I use it? \n"
message3:
.asciz "Hopefully I'll learn.\n"

    @.asciz "Segmentation Fault"
    @.asciz "Guess that I did something wrong. \n"
    @.asciz "Oh well, try again. \n"
