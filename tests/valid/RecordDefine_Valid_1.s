
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq %rax, 16(%rbp)
	movq 40(%rbp), %rax
	movq %rax, 24(%rbp)
	jmp label516
label516:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $1, %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -24(%rsp), %rax
	movq %rax, -8(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $1, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label518
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label518
	addq $32, %rsp
	movq $1, %rax
	jmp label519
label518:
	movq $0, %rax
label519:
	movq %rax, %rdi
	call assertion
label517:
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
