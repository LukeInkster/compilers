
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
	jmp label422
label422:
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
	jnz label424
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label424
	addq $32, %rsp
	movq $1, %rax
	jmp label425
label424:
	movq $0, %rax
label425:
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
	jnz label426
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label426
	addq $32, %rsp
	movq $1, %rax
	jmp label427
label426:
	movq $0, %rax
label427:
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
	jnz label428
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label428
	addq $32, %rsp
	movq $1, %rax
	jmp label429
label428:
	movq $0, %rax
label429:
	movq %rax, %rdi
	call assertion
label423:
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
