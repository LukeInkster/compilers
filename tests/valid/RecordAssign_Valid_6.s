
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rbx
	movq %rbx, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label430
label430:
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
	addq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label432
	addq $16, %rsp
	movq $1, %rax
	jmp label433
label432:
	movq $0, %rax
label433:
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
	jnz label434
	addq $16, %rsp
	movq $1, %rax
	jmp label435
label434:
	movq $0, %rax
label435:
	movq %rax, %rdi
	call assertion
label431:
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
