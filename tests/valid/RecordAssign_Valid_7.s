
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
	movq %rax, 24(%rbp)
label962:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
label963:
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
