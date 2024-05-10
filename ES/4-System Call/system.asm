    GLOBAL __main
    AREA main, CODE, READONLY
    EXPORT __main
    EXPORT __use_two_region_memory
    __use_two_region_memory EQU0
    BX
    LR
    ENTRY
; Addresses of Registers
    IO1DIR EQU0xE0028018
    IO1PIN EQU0xE002801C
    PINSEL2 EQU0xE002C014

    __main
; Configure GPIO pins as output
    LDR R1, =PINSEL2; Load address of PINSEL2 register
    LDR R2, =0x00000000; Set PINSEL2 to configure GPIOs as GPIO
    STR R2, [R1]

; Set GPIO pins as outputs
    LDR R1, =IO1DIR; Load address of IO1DIR register
    LDR R2, =0x000F0000; Set bits16 to19(P1.16 to P1.19)as outputs
    STR R2, [R1]

    loop
; Toggle LEDs
    LDR R1, =IO1PIN; Load address of IO1PIN register
    LDR R2, [R1]; Read current value of IO1PIN
    MOV R2, R2, LSR#8; Shift the value by8 bits to access P1.16 to P1.23
    AND R2, R2, #0x00FF0000; Mask bits16 to23 to isolate P1.16 to P1.23
    STR R2, [R1]; Write back to IO1PIN to toggle LEDs

; Delay(you'll need to implement this based on your desired delay)
; You can use a loop, timer, or other mechanism to create a delay

    B loop; Branch back to loop

    END
