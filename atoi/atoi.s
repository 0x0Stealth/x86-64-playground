.intel_syntax noprefix


_start:
mov  rdi, [rsp+16]
call atoi
mov  rdi, rax
mov  rax, 60
syscall

atoi_digit:

movzx rax, BYTE PTR [rdi]
sub   rax, 0x30
ret

atoi:
xor  rcx, rcx
xor  r8,  r8
cmp  BYTE PTR [rdi], 0x2D
jne  loop
inc  rdi
mov  r8, 1

loop:
call atoi_digit
cmp  rax, 9
ja   done_label
imul rcx, 10
add  rcx, rax
inc  rdi 
jmp  loop


done_label:
cmp r8, 1
je  negative_result
mov rax, rcx
ret 

negative_result:
mov rax, rcx
imul rax, -1
ret
