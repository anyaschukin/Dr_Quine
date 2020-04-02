; nasm -f macho64 Grace.s; gcc Grace.o -o Grace; ./Grace; diff Grace.s Grace_kid.s

section .data
code: db "section .data%1$ccode: db %2$c%3$s%2$c,0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _printf%1$c%1$c_main:%1$c	push rbp%1$c	mov rbp, rsp%1$c	; print the source%1$c	call _printcode%1$c	leave%1$c	ret%1$c%1$c_printcode:%1$c	push rbp%1$c	mov rbp, rsp%1$c	lea rdi, [rel code]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	lea rcx, [rel code]%1$c	call _printf%1$c	mov rax, 0%1$c	leave%1$c	ret%1$c%1$c; löööööööp%1$c",0
filename: db "Grace_kid.s", 0    ; the filename to create

section .text
global start
global _main
; extern _dprintf

; start:
_main:
    push rbp
    mov rbp, rsp                ; initialize the stack

open:
    lea rdi, [rel filename]
    mov rsi, 03001o             ; O_CREAT_WRONLY_TRUNC
	mov rdx, 644o               ; permissions, rw-r--r--
    mov rax, 0x2000005          ; open      ... system call commands are read from rax
    syscall

; write:

exit:
    mov rax, 0
	leave
	ret