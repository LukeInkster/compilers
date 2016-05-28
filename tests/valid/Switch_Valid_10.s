
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label551
label549:
	movq 24(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label550
label551:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label553
label550:
	movq 24(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label547
	jmp label552
label553:
label552:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label547
label555:
label548:
label547:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
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
	jnz label558
	movq $1, %rax
	jmp label559
label558:
	movq $0, %rax
label559:
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
	jnz label560
	movq $1, %rax
	jmp label561
label560:
	movq $0, %rax
label561:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
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
	jnz label562
	movq $1, %rax
	jmp label563
label562:
	movq $0, %rax
label563:
	movq %rax, %rdi
	call assertion
label557:
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
