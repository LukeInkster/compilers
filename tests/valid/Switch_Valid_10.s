
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label525
label523:
	movq 24(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label524
label525:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label527
label524:
	movq 24(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label521
	jmp label526
label527:
label526:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label521
label529:
label522:
label521:
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
	jnz label532
	movq $1, %rax
	jmp label533
label532:
	movq $0, %rax
label533:
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
	jnz label534
	movq $1, %rax
	jmp label535
label534:
	movq $0, %rax
label535:
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
	jnz label536
	movq $1, %rax
	jmp label537
label536:
	movq $0, %rax
label537:
	movq %rax, %rdi
	call assertion
label531:
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
