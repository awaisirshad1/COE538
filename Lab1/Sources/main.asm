********************************************************************
* Lab 1 Program *
* Author: Awais Irshad *
********************************************************************
; export symbols
              XDEF Entry, _Startup ; export ‘Entry’ symbol
              ABSENTRY Entry ; for absolute assembly: mark
; this as applicat. entry point
; Include derivative-specific definitions
              INCLUDE 'derivative.inc'
********************************************************************
* Code section *
********************************************************************
              ORG $3000
MULTIPLICAND  FCB 05 ; First Number
MULTIPLIER    FCB 02 ; Second Number
PRODUCT       RMB 2 ; Result of multiplication
********************************************************************
* The actual program starts here *
********************************************************************
              ORG $4000
Entry:
_Startup:
              
              LDAA MULTIPLICAND ; Get the first number into ACCA
              LDAB MULTIPLIER ; Get second number into ACCB
              MUL 
              STD PRODUCT ; and store the product
              SWI ; break to the monitor
********************************************************************
* Interrupt Vectors *
********************************************************************
              ORG $FFFE
              FDB Entry ; Reset Vector
