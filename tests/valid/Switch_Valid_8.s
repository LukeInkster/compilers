
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label626
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label624
label626:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label627
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label624
label627:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label624
label628:
label625:
label624:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
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
	jnz label630
	movq $1, %rax
	jmp label631
label630:
	movq $0, %rax
label631:
	movq %rax, %rdi
	call assertion
	movq $234, %rax
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
	jnz label632
	movq $1, %rax
	jmp label633
label632:
	movq $0, %rax
label633:
	movq %rax, %rdi
	call assertion
	movq $456, %rax
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
	jnz label634
	movq $1, %rax
	jmp label635
label634:
	movq $0, %rax
label635:
	movq %rax, %rdi
	call assertion
label629:
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
