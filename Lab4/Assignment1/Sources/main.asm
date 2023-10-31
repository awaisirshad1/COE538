;*****************************************************************
* Lab 4 Assignment 1 Program *
* Author: Awais Irshad *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

ROMStart    EQU  $4000  ; absolute address to place my code/constant data

; variable/data section

            ORG RAMStart
 ; Insert here your data definition.
 


; code section
            ORG   ROMStart


Entry:
_Startup:
            
************************************************************
* Motor Control *
************************************************************
            BSET  DDRA,%00000011
            BSET  DDRT,%00110000
            JSR   STARFWD
            JSR   PORTFWD
            JSR   STARON
            JSR   PORTON
            JSR   STARREV
            JSR   PORTREV
            JSR   STAROFF
            JSR   PORTOFF
            BRA   *
            ; Starboard (right when facing forward) motor on
            
STARON      LDAA  PTT
            ORAA  #%00100000
            STAA  PTT
            RTS
            ; Starboard (right when facing forward) motor off
STAROFF     LDAA  PTT
            ANDA  #%11011111
            STAA  PTT
            RTS
            ; Port side (left when facing forward) motor on
PORTON      LDAA  PTT
            ORAA  #%00010000
            STAA  PTT
            RTS
            ;Port side (left when facing forward) motor off
PORTOFF     LDAA  PTT
            ANDA  #%11101111
            STAA  PTT
            RTS
            ;startboard motor reversed
STARFWD     LDAA  PORTA
            ANDA  #%11111101
            STAA  PORTA
            RTS

STARREV     LDAA  PORTA
            ORAA  #%00000010
            STAA  PORTA
            RTS
                                
PORTFWD     LDAA  PORTA
            ANDA  #%11111110
            STAA  PORTA
            RTS
            
PORTREV     LDAA  PORTA
            ORAA #%00000001
            STAA  PORTA
            ;STAA PTH   only if emulating
            RTS


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
