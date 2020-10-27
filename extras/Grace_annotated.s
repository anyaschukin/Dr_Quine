; nasm -f macho64 Grace.s; gcc Grace.o -o Grace; ./Grace; diff Grace.s Grace_kid.s

%define O_CREAT_WRONLY_TRUNC    03001o
%define PERMISSIONS             644o
%define SYS_OPEN                0x2000005

section .data
code: db "%4$cdefine O_CREAT_WRONLY_TRUNC    03001o%2$c%4$cdefine PERMISSIONS             644o%2$c%4$cdefine SYS_OPEN                0x2000005%2$c%2$csection .data%2$ccode: db %1$c%3$s%1$c, 0%2$cfilename: db %1$cGrace_kid.s%1$c, 0%2$c%2$c%4$cmacro RUN 0%2$c%2$csection .text%2$cglobal _main%2$cextern _dprintf%2$c%2$c_main:%2$c    push rbp%2$c    mov rbp, rsp%2$c%2$copen:%2$c    lea rdi, [rel filename]%2$c    mov rsi, O_CREAT_WRONLY_TRUNC%2$c	mov rdx, PERMISSIONS%2$c    mov rax, SYS_OPEN%2$c    syscall%2$c%2$c; duplicate boi%2$cwrite:%2$c    mov rdi, rax%2$c	lea rsi, [rel code]%2$c	mov rdx, 34%2$c	mov rcx, 10%2$c	lea r8, [rel code]%2$c    mov r9, 37%2$c	call _dprintf%2$c%2$cexit:%2$c    mov rax, 0%2$c	leave%2$c	ret%2$c%2$c%4$cendmacro%2$c%2$cRUN", 0
filename: db "Grace_kid.s", 0       ; the filename to create +  null byte to terminate the string

%macro RUN 0

section .text
global _main
extern _dprintf

_main:
    push rbp
    mov rbp, rsp

open:                               ; "open" does nothing... it's just a style thing. This is all treated as one big _main function
    lea rdi, [rel filename]
    mov rsi, O_CREAT_WRONLY_TRUNC
	mov rdx, PERMISSIONS            ; rw-r--r--
    mov rax, SYS_OPEN
    syscall

; duplicate boi
write:
    mov rdi, rax                    ; move file descriptor into rdi
	lea rsi, [rel code]             ; load code address into rsi
	mov rdx, 34                     ; quotes
	mov rcx, 10                     ; new line
	lea r8, [rel code]              ; percentage
    mov r9, 37                      ; load code as dprintf argument
	call _dprintf

exit:
    mov rax, 0
	leave
	ret

%endmacro

RUN


;   %1$c - quotes
;   %2$c - NL
;   %3$s - code string
;   %4$c - percent