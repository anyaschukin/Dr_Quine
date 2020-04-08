%define O_CREAT_WRONLY_TRUNC    03001o
%define PERMISSIONS             644o
%define SYS_OPEN                0x2000005
%define SYS_CLOSE               0x2000006

section .data
self: db __FILE__, 0
filename: db "Sully_%d.s", 0
code: db "%%define O_CREAT_WRONLY_TRUNC    03001o%1$c%%define PERMISSIONS             644o%1$c%%define SYS_OPEN                0x2000005%1$c%%define SYS_CLOSE               0x2000006%1$c%1$csection .data%1$cself: db __FILE__, 0%1$cfilename: db %2$cSully_%%d.s%2$c, 0%1$ccode: db %2$c%3$s%2$c, 0%1$cexec: db %2$cnasm -f macho64 Sully_%%1$d.s; gcc Sully_%%1$d.o -o Sully_%%1$d; rm Sully_%%1$d.o; ./Sully_%%1$d%2$c, 0%1$c%1$csection .text%1$cglobal _main%1$cextern _asprintf%1$cextern _dprintf%1$cextern _strchr%1$cextern _system%1$c%1$c_main:%1$c	enter 32, 0%1$c%1$c	mov r12, %4$d%1$c	cmp r12, 0%1$c	jle exit%1$c%1$ccheck:%1$c	lea rdi, [rel self]%1$c	mov rsi, '_'%1$c    call _strchr%1$c	cmp rax, 0%1$c	je child%1$c%1$c	dec r12%1$c%1$cchild:%1$c	lea rdi, [rsp]%1$c	lea rsi, [rel filename]%1$c	mov rdx, r12%1$c	call _asprintf%1$c%1$copen:%1$c    mov rdi, [rsp]%1$c    mov rsi, O_CREAT_WRONLY_TRUNC%1$c	mov rdx, PERMISSIONS%1$c    mov rax, SYS_OPEN%1$c    syscall%1$c%1$cwrite:%1$c    mov rdi, rax%1$c	lea rsi, [rel code]%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	lea r8, [rel code]%1$c    mov r9, r12%1$c	call _dprintf%1$c%1$c	mov rax, SYS_CLOSE%1$c	syscall%1$c%1$c; multiply boi%1$cexecute:%1$c	lea rdi, [rsp]%1$c	lea rsi, [rel exec]%1$c	mov rdx, r12%1$c	call _asprintf%1$c%1$c	mov rdi, [rsp]%1$c	call _system%1$c%1$cexit:%1$c    mov rax, 0%1$c	leave%1$c	ret", 0
exec: db "nasm -f macho64 Sully_%1$d.s; gcc Sully_%1$d.o -o Sully_%1$d; rm Sully_%1$d.o; ./Sully_%1$d", 0

section .text
global _main
extern _asprintf
extern _dprintf
extern _strchr
extern _system

_main:
	enter 32, 0

	mov r12, 5
	cmp r12, 0
	jle exit

check:
	lea rdi, [rel self]
	mov rsi, '_'
    call _strchr
	cmp rax, 0
	je child

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
	mov rdx, 10
	mov rcx, 34
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