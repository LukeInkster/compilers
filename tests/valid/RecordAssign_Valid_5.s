
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, -16(%rbp)
	movq 32(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 24(%rbp)
	jmp label507
label507:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 0(%rsp)
	movq $2, %rax
	movq %rax, 8(%rsp)
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rsp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label509
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label509
	addq $32, %rsp
	movq $1, %rax
	jmp label510
label509:
	movq $0, %rax
label510:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 0(%rsp)
	movq $3, %rax
	movq %rax, 8(%rsp)
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rsp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label511
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label511
	addq $32, %rsp
	movq $1, %rax
	jmp label512
label511:
	movq $0, %rax
label512:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $9, %rax
	movq %rax, 0(%rsp)
	movq $10, %rax
	movq %rax, 8(%rsp)
	subq $32, %rsp
	movq $9, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rsp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label513
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label513
	addq $32, %rsp
	movq $1, %rax
	jmp label514
label513:
	movq $0, %rax
label514:
	movq %rax, %rdi
	call assertion
label508:
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
