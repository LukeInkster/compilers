
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $3, %rax
	movq %rax, %rbx
	incq %rbx
	imulq $8, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, -8(%rbp)
	movq %rax, 0(%rbx)
	movq $1, %rcx
	addq $8, %rbx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rbx, %rdi
	movq %rax, %rsi
	movq %rcx, %rdx
	call intnfill
	movq %rax, %rbx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq $16, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, -16(%rbp)
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
label1168:
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
