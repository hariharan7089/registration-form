    GLOBAL __main
    AREA main, CODE, READONLY
    EXPORT __main
    EXPORT __use_two_region_memory
    __use_two_region_memory EQU0
    BX
    LR
    ENTRY
; Main loop begins
    __main
    LDR R0, =0X22222222; load first input
    LDR R1, =0X11111111; load second input
    SUB R2, R0, R1; subtract the contents of R1 from R0, store result in R2
    stop
    B stop
    end
