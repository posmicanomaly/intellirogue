        ROMW    16      
        ORG     $5000

;------------------------------------------------------------------------------
; EXEC-friendly ROM header.
;------------------------------------------------------------------------------
ROMHDR: BIDECLE ZERO            ; MOB picture base   (points to NULL list)
        BIDECLE ZERO            ; Process table      (points to NULL list)
        BIDECLE MAIN            ; Program start address
        BIDECLE ZERO            ; Bkgnd picture base (points to NULL list)
        BIDECLE ONES            ; GRAM pictures      (points to NULL list)
        BIDECLE TITLE           ; Cartridge title/date
        DECLE   $03C0           ; Flags:  No ECS title, run code after title,
                                ; ... no clicks
ZERO:   DECLE   $0000           ; Screen border control
        DECLE   $0000           ; 0 = color stack, 1 = f/b mode
ONES:   DECLE   1, 1, 1, 1, 1   ; Color stack initialization
;------------------------------------------------------------------------------

TITLE   DECLE   107, "IntelliRogue", 0

MAIN    EIS                     ; Enable interrupts
        
        CALL CLRSCR
        ; 7 -white 2 -blue
        CALL    PRINT.FLS
        DECLE   2               ;
        DECLE   $200 + 1*20 + 1
        DECLE   "   IntelliRogue   ", 0

        CALL    PRINT.FLS
        DECLE   1
        DECLE   $200 + 3*20 + 1
        DECLE   "    ##########    ", 0

        CALL    PRINT.FLS
        DECLE   1
        DECLE   $200 + 4*20 + 1
        DECLE   "    #  $     #    ", 0

        CALL    PRINT.FLS
        DECLE   1
        DECLE   $200 + 5*20 + 1
        DECLE   "    +    @   #    ", 0

        CALL    PRINT.FLS
        DECLE   1
        DECLE   $200 + 6*20 + 1
        DECLE   "    # >     $#    ", 0

        CALL    PRINT.FLS
        DECLE   1
        DECLE   $200 + 7*20 + 1
        DECLE   "    ##########    ", 0

        CALL    PRINT.FLS
        DECLE   7
        DECLE   $200 + 9*20 + 1
        DECLE   "       2016       ", 0

here    B       here            ; Spin forever.


        INCLUDE "lib/print.asm"
        INCLUDE "lib/fillmem.asm"