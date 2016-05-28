
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq %rax, 16(%rbp)
	jmp label352
label352:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 8(%rsp)
	movq $10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label354
	movq $1, %rax
	jmp label355
label354:
	movq $0, %rax
label355:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label356
	movq $1, %rax
	jmp label357
label356:
	movq $0, %rax
label357:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $-10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $-3, %rbx
	cmpq %rax, %rbx
	jnz label358
	movq $1, %rax
	jmp label359
label358:
	movq $0, %rax
label359:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label360
	movq $1, %rax
	jmp label361
label360:
	movq $0, %rax
label361:
	movq %rax, %rdi
	call assertion
label353:
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
