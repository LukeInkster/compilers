
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 16(%rbp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq 40(%rbp), %rbx
	movq %rbx, 8(%rax)
	movq 32(%rbp), %rbx
	movq %rbx, 16(%rax)
	movq 24(%rbp), %rbx
	movq %rbx, 24(%rax)
	jmp label10
label10:
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
	movq -8(%rbp), %rax
	movq %rax, %rdi
	call prnintn
label11:
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
