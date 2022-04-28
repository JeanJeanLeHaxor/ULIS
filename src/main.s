%macro  _exit 1
  mov rax, 60
  mov rdi, %1
  syscall
%endmacro

extern strcmp

global _start

section .text

_start:
  mov rbp, rsp
  sub rsp, 0x100

ulis_while:

  mov rax, 0
  mov rdi, 0
  lea rsi, [rbp - 0x100]
  mov rdx, 0x100
  syscall
  sub rax, 1
  mov BYTE [rsi + rax], 0

  lea rdi, [exit_string]
  call strcmp
  cmp rax, 0
  jne ulis_while
  _exit 0


section .data

exit_string: db "exit"
