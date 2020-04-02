; nasm -f macho64 Grace.s; gcc Grace.o -o Grace; ./Grace; diff Grace.s Grace_kid.s

%macro RUN 0

%define O_CREAT_WRONLY_TRUNC    03001o
%define PERMISSIONS             644o
%define SYS_OPEN                0x2000005

section .data
code: db "section .data%1$ccode: db %2$c%3$s%2$c,0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _printf%1$c%1$c_main:%1$c	push rbp%1$c	mov rbp, rsp%1$c	; print the source%1$c	call _printcode%1$c	leave%1$c	ret%1$c%1$c_printcode:%1$c	push rbp%1$c	mov rbp, rsp%1$c	lea rdi, [rel code]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	lea rcx, [rel code]%1$c	call _printf%1$c	mov rax, 0%1$c	leave%1$c	ret%1$c%1$c; löööööööp%1$c",0
filename: db "Grace_kid.s", 0    ; the filename to create +  null byte to terminate the string

section .text
global _main
extern _dprintf

_main:
    push rbp
    mov rbp, rsp

open:                           ; "open" does nothing... it's just a style thing. This is all treated as one big _main function
    lea rdi, [rel filename]
    mov rsi, O_CREAT_WRONLY_TRUNC
	mov rdx, PERMISSIONS            ; rw-r--r--
    mov rax, SYS_OPEN
    syscall

write:
    mov rdi, rax                ; move file descriptor into rdi
	lea rsi, [rel code]         ; load code address into rdi
	mov rdx, 34                 ; quotes
	mov rcx, 10                 ; new line
	lea r8, [rel code]          ; load code as dprintf argument
	call _dprintf

exit:
    mov rax, 0
	leave
	ret

%endmacro

RUN