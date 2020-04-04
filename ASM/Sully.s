%define O_CREAT_WRONLY_TRUNC    03001o
%define PERMISSIONS             644o
%define SYS_OPEN                0x2000005

section .data
code: db "%4$cdefine O_CREAT_WRONLY_TRUNC    03001o%2$c%4$cdefine PERMISSIONS             644o%2$c%4$cdefine SYS_OPEN                0x2000005%2$c%2$csection .data%2$ccode: db %1$c%3$s%1$c, 0%2$cfilename: db %1$cGrace_kid.s%1$c, 0%2$c%2$c%4$cmacro RUN 0%2$c%2$csection .text%2$cglobal _main%2$cextern _dprintf%2$c%2$c_main:%2$c    push rbp%2$c    mov rbp, rsp%2$c%2$copen:%2$c    lea rdi, [rel filename]%2$c    mov rsi, O_CREAT_WRONLY_TRUNC%2$c	mov rdx, PERMISSIONS%2$c    mov rax, SYS_OPEN%2$c    syscall%2$c%2$c; duplicate boi%2$cwrite:%2$c    mov rdi, rax%2$c	lea rsi, [rel code]%2$c	mov rdx, 34%2$c	mov rcx, 10%2$c	lea r8, [rel code]%2$c    mov r9, 37%2$c	call _dprintf%2$c%2$cexit:%2$c    mov rax, 0%2$c	leave%2$c	ret%2$c%2$c%4$cendmacro%2$c%2$cRUN", 0
; compile: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o", 0
; link:
; execute: db "./Sully_%d", 0
filename: db "Sully_%d.s", 0        ; define byte (1 byte)
num: dd 5                           ; define doubleword (4 bytes)

section .text
global _main
extern _asprintf
extern _system

_main:
	enter 32, 0

	mov r10, num
	cmp r10, 0
	jle exit
	dec r10 ; dunno if this will work

; NEED TO DECREMENT i
	; mov rdx, [rel num]
	; dec rdx

child:
	lea rdi, [rsp]
	lea rsi, [rel filename]
	mov rdx, num
	call _asprintf

open:
    lea rdi, [rel filename]
    mov rsi, O_CREAT_WRONLY_TRUNC
	mov rdx, PERMISSIONS
    mov rax, SYS_OPEN
    syscall

write:
    mov rdi, rax
	lea rsi, [rel code]
	mov rdx, 34
	mov rcx, 10
	lea r8, [rel code]
    mov r9, 37
	call _asprintf

; multiply boi
execute:
	mov rdi, [rsp + 8]
	call _system

exit:
    mov rax, 0
	leave
	ret