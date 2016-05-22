
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label575
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label573
label575:
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label576
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label573
label576:
	movq $2, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label577
	movq $2, %rax
	movq %rax, 16(%rbp)
	jmp label573
label577:
label574:
	addq $16, %rsp
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label573
label573:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label579
	movq $1, %rax
	jmp label580
label579:
	movq $0, %rax
label580:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label581
	movq $1, %rax
	jmp label582
label581:
	movq $0, %rax
label582:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
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
	jnz label583
	movq $1, %rax
	jmp label584
label583:
	movq $0, %rax
label584:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label585
	movq $1, %rax
	jmp label586
label585:
	movq $0, %rax
label586:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label587
	movq $1, %rax
	jmp label588
label587:
	movq $0, %rax
label588:
	movq %rax, %rdi
	call assertion
label578:
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
