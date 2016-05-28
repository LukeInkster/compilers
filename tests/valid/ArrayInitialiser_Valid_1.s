
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $32, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rax, 16(%rbp)
	movq $3, %rbx
	movq %rbx, 16(%rbp)
	movq 40(%rbp), %rbx
	movq %rbx, 24(%rbp)
	movq 32(%rbp), %rbx
	movq %rbx, 32(%rbp)
	movq 24(%rbp), %rbx
	movq %rbx, 40(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $2, %rax
	movq %rax, 16(%rsp)
	movq $1, %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -8(%rbp)
label1:
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
