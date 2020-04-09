section .data
code: db "section .data%1$ccode: db %2$c%3$s%2$c,0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _printf%1$c%1$c_main:%1$c	push rbp%1$c	mov rbp, rsp%1$c	; print boi%1$c	call _printcode%1$c	leave%1$c	ret%1$c%1$c_printcode:%1$c	push rbp%1$c	mov rbp, rsp%1$c	lea rdi, [rel code]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	lea rcx, [rel code]%1$c	call _printf%1$c	mov rax, 0%1$c	leave%1$c	ret%1$c%1$c; I'm on the STDoutside!",0

section .text
global start
global _main
extern _printf

_main:
	push rbp
	mov rbp, rsp
	; print boi
	call _printcode
	leave
	ret

_printcode:
	push rbp
	mov rbp, rsp
	lea rdi, [rel code]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [rel code]
	call _printf
	mov rax, 0
	leave
	ret

; I'm on the STDoutside!