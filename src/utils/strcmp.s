global strcmp

section .text

strcmp:
  xor rdx, rdx
  xor rcx, rcx

while_strcmp:
  cmp BYTE [rdi + rdx], 0
  je  end_string
  cmp BYTE [rdi + rdx], 0
  je  end_string
  mov al, BYTE [rdi + rdx]
  mov bl, BYTE [rsi + rcx]
  cmp al, bl
  jne not_equal_strcmp
  inc rdx
  inc rcx
  jmp while_strcmp

end_string:
  mov al, BYTE [rdi + rdx]
  mov bl, BYTE [rsi + rcx]
  cmp al, bl
  jne not_equal_strcmp
  jmp equal_strcmp


not_equal_strcmp:
  mov rax, 1
  ret

equal_strcmp:
  mov rax, 0
  ret
