
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, 0(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rbx
	movq %rbx, 24(%rbp)
	movq $1, %rax
	movq %rax, 24(%rbp)
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label515
label515:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 0(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rbx
	movq %rbx, 0(%rsp)
	movq -16(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label517
	addq $16, %rsp
	movq $1, %rax
	jmp label518
label517:
	movq $0, %rax
label518:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, 0(%rsp)
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label519
	addq $16, %rsp
	movq $1, %rax
	jmp label520
label519:
	movq $0, %rax
label520:
	movq %rax, %rdi
	call assertion
label516:
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
