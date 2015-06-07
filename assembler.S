.global main
.arm	
.equ led1, 1<<8
.equ led2, 1<<29

.equ PIOB_PER, 0xFFFFF400
.equ PIOB_OER, 0XFFFFF410
.equ PIOB_SODR, 0xFFFFF430
.equ PIOB_CODR, 0xFFFFF434

.equ PIOC_PER, 0xFFFFF600
.equ PIOC_OER, 0XFFFFF610
.equ PIOC_SODR, 0xFFFFF630
.equ PIOC_CODR, 0xFFFFF634

.section.text
main:

BL portB_enable
BL portB_output
BL portC_enable
BL portC_output
end: 

BL ledB_on
BL delay
BL ledB_off
BL ledC_on
BL delay
BL ledC_off
BL end

portB_enable:
LDR R1, =led1
LDR R2, =PIOB_PER
STR R1, [R2]
BX LR

portB_output:
LDR R1, =led1
LDR R2, =PIOB_OER
STR R1, [R2]
BX LR

ledB_on:
LDR R1, =led1
LDR R2, =PIOB_CODR
STR R1, [R2]
BX LR

ledB_off:
LDR R1, =led1
LDR R2, =PIOB_SODR
STR R1, [R2]
BX LR

portC_enable:
LDR R1, =led2
LDR R2, =PIOC_PER
STR R1, [R2]
BX LR

portC_output:
LDR R1, =led2
LDR R2, =PIOC_OER
STR R1, [R2]
BX LR

ledC_on:
LDR R1, =led2
LDR R2, =PIOC_CODR
STR R1, [R2]
BX LR

ledC_off:
LDR R1, =led2
LDR R2, =PIOC_SODR
STR R1, [R2]
BX LR

delay:
LDR R2, =0x4FFFF

delay_loop:
SUBS R2, R2, #1
BNE delay_loop
BX LR
