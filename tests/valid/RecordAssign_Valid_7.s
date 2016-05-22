
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
label946:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $3, %rax
	movq %rax, 8(%rsp)
label947:
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
