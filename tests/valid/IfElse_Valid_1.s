
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label255
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label253
	jmp label254
label255:
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jle label257
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label253
	jmp label256
label257:
	leaq str2(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label253
label256:
label254:
label253:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label259
	movq $1, %rax
	jmp label260
label259:
	movq $0, %rax
label260:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $10, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label261
	movq $1, %rax
	jmp label262
label261:
	movq $0, %rax
label262:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $11, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label263
	movq $1, %rax
	jmp label264
label263:
	movq $0, %rax
label264:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label265
	movq $1, %rax
	jmp label266
label265:
	movq $0, %rax
label266:
	movq %rax, %rdi
	call assertion
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label267
	movq $1, %rax
	jmp label268
label267:
	movq $0, %rax
label268:
	movq %rax, %rdi
	call assertion
label258:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl main
main:
	pushq %rbp
	call wl_main
	popq %rbp
	movq $0, %rax
	ret

	.data
str0:
	.asciz "LESS THAN"
str1:
	.asciz "GREATER THAN"
str2:
	.asciz "EQUALS"
