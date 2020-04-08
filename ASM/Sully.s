%define O_CREAT_WRONLY_TRUNC    03001o
%define PERMISSIONS             644o
%define SYS_OPEN                0x2000005
%define SYS_CLOSE               0x2000006

section .data
exec: db "nasm -f macho64 Sully_%1$d.s; gcc Sully_%1$d.o -o Sully_%1$d; rm Sully_%1$d.o; ./Sully_%1$d", 0
code: db "%%define O_CREAT_WRONLY_TRUNC    03001o%2$c%%define PERMISSIONS             644o%2$c%%define SYS_OPEN                0x2000005%2$c%%define SYS_CLOSE               0x2000006%2$c%2$csection .data%2$cexec: db %1$cnasm -f macho64 Sully_%%1$d.s; gcc Sully_%%1$d.o -o Sully_%%1$d; rm Sully_%%1$d.o; ./Sully_%%1$d%1$c, 0%2$ccode: db %1$c%3$s%1$c, 0%2$cfilename: db %1$cSully_%%d.s%1$c, 0%2$c%2$c%2$csection .text%2$cglobal _main%2$cextern _printf%2$cextern _asprintf%2$cextern _dprintf%2$cextern _strchr%2$cextern _system%2$c%2$c_main:%2$c	enter 32, 0%2$c%2$c	mov r12, %4$d%2$c	cmp r12, 0%2$c	jle exit%2$c%2$c%2$c	dec r12%2$c%2$cchild:%2$c	lea rdi, [rsp]%2$c	lea rsi, [rel filename]%2$c	mov rdx, r12%2$c	call _asprintf%2$c%2$copen:%2$c    mov rdi, [rsp]%2$c    mov rsi, O_CREAT_WRONLY_TRUNC%2$c	mov rdx, PERMISSIONS%2$c    mov rax, SYS_OPEN%2$c    syscall%2$c%2$cwrite:%2$c    mov rdi, rax%2$c	lea rsi, [rel code]%2$c	mov rdx, 34%2$c	mov rcx, 10%2$c	lea r8, [rel code]%2$c    mov r9, r12%2$c	call _dprintf%2$c%2$c	mov rax, SYS_CLOSE%2$c	syscall%2$c%2$c; multiply boi%2$c%2$cexecute:%2$c	lea rdi, [rsp]%2$c	lea rsi, [rel exec]%2$c	mov rdx, r12%2$c	call _asprintf%2$c	%2$c	mov rdi, [rsp]%2$c	call _system%2$c%2$cexit:%2$c    mov rax, 0%2$c	leave%2$c	ret", 0
filename: db "Sully_%d.s", 0

section .text
global _main
extern _printf
extern _asprintf
extern _dprintf
extern _strchr
extern _system

_main:
	enter 32, 0

	mov r12, 5
	cmp r12, 0
	jle exit
	
	dec r12

child:
	lea rdi, [rsp]
	lea rsi, [rel filename]
	mov rdx, r12
	call _asprintf

open:
    mov rdi, [rsp]
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
    mov r9, r12
	call _dprintf

	mov rax, SYS_CLOSE
	syscall

; multiply boi
execute:
	lea rdi, [rsp]
	lea rsi, [rel exec]
	mov rdx, r12
	call _asprintf

	mov rdi, [rsp]
	call _system

exit:
    mov rax, 0
	leave
	ret