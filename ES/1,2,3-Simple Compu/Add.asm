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
    LDR R0, =0X11111111; load first input
    LDR R1, =0X22222222; load second input
    ADD R2, R0, R1; add the contents of R0 and R1, store result in R2
    stop
    B stop
    end
